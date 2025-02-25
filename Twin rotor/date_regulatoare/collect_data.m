clear all;close all;clc;
load("D:\MATLAB\An 3 Exercitii\Twin rotor\Twin-Rotor-System\Twin rotor\date.mat");

addpath('D:\MATLAB\Licenta_fractionar\Twin-Rotor-System\Twin rotor\date_regulatoare\Reg_PID\');
% Directorul unde ai fișierele .mat
folderPath = 'D:\MATLAB\Licenta_fractionar\Twin-Rotor-System\Twin rotor\date_regulatoare\Reg_PID\H11\';
folderPath_fopid='D:\MATLAB\Licenta_fractionar\Twin-Rotor-System\Twin rotor\date_regulatoare\Reg_FOPID\H11';


folderPath=folderPath_fopid
% Listează toate fișierele .mat din director
files = dir(fullfile(folderPath, '*.mat'));

% Parcurge fiecare fișier și încarcă-l
for i = 1:length(files)
    fileName = files(i).name;
    filePath = fullfile(folderPath, fileName);
    
    fprintf('Se încarcă: %s\n', fileName); % Afișează ce fișier încarcă
    load(filePath);
end

folderPath = 'D:\MATLAB\Licenta_fractionar\Twin-Rotor-System\Twin rotor\date_regulatoare\Reg_PID\H22\';
folderPath_fopid='D:\MATLAB\Licenta_fractionar\Twin-Rotor-System\Twin rotor\date_regulatoare\Reg_FOPID\H22';
folderPath=folderPath_fopid
% Listează toate fișierele .mat din director
files = dir(fullfile(folderPath, '*.mat'));

% Parcurge fiecare fișier și încarcă-l
for i = 1:length(files)
    fileName = files(i).name;
    filePath = fullfile(folderPath, fileName);
    
    fprintf('Se încarcă: %s\n', fileName); % Afișează ce fișier încarcă
    load(filePath);
end


%%
clc;
Gc1=RegFOPID_H11_sensibility.regulator
Gc2=RegFOPID_H22_sensibility.regulator
%%

H11=tf(8072.8,[1 1.287]);
H22= tf(33157,[1 3.527]);

Gc11 = minreal(oustapp(Gc1, 1e-3, 10, 7))
Gcf_global=minreal(feedback(Gc11*H11,1));
%figure;step(Gcf_global);

Gc22 = minreal(oustapp(Gc2, 1e-3, 10, 7))
Gcf_global=minreal(feedback(Gc22*H22,1));





