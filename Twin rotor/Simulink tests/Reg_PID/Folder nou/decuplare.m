s = tf('s');
G11 = 6275 / (0.7773 * s + 1);
G12 = -8.597 / (0.1762 * s + 1);
G21 = -11.81 / (0.7562 * s + 1);
G22 = 9400 / (0.2835 * s + 1);

% Matricea de sistem
G = [G11 G12;
     G21 G22];

% Compensatorul dinamic
D = [1, -G12/G11;
     -G21/G22, 1]

% Sistem decuplat
G_decuplat = zpk(minreal(G * D));

% Verificare
step(G_decuplat)
title('Răspunsul sistemului decuplat dinamic')
%%

G=[G11, G12;
    G21, G22];

D=minreal(G^-1);

HH=[G11, 0;
    0, G22];

DD=minreal(D*HH)

CCCC=HH*DD;
%%
figure;step(G11)

%%
DDD=[0.00015936,   6.4297e-07 * (s+1.287)/(s+5.675);
       7.5063e-08 *(s+3.527)/ (s+1.322)        ,   0.00010638];


%DDD=[1,           0.0060439*(s+3.5273)*(s+1.287)/((s+5.6754)*(s+3.527));
%    0.000047102*(s+3.5273)*(s+1.2865)/((s+1.3224)*(s+1.287))    1];


G_decuplat = zpk(minreal(G * DD));

% Verificare
step(G_decuplat)
title('Răspunsul sistemului decuplat dinamic')


%%
close all;clc
% Definirea sistemului
% Definește regulatorul și procesul
Hr = pid(4.491050778047862, 2.91060966950295); % Regulator PID (continuu)
%Hr=pid(0.1,0.5);
H11 = tf(8072.8, [1 1.287]);           % Proces H11

% Parametri simulare
dt = 0.001;                           % Pas de timp
Tsim = 5;                             % Timp total
t = 0:dt:Tsim;
N = length(t);
r = 10*ones(1, N);                       % Semnal de referință

% Inițializare vectori
e = zeros(1, N);
u = zeros(1, N);
y = zeros(1, N);

% Inițializare stări
x_reg = [];                          % stare regulator
x_proc = [];                         % stare proces

% Simulare pas cu pas
for k = 2:N
    % Eroare
    e(k) = r(k) - y(k-1);

    % Răspunsul regulatorului Hr la eroare
    [u_sim, ~, x_reg] = lsim(Hr, [e(k-1), e(k)], [0, dt], x_reg);
    u(k) = u_sim(end);

    % Limitare semnal de comandă
    u(k) = max(min(u(k), 1), -1);

    % Aplicare semnal de comandă asupra procesului Gp
    [y_sim, ~, x_proc] = lsim(H11, [u(k-1), u(k)], [0, dt], x_proc);
    y(k) = y_sim(end);
end

% Afișare rezultate
figure;
subplot(2,1,1);
plot(t, y, 'LineWidth', 1.5);
title('Ieșire sistem (y)'); ylabel('y(t)');

subplot(2,1,2);
plot(t, u, 'LineWidth', 1.5);
title('Semnal de comandă (u)'); ylabel('u(t)'); xlabel('Timp [s]');


figure; plot(t, e, 'LineWidth', 1.5);

