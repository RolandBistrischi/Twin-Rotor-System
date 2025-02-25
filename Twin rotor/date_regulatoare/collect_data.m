clear all; close all; clc;

% Încarcă datele de bază
load("D:\MATLAB\An 3 Exercitii\Twin rotor\Twin-Rotor-System\Twin rotor\date.mat");

% Adaugă calea către directoare
addpath('D:\MATLAB\Licenta_fractionar\Twin-Rotor-System\Twin rotor\date_regulatoare\Reg_PID\');


% Definire căi pentru toate tipurile de regulatoare
folderPaths = {
    'D:\MATLAB\Licenta_fractionar\Twin-Rotor-System\Twin rotor\date_regulatoare\Reg_TID\H11\', ...
    'D:\MATLAB\Licenta_fractionar\Twin-Rotor-System\Twin rotor\date_regulatoare\Reg_TID\H22\', ...
   % 'D:\MATLAB\Licenta_fractionar\Twin-Rotor-System\Twin rotor\date_regulatoare\Reg_PID\H11\', ...
   % 'D:\MATLAB\Licenta_fractionar\Twin-Rotor-System\Twin rotor\date_regulatoare\Reg_PID\H22\', ...
 %   'D:\MATLAB\Licenta_fractionar\Twin-Rotor-System\Twin rotor\date_regulatoare\Reg_FOPID\H11\', ...
  %  'D:\MATLAB\Licenta_fractionar\Twin-Rotor-System\Twin rotor\date_regulatoare\Reg_FOPID\H22\' ...
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


%% Procesare regulatoare
clc;

% Funcție pentru procesare regulator


% Procesează regulatoarele pentru H11 și H22
Reg_TID_H11 = [
    loadedData(1).RegTID_H11_ISE,
   loadedData(1).RegTID_H11_ITSE, 
    loadedData(1).RegTID_H11_IAE, 
    loadedData(1).RegTID_H11_ITAE,
    loadedData(1).RegTID_H11_sensibility
];

Reg_TID_H22 = [
   loadedData(2).RegTID_H22_ISE, ...
  loadedData(2).RegTID_H22_ITSE, ...
   loadedData(2).RegTID_H22_IAE, ...
   loadedData(2).RegTID_H22_ITAE, ...
    loadedData(2).RegTID_H22_sensibility
];

%%
Reg_TID_H11=[minreal(oustapp(RegTID_H11_ISE.regulator)) ,
 minreal(oustapp(RegTID_H11_ITSE.regulator))    ,
 minreal(oustapp(RegTID_H11_IAE.regulator))    ,
 minreal(oustapp(RegTID_H11_ITAE.regulator))    ,
 minreal(oustapp(RegTID_H11_sensibility.regulator ))       ]

Reg_TID_H22=[minreal(oustapp( RegTID_H22_ISE.regulator)) ,
minreal(oustapp(RegTID_H22_ITSE.regulator))     ,
minreal(oustapp(RegTID_H22_IAE.regulator))     ,
 minreal(oustapp(RegTID_H22_ITAE.regulator))    ,
  minreal(oustapp(RegTID_H22_sensibility.regulator ))     ]




%%
Gc1=RegTID_H11_ITAE.regulator
Gc2=RegTID_H22_ITAE.regulator
Gc11 = minreal(oustapp(Gc1, 1e-3, 10, 7))
Gc22 = minreal(oustapp(Gc2, 1e-3, 10, 7))





%%
%
% H11=tf(8072.8,[1 1.287]);
% H22= tf(33157,[1 3.527]);
%

% Gcf_global=minreal(feedback(Gc11*H11,1));
% %figure;step(Gcf_global);
%

% Gcf_global=minreal(feedback(Gc22*H22,1));









% Funcția de încărcare a fișierelor
function loadedData = loadAllFiles(folderPath, loadedData)
    files = dir(fullfile(folderPath, '*.mat'));
    for i = 1:length(files)
        fileName = files(i).name;
        filePath = fullfile(folderPath, fileName);
        
        fprintf('Se încarcă: %s\n', fileName);
        data = load(filePath);

        % Creează o nouă structură pentru fiecare fișier
        newEntry = struct();
        newEntry.fileName = fileName;

        % Adaugă toate variabilele încărcate în structura nouă
        varNames = fieldnames(data);
        for j = 1:length(varNames)
            newEntry.(varNames{j}) = data.(varNames{j});
        end

        % Sincronizează câmpurile înainte de concatenare
        loadedData = syncStructFields(loadedData, newEntry);
    end
end

% Funcție pentru sincronizarea câmpurilor structurilor
function loadedData = syncStructFields(loadedData, newEntry)
    if isempty(loadedData)
        loadedData = newEntry;
    else
        % Obține toate câmpurile unice
        allFields = unique([fieldnames(loadedData)', fieldnames(newEntry)']);
        
        % Completează câmpurile lipsă pentru loadedData
        for i = 1:numel(loadedData)
            missingFields = setdiff(allFields, fieldnames(loadedData(i)));
            for j = 1:numel(missingFields)
                loadedData(i).(missingFields{j}) = [];
            end
        end
        
        % Completează câmpurile lipsă pentru noua intrare
        missingFields = setdiff(allFields, fieldnames(newEntry));
        for j = 1:numel(missingFields)
            newEntry.(missingFields{j}) = [];
        end

        % Adaugă noua structură în array
        loadedData = [loadedData, newEntry];
    end
end



function regs = processRegulators(regStruct)
    regs = [
        minreal(oustapp(regStruct.regulator))
    ];
end










%%


clear all;close all;clc;
load("D:\MATLAB\An 3 Exercitii\Twin rotor\Twin-Rotor-System\Twin rotor\date.mat");

addpath('D:\MATLAB\Licenta_fractionar\Twin-Rotor-System\Twin rotor\date_regulatoare\Reg_PID\');
% Directorul unde ai fișierele .mat
folderPath = 'D:\MATLAB\Licenta_fractionar\Twin-Rotor-System\Twin rotor\date_regulatoare\Reg_PID\H11\';
folderPath_fopid='D:\MATLAB\Licenta_fractionar\Twin-Rotor-System\Twin rotor\date_regulatoare\Reg_FOPID\H11';

folderPath_tid='D:\MATLAB\Licenta_fractionar\Twin-Rotor-System\Twin rotor\date_regulatoare\Reg_TID\H11'
folder_path_all_tid='D:\MATLAB\Licenta_fractionar\Twin-Rotor-System\Twin rotor\date_regulatoare\Reg_TID'

folderPath=folderPath_tid
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
folderPath_tid='D:\MATLAB\Licenta_fractionar\Twin-Rotor-System\Twin rotor\date_regulatoare\Reg_TID\H22'
folderPath=folderPath_tid
% Listează toate fișierele .mat din director
files = dir(fullfile(folderPath, '*.mat'));

% Parcurge fiecare fișier și încarcă-l
for i = 1:length(files)
    fileName = files(i).name;
    filePath = fullfile(folderPath, fileName);

    fprintf('Se încarcă: %s\n', fileName); % Afișează ce fișier încarcă
    load(filePath);
end
