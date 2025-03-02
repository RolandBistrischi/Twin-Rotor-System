% MultiPID
clc;clear all; close all;
addpath('D:\MATLAB\Licenta_fractionar\Twin-Rotor-System\Twin rotor\proiect\functii\');
addpath('D:\MATLAB\Licenta_fractionar\Twin-Rotor-System\Twin rotor\proiect\');
H11=tf(8072.8,[1 1.287]);
H22= tf(33157,[1 3.527]);

%Optimizare gestionare parpool
poolobj = gcp('nocreate'); % Obține pool-ul existent
if isempty(poolobj)
    parpool('Processes', 8); % 4 workeri pentru eficiență
elseif poolobj.NumWorkers ~= 8
    delete(poolobj);
    parpool('Processes', 8);
end

G=H11;
criteriu='iae';
%criteriu_combinat=[0.5,0.5,0.5,0.5,0.5];
criteriu_combinat=0;


n = 20;
RegFrac_H11_IAE(n) = struct('regulator', [], 'runtime', [],'iteration',[],'best',[]);

parfor i = 1:n
    tic; % Start cronometru

    [reg,iteration,best_cf_ac] = PSO(G, i, criteriu,criteriu_combinat);
    runtime = toc; % Oprește cronometru și salvează durata

    RegFrac_H11_IAE(i).regulator = reg;
    RegFrac_H11_IAE(i).runtime = runtime;
    RegFrac_H11_IAE(i).iteration=iteration;
    RegFrac_H11_IAE(i).best=best_cf_ac;
end
%%
for i=1:20;
Min_J=min( RegFrac_H11_IAE(i).best)

Gc = minreal(oustapp(RegFrac_H11_IAE(i).regulator, 1e-3, 10, 7));
Gcf_global=minreal(feedback(Gc*G,1));

%figure;
%hold on
Gf_initial=minreal(feedback(G,1));
%step(Gf_initial);
%step(Gcf_global);
%hold off
%%
figure;
bode(G);hold on
bode(Gc*G);

%%
%pt H22    init=24;
%pt H11    init=3;
init=1;
iteration=init:RegFrac_H11_IAE(i).iteration;
figure
plot(iteration,RegFrac_H11_IAE(i).best(init:end),'r--','LineWidth',2);xlabel('iteration');ylabel(['Cost (' criteriu ')']);
legend([criteriu ' for PSO-PID']);
title('Error with each iteration');



end


%%
function [Gc_fotf,iteration,best_cf_ac]=PSO(G, n_terms,criteriu,criteriu_combinat)
particles = 70;
if n_terms>6
    particles = round(50*n_terms/4);
end

% Parametrii PSO
c = 2; w = 0.7; iteration = 70;
K_min = -10; K_max = 100;
frac_min = -1; frac_max = 1;

% Inițializări
ITAE = inf(1, particles);
ITAEp = ITAE;
best_cf_ac = zeros(1, iteration);
v = zeros(particles, 2 * n_terms);
x = v;
xp = x;

% Inițializare particule
for m = 1:particles
    v(m, :) = 0;
    x(m, 1:n_terms) = K_min + rand(1, n_terms) .* (K_max - K_min);           % K
    x(m, n_terms+1:2*n_terms) = frac_min + rand(1, n_terms) .* (frac_max - frac_min); % Alpha
    xp(m, :) = x(m, :);

    % Construim regulatorul Multi-PID
    K = x(m, 1:n_terms);
    alpha = x(m, n_terms+1:2*n_terms);
    Gc = fotf(1,0,K, alpha);

    % Calculăm ITAE
    ITAE(m) = costFunction(Gc, G, criteriu, criteriu_combinat);
end

% Găsim cea mai bună soluție inițială
[Best_Performance, location] = min(ITAE);
fg = Best_Performance;
xg = x(location, :);

% Algoritmul PSO
for i = 1:iteration
    for m = 1:particles
        % Actualizare viteză și poziție
        for n = 1:2 * n_terms
            v(m, n) = (w * v(m, n)) + (c * rand * (xp(m, n) - x(m, n))) + (c * rand * (xg(n) - x(m, n)));
            x(m, n) = x(m, n) + v(m, n);
        end

        % Verificare limite
        x(m, 1:n_terms) = max(K_min, min(K_max, x(m, 1:n_terms)));
        x(m, n_terms+1:2*n_terms) = max(frac_min, min(frac_max, x(m, n_terms+1:2*n_terms)));

        % Construim regulatorul actualizat
        K = x(m, 1:n_terms);
        alpha = x(m, n_terms+1:2*n_terms);
        Gc = fotf(1,0,K, alpha);

        % Calculăm costul
        ITAEp(m) = costFunction(Gc, G, criteriu, criteriu_combinat);

        % Actualizare locală
        if ITAEp(m) < ITAE(m)
            ITAE(m) = ITAEp(m);
            xp(m, :) = x(m, :);
        end
    end

    % Actualizare globală
    [B_fg, location] = min(ITAE);
    if B_fg < fg
        fg = B_fg;
        xg = xp(location, :);
    end

    % Salvăm progresul
    best_cf_ac(i) = fg;
end

% Afișăm rezultatele
%Min_ITAE = fg;
K_opt = xg(1:n_terms);
alpha_opt = xg(n_terms+1:2*n_terms);

% Reconstruim regulatorul final
Gc_fotf = fotf(1,0,K_opt, alpha_opt);
%Gc = minreal(oustapp(Gc_fotf, 1e-3, 10, 7));
end