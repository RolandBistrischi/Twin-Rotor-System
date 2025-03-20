clear all; close all; clc;
%Coect data for Multi PID

% Încarcă datele de bază
load("D:\MATLAB\An 3 Exercitii\Twin rotor\Twin-Rotor-System\Twin rotor\date.mat");

% Adaugă calea către directoare
addpath('D:\MATLAB\Licenta_fractionar\Twin-Rotor-System\Twin rotor\date_regulatoare\Reg_MultiPID');


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
%%
H11_ISE=loadedData.RegFrac_H11_ISE;
H11_ITSE=loadedData.RegFrac_H11_ITSE;
H11_IAE=loadedData.RegFrac_H11_IAE;
H11_ITAE=loadedData.RegFrac_H11_ITAE;


H22_ISE=loadedData(2).RegFrac_H22_ISE;
H22_ITSE=loadedData(2).RegFrac_H22_ITSE;
H22_IAE=loadedData(2).RegFrac_H22_IAE;
H22_ITAE=loadedData(2).RegFrac_H22_ITAE;

%%
close all;clc;
n=20;
H11=tf(8072.8,[1 1.287]);
H22= tf(33157,[1 3.527]);
G=H11;
criteriu='ise';

t=1:20;
for i=1:20
    y(i)=H11_ISE(i).best(end);

end

figure;
plot(t,y);

%%
y=0;
G11_ISE=sortare(H11_ISE);
G11_ISE=G11_ISE(1:6);
t=1:6;
for i=1:6
    y(i)=G11_ISE(i).best(end);
end

figure;
plot(t,y);
%%
clc;close all;
afisare(G11_ISE,H11,'ise','step','bode','PSO');

%%

G11_ISE=sortare(H11_ISE);
G11_ISE=G11_ISE(1:6);
t=1:6;
for i=1:6
    y(i)=G11_ISE(i).best(end);
end
%%
G11_ITSE=sortare(H11_ITSE);
G11_ITSE=G11_ITSE(1:6);
t=1:length(G11_ITSE);
y=0;
for i=1:length(G11_ITSE)
    y(i)=G11_ITSE(i).best(end);
end
figure;
plot(t,y);

close all;clc
afisare(G11_ITSE,H11,'itse','step','bode','PSO');
%%
close all;clc
G11_IAE=sortare(H11_ITSE);
G11_IAE=G11_IAE(1:6);
t=1:length(G11_IAE);
y=0;
for i=1:length(G11_IAE)
    y(i)=G11_IAE(i).best(end);
end
figure;
plot(t,y);

afisare(G11_IAE,H11,'iae','step','bode','PSO');


%%
close all;clc;

G11_ITAE=sortare(H11_ITSE);
G11_ITAE=G11_ITAE(1:6);
t=1:length(G11_ITAE);
y=0;
for i=1:length(G11_ITAE)
    y(i)=G11_ITAE(i).best(end);
end
figure;
plot(t,y);


afisare(G11_ITAE,H11,'iae','step','bode','PSO');


Reg_H11_MultiPID=[G11_ISE,G11_ITSE,G11_IAE,G11_ITAE ];












%%
clc;close all;
y=0;
G22_ISE=sortare(H11_ISE);
G22_ISE=G22_ISE(1:6);
t=1:6;
for i=1:6
    y(i)=G22_ISE(i).best(end);
end

figure;
plot(t,y);
afisare(G22_ISE,H22,'ise','step','bode','PSO');

%%
close all;clc
G22_ITSE=sortare(H11_ITSE);
G22_ITSE=G22_ITSE(1:6);
t=1:length(G22_ITSE);
y=0;
for i=1:length(G22_ITSE)
    y(i)=G22_ITSE(i).best(end);
end
figure;
plot(t,y);


afisare(G22_ITSE,H22,'itse','step','bode','PSO');
%%
close all;clc
G22_IAE=sortare(H11_ITSE);
G22_IAE=G22_IAE(1:6);
t=1:length(G22_IAE);
y=0;
for i=1:length(G22_IAE)
    y(i)=G22_IAE(i).best(end);
end
figure;
plot(t,y);

afisare(G22_IAE,H22,'iae','step','bode','PSO');


%%
close all;clc;

G22_ITAE=sortare(H11_ITSE);
G22_ITAE=G22_ITAE(1:6);
t=1:length(G22_ITAE);
y=0;
for i=1:length(G22_ITAE)
    y(i)=G22_ITAE(i).best(end);
end
figure;
plot(t,y);

afisare(G22_ITAE,H22,'iae','step','bode','PSO');


Reg_H22_MultiPID=[G22_ISE,G22_ITSE,G22_IAE,G22_ITAE ];











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










function afisare(reg, G, criteriu, varargin)

 if isempty(varargin) || ~islogical(varargin{end})
        hold_ = true; % Implicit
    else
        hold_ = varargin{end};
        varargin = varargin(1:end-1); % Elimină `hold_` din listă
 end

arg = varargin; % Extrage tipurile de plot

% Inițializează figurile o singură dată
figHandles = struct();
if any(strcmpi(arg, 'step')), figHandles.step = figure; title('Step Response'); xlabel('Time (s)'); ylabel('Response'); end
if any(strcmpi(arg, 'bode')), figHandles.bode = figure; title('Bode Diagram'); end
if any(strcmpi(arg, 'PSO')), figHandles.pso = figure; hold on; title('PSO Optimization Progress'); xlabel('Iteration'); ylabel(['Cost (' criteriu ')']); end

Gf_initial = minreal(feedback(G, 1));
for i = 1:length(reg)
    Gc = minreal(oustapp(reg(i).regulator, 1e-3, 10, 7));
    Gcf_global = minreal(feedback(Gc * G, 1));

    % STEP RESPONSE
    if any(strcmpi(arg, 'step'))
        if hold_
            figure(figHandles.step);
            if i == 1, step(Gf_initial, 'r--');hold on; end
            step(Gcf_global);
        else
            figure; step(Gf_initial, 'r--');hold on;
            step(Gcf_global);
        end
    end

    % BODE PLOT
    if any(strcmpi(arg, 'bode'))
        if hold_
            figure(figHandles.bode);
            if i == 1, bode(G, 'r--'); hold on; end
            bode(Gc * G);
        else
            figure;  bode(G, 'r--'); hold on;
            bode(Gc * G);
        end
    end

    % PSO PROGRESS
    if any(strcmpi(arg, 'PSO'))
          idx = find(reg(i).best < max(reg(i).best), 1, 'first');
           iteration = idx:reg(i).iteration; % Începe plotul de la `idx`
        if hold_
            figure(figHandles.pso);
            hold on;
        else
            figure;
        end
        plot(iteration, reg(i).best(idx:end), 'r--', 'LineWidth', 2);
    end
end

% Dezactivează hold după ce a terminat toate ploturile
if hold_, hold off; end

end
