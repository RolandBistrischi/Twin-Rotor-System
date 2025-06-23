%Date din simulink pt TID
close all;clear all; clc;
load("D:\MATLAB\An 3 Exercitii\Twin rotor\Twin-Rotor-System\Twin rotor\date.mat");
%%
azimuth=load("D:\MATLAB\Licenta_fractionar\Twin-Rotor-System\Twin rotor\Simulink tests\Reg_MultiPID\ITSE\date_step_azimuth.mat");
pitch=load("D:\MATLAB\Licenta_fractionar\Twin-Rotor-System\Twin rotor\Simulink tests\Reg_MultiPID\ITSE\date_step_pitch.mat");

azimuth_az_intrare=azimuth.out.azimuth_regulator_step_azimuth;

azi_time=azimuth_az_intrare.Time;
ref_azi_step_azi=azimuth_az_intrare.Data(:,1);
azimuth_rpm_step_azi=azimuth_az_intrare.Data(:,2:8);
azimuth_rpm_step_azi=[  azimuth_az_intrare.Data(:,3), azimuth_az_intrare.Data(:,4) ,       azimuth_az_intrare.Data(:,8)];

azimuth_pos_step_azi=azimuth_az_intrare.Data(:,9:15);

figure;
plot(azi_time, azimuth_rpm_step_azi);
legend('ord 1 cu ord 1', 'ord 2 cu ord 3',      'inițial');
title({'Evaluarea performanței regulatoarelor optimizate pentru controlul' , ...
       ' azimutului pentru un răspuns la un semnal treaptă'});
xlabel('Timp [s]');
ylabel('Viteză de rotație [RPM]');

% Adaugă un inset (axă mică de zoom in)
axInset = axes('Position', [0.6, 0.2, 0.3, 0.3]); % [x y width height], valori între 0 și 1
box on; % ramă în jurul inset-ului
index = azi_time >=2.5*10-4 & azi_time <=6*10-2; % ajustează după zona care te interesează
index = azi_time >=0.0001 & azi_time <=0.005; % ajustează după zona care te interesează


plot(azi_time(index), azimuth_rpm_step_azi(index,1:end-1), 'LineWidth', 1.5);
title('Zoom-in');


%%
% pitch_az_intrare=azimuth.out.pitch_regulator_step_azimuth;
% 
% pit_time=pitch_az_intrare.Time;
% ref_pit_step_azi=pitch_az_intrare.Data(:,1);
% pitch_rpm_step_azi=pitch_az_intrare.Data(:,2:6);
% pitch_pos_step_azi=pitch_az_intrare.Data(:,7:11);
% 
% 
% figure;
% plot(azi_time(1:180), azimuth_rpm_step_azi(1:180,:));
% legend('ISE','ITSE','IAE','ITAE','inițial');
% title({'Evaluarea performanței regulatoarelor optimizate pentru controlul' , ...
%        ' pitch-ului pentru un răspuns la un semnal treaptă'});
% xlabel('Timp [s]');
% ylabel('Viteză de rotație [RPM]');
% 
% % Adaugă un inset (axă mică de zoom in)
% axInset = axes('Position', [0.6, 0.2, 0.3, 0.3]); % [x y width height], valori între 0 și 1
% box on; % ramă în jurul inset-ului
% index = azi_time >=2.5*10-4 & azi_time <=6*10-3; % ajustează după zona care te interesează
% index = azi_time >=0.00002 & azi_time <=0.0005; % ajustează după zona care te interesează
% 
% 
% plot(azi_time(index), azimuth_rpm_step_azi(index,1:end-1), 'LineWidth', 1.5);
% title('Zoom-in');

%%












azimuth_pit_intrare=pitch.out.azimuth_regulator_step_pitch;

azi_time=azimuth_pit_intrare.Time;
ref_azi_step_pit=azimuth_pit_intrare.Data(:,1);
azimuth_rpm_step_pit=azimuth_pit_intrare.Data(:,2:6);
azimuth_pos_step_pit=azimuth_pit_intrare.Data(:,7:11);

figure;plot(azi_time,azimuth_rpm_step_pit);legend('ISE','ITSE','IAE','ITAE','fara regulator');title('Comparatie Azimuth RPM cu si fara regulator pentru trapta la pitch');xlabel('timp');ylabel('referinta')
%figure;plot(azi_time,azimuth_pos_step_azi);


%%
pitch_pit_intrare=pitch.out.pitch_regulator_step_pitch;

pitch_time=pitch_pit_intrare.Time;
ref_pit_step_pit=pitch_pit_intrare.Data(:,1);
pitch_rpm_step_pit=pitch_pit_intrare.Data(:,2:8);
pitch_pos_step_pit=pitch_pit_intrare.Data(:,9:15);

pitch_rpm_step_pit=[  pitch_pit_intrare.Data(:,3) ,    pitch_pit_intrare.Data(:,4),     pitch_pit_intrare.Data(:,8)];


