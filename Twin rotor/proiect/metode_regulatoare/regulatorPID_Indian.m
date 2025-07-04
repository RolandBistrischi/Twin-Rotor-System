%% regulator PID de la un indian
%https://www.youtube.com/watch?v=qlZxsP-JQsQ
% se foloseste ITAE

%ant colony:   https://www.youtube.com/watch?v=LKCyZ1bRiyM
%load("date.mat");

addpath('D:\MATLAB\Licenta_fractionar\Twin-Rotor-System\Twin rotor\proiect\functii\');
addpath('D:\MATLAB\Licenta_fractionar\Twin-Rotor-System\Twin rotor\proiect\');



clc;clear all; close all;
%
% ns=[1];
% ds=[ 1 2 3];
% G=tf(ns,ds)
%%
%G=tf(8072.8,[1 1.287]);%H11
G= tf(33157,[1 3.527]);%H22
figure;step(G)
%%

criteriu='iae';
%criteriu_combinat=[0.5,0.5,0.5,0.5,0.5];
criteriu_combinat=0;

Gf_initial=feedback(G,1);
%Gf_initial=G/6275 ;
figure;step(Gf_initial);title('G initial');

%%
%PSO

c=2;w=0.7;particles=90;iteration=80;Var=3;

a=0;% lower bound
b=70; %upper bound

%Optimization
c_cf=0;
tic;



%Initialization

for m=1:particles
    for n=1:Var
        v(m,n)=0;             %Velocity
        x(m,n)=a+rand*(b-a);  %Position
        xp(m,n)=x(m,n);
    end

    %Model Parametres
    kp=x(m,1);
    ki=x(m,2);
    kd=x(m,3);

    %Simulation Model
    Gc=pid(kp,ki,kd);
    %Gcf=feedback(Gc*G,1);
    %y=step(Gcf);

    %ITAE
    %ff1=0;
    ff1=costFunction(Gc,G,criteriu,criteriu_combinat);
    %sim1=length(y);
    % for m1=1:sim1
    %     ff1=ff1+((abs(y(m1)-1))*m1);
    % end
    ITAE(m)=ff1;

end

%Find the best value
[Best_Performance,location]=min(ITAE);
fg=Best_Performance;

xg(1)=x(location,1); %kp
xg(2)=x(location,2); %ki
xg(3)=x(location,3); %kd

Gc=pid(kp,ki,kd);
Gcf_intermediar=feedback(Gc*G,1);
figure;step(Gcf_intermediar);title('G intermediar')
% t_cf=1:c_cf;
% figure
% plot(t_cf,best_cf_ac,'r--','LineWidth',2);xlabel('iteration');ylabel('Cost(ITAE)');
% legend('ITAE for PSO-PID');
% title('ITAE with each iteration');



% xg(1)=1/1400; %kp
% xg(2)=1/1000; %ki
% xg(3)=0; %kd
%kp=1/1400;
%ki=1/1000;
%kd=0;
%Update

for i=1:iteration      %Nr of Repetition
    for m=1:particles  %Nr of particles

        for n=1:Var     %Nr of variables (kp,ki,kd)
            v(m,n)=(w*v(m,n))+(c*rand*(xp(m,n)-x(m,n)))+(c*rand*(xg(n)-x(m,n)));  %update velocity
            x(m,n)=x(m,n)+v(m,n);
        end
        

        %Check bound
        for n=1:Var
            if x(m,n)<a
                x(m,n)=a;
            end
            if x(m,n)>b
                x(m,n)=b;
            end
        end

        %Model Parametres
        kp=x(m,1);
        ki=x(m,2);
        kd=x(m,3);

        %Simulation Model
        Gc=pid(kp,ki,kd);
        % Gcf=feedback(Gc*G,1);
        % y=step(Gcf);

        %ITAE
        % ff1=0;
        % sim1=length(y);
        % for m1=1:sim1
        %     ff1=ff1+((abs(y(m1)-1))*m1);
        % end
        ff1=costFunction(Gc,G,criteriu,criteriu_combinat);
        ITAEp(m)=ff1;

        %Compare Local
        if ITAEp(m)<ITAE(m)
            ITAE(m)=ITAEp(m);
            xp(m,1)=x(m,1);
            xp(m,2)=x(m,2);
            xp(m,3)=x(m,3);
        end


    end
    [B_fg,location]=min(ITAE);

    %Compare Global
    if B_fg<fg
        fg=B_fg;             %Nou global
        xg(1)=xp(location,1); %pos var 1
        xg(2)=xp(location,2); %pos var 2
        xg(3)=xp(location,3); %pos var 3
    end
    c_cf=c_cf+1;
    best_cf_ac(c_cf)=fg;

%close all;

end

runtime = toc;



Min_ITAE=fg
%%
kp=xg(1)
ki=xg(2)
kd=xg(3)

%kp=2.007303867924478
%ki=4.852150155040515
%kd=0;
% kp=1/1400;
% ki=1/1000;
% kd=0;
Gc=pid(kp,ki,kd);
Gcf_global=feedback(Gc*G,1);
figure;step(Gcf_global);
hold on
%step(Gf_initial)
%step(G)
hold off
%%
%pt H22    init=24;
%pt H11    init=3;
init=7;
t_cf=init:c_cf;
figure
plot(t_cf,best_cf_ac(init:end),'r--','LineWidth',2);xlabel('iteration');ylabel(['Cost (' criteriu ')']);
legend([criteriu ' for PSO-PID']);
title('Error with each iteration');


RegPID_indian_H22_IAE = struct('regulator', [], 'runtime', [],'iteration',[],'best',[],'parametrii',[]);
RegPID_indian_H22_IAE.regulator=Gc;
RegPID_indian_H22_IAE.runtime=runtime;
RegPID_indian_H22_IAE.iteration=iteration;
RegPID_indian_H22_IAE.best=best_cf_ac;
RegPID_indian_H22_IAE.parametrii=xg;

%H11
% kp=3.8247;
% ki=2.4079;
% kd=0;


%H11 cu 10^-3
% kp=0.5279;
% ki=24.0732;
% kd=0;



%% H11
%
%
% cel mai bun PID pt T/5
% kp=5.0039;
% ki=6.4454;
% kd=0;
%Min_ITAE =  638.0100

% cel mai bun pt T/10
% Min_ITAE =   1.5855e-10
% kp =    9.8353
% ki =   12.6521
% kd =     0

%% H22
% Min_ITAE =   9.1611e-12
% kp =    9.9203
% ki =   35.0018
% kd =     0









