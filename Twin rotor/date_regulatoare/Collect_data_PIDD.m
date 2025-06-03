clear all; close all; clc;
%Coect data for Multi PID

% Încarcă datele de bază
load("D:\MATLAB\An 3 Exercitii\Twin rotor\Twin-Rotor-System\Twin rotor\date.mat");

% Adaugă calea către directoare
addpath('D:\MATLAB\Licenta_fractionar\Twin-Rotor-System\Twin rotor\date_regulatoare\Reg_PIDD2');


% Definire căi pentru toate tipurile de regulatoare
folderPaths = {
    'D:\MATLAB\Licenta_fractionar\Twin-Rotor-System\Twin rotor\date_regulatoare\Reg_PIDD2\H11',
    'D:\MATLAB\Licenta_fractionar\Twin-Rotor-System\Twin rotor\date_regulatoare\Reg_PIDD2\H22'

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
            loadedData(iii).(varNames{j}) = data.(varNames{j});
        end
    end
end

%%
H11_ISE=tf(minreal(oustapp(loadedData(1).RegPIDD_H11_ISE.regulator,1e-3,10,7)))


%minreal(oustapp(Gc, 1e-3, 10, 7));

H11_ITSE=loadedData.RegPIDD_H11_ITSE;
H11_IAE=loadedData.RegPIDD_H11_IAE;
H11_ITAE=loadedData.RegPIDD_H11_ITAE;


H22_ISE=loadedData(2).RegPIDD_H22_ISE;
H22_ITSE=loadedData(2).RegPIDD_H22_ITSE;
H22_IAE=loadedData(2).RegPIDD_H22_IAE.regulator;
H22_ITAE=loadedData(2).RegPIDD_H22_ITAE;