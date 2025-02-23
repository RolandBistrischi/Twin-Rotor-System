clc;close all;
% Definim procesul
H11=tf(8072.8,[1 1.287]);
step(feedback(H11,1))

% Definire structură Hp cu câmpuri corecte
Hp = struct('regulator', H11, 'raspuns', 0.000485, 'ridicare', 0.000272);


% Optimizăm PID
C_o = PSO_CalculPID(Hp);

% Afișăm rezultatele
fprintf('Cel mai bun PID găsit:\n Kp = %.4f, Ki = %.4f, Kd = %.4f\n', ...
        C_o(1), C_o(2), C_o(3));
C_opt=pid( C_o(1), C_o(2), C_o(3))

% Simulare și afișare răspuns
T_closed =minreal( feedback(C_opt * H11, 1))
t = 0:0.000001:30;
r = ones(size(t));
[y, ~] = lsim(T_closed, r, t);

figure;
plot(t, y, 'b', 'LineWidth', 1.5);
hold on;
plot(t, r, 'r--', 'LineWidth', 1.5);
title('Răspuns sistem PID optimizat');
xlabel('Timp [s]');
ylabel('Răspuns');
legend('Sistem optimizat', 'Referință');
grid on;

figure;
step(T_closed);