%figure;legend('ISE','ITSE','IAE','ITAE','fara regulator');title('Comparatie Pitch RPM cu si fara regulator pentru trapta la pitch');xlabel('timp');ylabel('referinta')
%figure;plot(azi_time,pitch_pos_step_azi);

figure;
plot(pitch_time,pitch_rpm_step_pit);
legend('ord 1 cu ord 1', 'ord 2 cu ord 3',      'inițial');
title({'Evaluarea performanței regulatoarelor optimizate pentru controlul' , ...
       ' pitch-ului pentru un răspuns la un semnal treaptă'});
xlabel('Timp [s]');
ylabel('Viteză de rotație [RPM]');

% Adaugă un inset (axă mică de zoom in)
axInset = axes('Position', [0.6, 0.2, 0.3, 0.3]); % [x y width height], valori între 0 și 1
box on; % ramă în jurul inset-ului
index = pitch_time >=2.5*10-4 & pitch_time <=6*10-1; % ajustează după zona care te interesează
index = pitch_time >=0.00002 & pitch_time <=0.04; % ajustează după zona care te interesează


plot(pitch_time(index), pitch_rpm_step_pit(index,1:end-1), 'LineWidth', 1.5);
title('Zoom-in');





























%%
% Definire căi pentru toate tipurile de regulatoare
%load('D:\MATLAB\Licenta_fractionar\Twin-Rotor-System\Twin rotor\date_regulatoare\Reg_MultiPID\MultiPID_sortat.mat')
%%
% Adaugă calea către directoare
addpath('D:\MATLAB\Licenta_fractionar\Twin-Rotor-System\Twin rotor\date_regulatoare\Reg_MultiPID');
load("D:\MATLAB\An 3 Exercitii\Twin rotor\Twin-Rotor-System\Twin rotor\date.mat");

clc

% Definire căi pentru toate tipurile de regulatoare
folderPaths = {
    'D:\MATLAB\Licenta_fractionar\Twin-Rotor-System\Twin rotor\date_regulatoare\Reg_MultiPID\H11',
    'D:\MATLAB\Licenta_fractionar\Twin-Rotor-System\Twin rotor\date_regulatoare\Reg_MultiPID\H22'

    };

% Inițializează structura goală ca un array de structuri
%loadedData(length(folderPaths)) = struct('reg',[]);

% Parcurge toate căile și încarcă fișierele
loadedData = struct();  % Inițializare vector de structuri

% Parcurge toate căile și încarcă fișierele
for iii = 1:length(folderPaths)
    folderPath = folderPaths{iii};
    files = dir(fullfile(folderPath, '*.mat'));

    for i = 1:length(files)
        fileName = files(i).name;
        filePath = fullfile(folderPath, fileName);

        fprintf('Se încarcă: %s\n', fileName);
        data = load(filePath);

        % Adaugă toate variabilele încărcate în structura nouă
        varNames = fieldnames(data);
        for j = 1:length(varNames)
            a=sortare(data.(varNames{j}));
            loadedData(iii).(varNames{j}) = a(1:6);
        end
    end
end

%load("D:\MATLAB\An 3 Exercitii\Twin rotor\Twin-Rotor-System\Twin rotor\date.mat");
% %% Procesare regulatoare
% clc;
% 
% % Funcție pentru procesare regulator
% 
% 
% % Procesează regulatoarele pentru H11 și H22
% Reg_TFOIDFFID_H11 = [
%     loadedData(1).RegTFOIDFFID_H11_ISE,
%    loadedData(1).RegTFOIDFFID_H11_ITSE, 
%     loadedData(1).RegTFOIDFFID_H11_IAE, 
%     loadedData(1).RegTFOIDFFID_H11_ITAE,
%    % loadedData(1).RegTID_H11_sensibility
% ]
% 
% Reg_TFOIDFFID_H22 = [
%    loadedData(2).RegTFOIDFFID_H22_ISE, ...
%   loadedData(2).RegTFOIDFFID_H22_ITSE, ...
%    loadedData(2).RegTFOIDFFID_H22_IAE, ...
%    loadedData(2).RegTFOIDFFID_H22_ITAE, ...
%    % loadedData(2).RegTID_H22_sensibility
% ];

%%
% Reg_TID_H11=[minreal(oustapp( loadedData(1).RegTID_H11_ISE.regulator)) ,
%  minreal(oustapp( loadedData(1).RegTID_H11_ITSE.regulator))    ,
%  minreal(oustapp( loadedData(1).RegTID_H11_IAE.regulator))    ,
%  minreal(oustapp( loadedData(1).RegTID_H11_ITAE.regulator))    ,
% % minreal(oustapp( loadedData(1).RegTID_H11_sensibility.regulator ))     
%  ]
% % 
% % Reg_TID_H22=[minreal(oustapp(  loadedData(2).RegTID_H22_ISE.regulator)) ,
% % minreal(oustapp( loadedData(2).RegTID_H22_ITSE.regulator))     ,
% % minreal(oustapp( loadedData(2).RegTID_H22_IAE.regulator))     ,
% %  minreal(oustapp( loadedData(2).RegTID_H22_ITAE.regulator))    ,
% %  % minreal(oustapp( loadedData(2).RegTID_H22_sensibility.regulator ))   
% %   ]
legend('ord 1 cu ord 1', 'ord 2 cu ord 3',      'inițial');
%%
clc;
%Hr=loadedData(2).RegTID_H22_IAE.regulator;

