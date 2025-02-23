clear ll;close all;
load("D:\MATLAB\An 3 Exercitii\Twin rotor\Twin-Rotor-System\Twin rotor\date.mat");

addpath('D:\MATLAB\Licenta_fractionar\Twin-Rotor-System\Twin rotor\date_regulatoare\Reg_PID\');
% Directorul unde ai fișierele .mat
folderPath = 'D:\MATLAB\Licenta_fractionar\Twin-Rotor-System\Twin rotor\date_regulatoare\Reg_PID\H11\';

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

% Listează toate fișierele .mat din director
files = dir(fullfile(folderPath, '*.mat'));

% Parcurge fiecare fișier și încarcă-l
for i = 1:length(files)
    fileName = files(i).name;
    filePath = fullfile(folderPath, fileName);
    
    fprintf('Se încarcă: %s\n', fileName); % Afișează ce fișier încarcă
    load(filePath);
end














