%% regulator FOPID cu cod de la un indian
%https://www.youtube.com/watch?v=qlZxsP-JQsQ
% se foloseste ITAE

%ant colony:   https://www.youtube.com/watch?v=LKCyZ1bRiyM



addpath('D:\MATLAB\Licenta_fractionar\Twin-Rotor-System\Twin rotor\proiect\functii\');
addpath('D:\MATLAB\Licenta_fractionar\Twin-Rotor-System\Twin rotor\proiect\');
addpath(genpath('D:\MATLAB\Licenta_fractionar\Crone'))
savepath;

% Kp = 2;
% Ki = 3;
% Kd = 4;
% lambda = 0.8;
% mu =0.9;

% Gc_fotf = fotf(1,0,[Kp, Ki, Kd], [0, -lambda, mu])
% H=minreal(oustapp(Gc_fotf, 1e-3, 10, 5))
%
%
%
% Gf_initial=feedback(H*G,1);
% figure;step(Gf_initial);title('G initial');
%
% figure;step(feedback(G,1))
% figure; bode(H*G);
% hold on
% bode(G)

%s = tf('s'); % Definește variabila Laplace
%H  = frac_tf(frac_poly_exp([Kp Ki Kd], [0  -lambda  mu]),1) % Creează o funcție de transfer fracționară
% %%
% clc
% num = frac_poly_exp([5], [0])  % Numărător: 5
% den = frac_poly_exp([1 1 1], [1.2 0.5 0]) % Numitor: s^1.2 + s^0.5 + 1
%
% sys = frac_tf(num, den, 5, [1e-3 1e3]); % Crează funcția de transfer fracționară
% %%
% clc;
%  %sys = frac_tf(1, frac_poly_exp([1 1 1], [1.2  0.5  0]), 5, [1e-3  1e3], [], [], 'Oustaloup')
% num = frac_poly_exp(1, 0); % Numărător
% den = frac_poly_exp([1,1,1], [1.2,0.5,0]); % Numitor
%
% sys = frac_tf(num, den) % Funcția de transfer fracționară
%
% H=oustapp(sys)
%
% %bode(H);
%%
clc;clear all; close all;


%G=tf(8072.8,[1 1.287]);%H11
G= tf(33157,[1 3.527]);%H22

criteriu='itae';
%criteriu_combinat=[0.5,0.5,0.5,0.5,0.5];
criteriu_combinat=0;

Gf_initial=feedback(G,1);
step(Gf_initial);title('G initial');



%PSO

c=2;w=0.7;particles=70;iteration=100;Var=3;frac_var=2;

K_min=-10;% lower bound
K_max=100; %upper bound
frac_min=0;
frac_max=1;
%Optimization
c_cf=0;

%Initialization
ITAE=zeros(1,particles);
ITAEp=ITAE;
best_cf_ac=zeros(1,iteration);
v=zeros(particles,Var+frac_var);
x=v;
xp=x;

for m=1:particles

    % Inițializare viteze
    v(m, 1:Var+frac_var) = 0;

    % Inițializare poziții
    x(m, 1:Var) = K_min + rand(1, Var) .* (K_max - K_min);
    x(m, Var+1:Var+frac_var) = frac_min + rand(1, frac_var) .* (frac_max - frac_min);

    % Salvează pozițiile inițiale
    xp(m, :) = x(m, :);

    % Model Parametres
    [kp, ki, kd, lambda, mu] = deal(x(m, 1), x(m, 2), x(m, 3), x(m, 4), x(m, 5));

   
    %Simulation Model
    Gc=fotf(1,0,[kp, ki, kd], [0, -lambda, mu]);
    

    %ITAE
    ITAE(m)=costFunction(Gc,G,criteriu,criteriu_combinat);
end

%Find the best value
[Best_Performance,location]=min(ITAE);
fg=Best_Performance;

xg(1:5)=x(location,1:5);

%Gc_fotf=fotf(1,0,[kp, ki, kd], [0, -lambda, mu]);
%Gc = minreal(oustapp(Gc_fotf, 1e-3, 10, 7));
%Gcf_intermediar=feedback(Gc*G,1);
%figure;step(Gcf_intermediar);title('G intermediar')


%Update

for i=1:iteration      %Nr of Repetition
    for m=1:particles  %Nr of particles

        for n=1:1:(Var + frac_var)  %Nr of variables (kp,ki,kd)
            v(m,n)=(w*v(m,n))+(c*rand*(xp(m,n)-x(m,n)))+(c*rand*(xg(n)-x(m,n)));  %update velocity
            x(m,n)=x(m,n)+v(m,n);
        end

        %Check bound
        % Verificare limite pentru K (reglatori PID)
        x(m, 1:Var) = max(K_min, min(K_max, x(m, 1:Var)));

        % Verificare limite pentru frac_var (exponenți fracționari)
        x(m, Var+1:Var+frac_var) = max(frac_min, min(frac_max, x(m, Var+1:Var+frac_var)));

        %Model Parametres
        % Model Parametres
        [kp, ki, kd, lambda, mu] = deal(x(m, 1), x(m, 2), x(m, 3), x(m, 4), x(m, 5));


        %Simulation Model
        Gc=fotf(1,0,[kp, ki, kd], [0, -lambda, mu]);
        ITAEp(m) = costFunction(Gc, G, criteriu, criteriu_combinat);

        % Compare Local
        if ITAEp(m) < ITAE(m)
            ITAE(m) = ITAEp(m);
            xp(m, :) = x(m, :);
        end

    end
    [B_fg,location]=min(ITAE);

    %Compare Global
    if B_fg<fg
        fg=B_fg;             %Nou global
        xg(1:5)=xp(location,1:5); %pos var 1
    end
    c_cf=c_cf+1;
    best_cf_ac(c_cf)=fg;
end


Min_ITAE=fg

kp=xg(1)
ki=xg(2)
kd=xg(3)
lambda=xg(4)
mu=xg(5)

Gc_fotf=fotf(1,0,[kp, ki, kd], [0, -lambda, mu]);
Gc = minreal(oustapp(Gc_fotf, 1e-3, 10, 7));
Gcf_global=minreal(feedback(Gc*G,1));
figure;step(Gcf_global);
hold on
step(Gf_initial)
hold off
%%
figure;
bode(G);hold on
bode(Gc*G);

%%
%pt H22    init=24;
%pt H11    init=3;
init=3;
t_cf=init:c_cf;
figure
plot(t_cf,best_cf_ac(init:end),'r--','LineWidth',2);xlabel('iteration');ylabel(['Cost (' criteriu ')']);
legend([criteriu ' for PSO-FOPID']);
title('Error with each iteration');


%%
% pt H22

% Min_ITAE =   9.1682e-12
% kp =     0
% ki =   22.5861
% kd =     0
% lambda =    0.3573
% mu =    0.6947