BBBBBBBB1= loadedData(1).RegFrac_H11_ITSE(3)  .regulator;
BBBBBBBB2= loadedData(2).RegFrac_H22_ITSE(3) .regulator;
H11_MultiPID_ITSE= minreal(oustapp(BBBBBBBB1));

H22_MultiPID_ITSE= minreal(oustapp( BBBBBBBB2));


[num_MultiPID_ITSE11, den_MultiPID_ITSE11] = tfdata(tf(H11_MultiPID_ITSE), 'v');

[num_MultiPID_ITSE22, den_MultiPID_ITSE22] = tfdata(tf(H22_MultiPID_ITSE), 'v');




%%
H11=tf(8072.8,[1 1.287]);
H22= tf(33157,[1 3.527]);

close all;
figure;
hold on;

% Plot Bode pentru sistemul inițial
bode(H11, 'b--');  % Linie întreruptă pentru sistemul inițial

% Plot pentru fiecare regulator din Reg_PID_H11
for i = 1:length(Reg_TID_H11)
    Gc =minreal(oustapp( Reg_TID_H11(i).regulator));
    bode(Gc * H11);
end

% Adaugă titlu, legende și etichete
title('Diagrama Bode pentru H11 și regulatoare TID');
%legend_entries = ['Sistem inițial'; arrayfun(@(x) sprintf('Regulator %d', x), 1:length(Reg_PID_H11), 'UniformOutput', false)];
%legend(legend_entries, 'Location', 'Best');
legend("H11",'ISE','ITSE','IAE','ITAE')
xlabel('Frecvență (rad/s)');
ylabel('Amplitudine și fază');

hold off;

init=5;
figure;
for i = 1:length(Reg_TID_H11)
    a = Reg_TID_H11(i).iteration;  % Accesează numărul de iterații pentru acest regulator
    iteration = 1:a;  % Vectorul de iterații

    % Accesează vectorul 'best' pentru fiecare regulator
    best_values = Reg_TID_H11(i).best(init:end);
    % Asigură-te că lungimea lui 'iteration' și 'best_values' sunt egale
    if length(iteration) ~= length(best_values)
        iteration = iteration(1:length(best_values));  % Ajustează lungimea dacă e nevoie
    end

    plot(iteration, best_values, 'LineWidth', 2);hold on;
end

xlabel('Iteratii');ylabel(['Cost']);
legend('ISE','ITSE','IAE','ITAE')

title('Eroarea pentru regulatorul lui H11 folosind PSO');


%%

close all;
figure;
hold on;

% Plot Bode pentru sistemul inițial
bode(H22, 'b--');  % Linie întreruptă pentru sistemul inițial

for i = 1:length(Reg_TID_H22)
    Gc =minreal(oustapp( Reg_TID_H22(i).regulator));
    bode(Gc * H22);
end

% Adaugă titlu, legende și etichete
title('Diagrama Bode pentru H22 și regulatoare TID');
legend("H22",'ISE','ITSE','IAE','ITAE')
xlabel('Frecvență (rad/s)');
ylabel('Amplitudine și fază');

hold off;

init=8;
figure;
for i = 1:length(Reg_TID_H22)
    a = Reg_TID_H22(i).iteration;  % Accesează numărul de iterații pentru acest regulator
    iteration = 1:a;  % Vectorul de iterații

    % Accesează vectorul 'best' pentru fiecare regulator
    best_values = Reg_TID_H22(i).best(init:end);
    % Asigură-te că lungimea lui 'iteration' și 'best_values' sunt egale
    if length(iteration) ~= length(best_values)
        iteration = iteration(1:length(best_values));  % Ajustează lungimea dacă e nevoie
    end

    plot(iteration, best_values, 'LineWidth', 2);hold on;
end

xlabel('Iteratii');ylabel(['Cost']);
legend('ISE','ITSE','IAE','ITAE')


title('Eroarea pentru regulatorul lui H22 folosind PSO');





























%%

function sortedH = sortare(H)
    % Verifică dacă H nu este gol
    if isempty(H)
        sortedH = H;
        return;
    end

    % Creăm un vector cu valorile finale ale lui best pentru fiecare regulator
    bestValues = arrayfun(@(x) x.best(end), H);

    % Obținem ordinea de sortare descrescătoare
    [~, idx] = sort(bestValues,'ascend');

    % Reordonăm structura H în funcție de această ordine
    sortedH = H(idx);
end



