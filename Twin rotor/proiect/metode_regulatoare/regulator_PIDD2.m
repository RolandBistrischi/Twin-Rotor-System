%% regulator PIDD^2alpha cu cod de la un indian
%https://www.youtube.com/watch?v=qlZxsP-JQsQ
% se foloseste ITAE

%ant colony:   https://www.youtube.com/watch?v=LKCyZ1bRiyM

addpath('D:\MATLAB\Licenta_fractionar\Twin-Rotor-System\Twin rotor\proiect\functii\');
addpath('D:\MATLAB\Licenta_fractionar\Twin-Rotor-System\Twin rotor\proiect\');


clc;clear all; close all;


G=tf(8072.8,[1 1.287]);%H11
%G= tf(33157,[1 3.527]);%H22

criteriu='iae';
%criteriu_combinat=[0.5,0.5,0.5,0.5,0.5];
criteriu_combinat=0;

Gf_initial=feedback(G,1);
step(Gf_initial);title('G initial');

%[Kp, M, N, Ti, Td, Ta, alpha] = deal(1.02, 0.32, 4.84, 1.92, 0.31, 4.79, 0.78);


% f1=fotf(Ti,1,1,0);
% fd2=fotf([1 Td/N],[0,1],Td,1);
% fdd2a=fotf([1 2*Td/N (Td/M)^2],[0,1,2],Ta,2*alpha);
% 
% Gfoffo=Kp*(1+f1+fd2+fdd2a)
%%







%[Kp,M,N,Ti,Td,Ta,alpha]

%PSO

c=2;w=0.7;particles=100;iteration=70;Var=6;frac_var=1;

K_min=0.1;% lower bound
K_max=100; %upper bound %pentru Kp, M, N
frac_min=0.1;
frac_max=1.9; % pentru alpha
T_min=0.01;
T_max=50; %pentru Ti,Td,Ta
%Optimization
c_cf=0;

%Initialization
ITAE=zeros(1,particles);
ITAEp=ITAE;
best_cf_ac=zeros(1,iteration);
v=zeros(particles,Var+frac_var+1);
x=v;
xp=x;
tic;

for m=1:particles

    % Inițializare viteze
    v(m, 1:Var+frac_var) = 0;

    % Inițializare poziții
    x(m, 1:Var-3) = K_min + rand(1, 3) .* (K_max - K_min);
    x(m, Var-2:Var) = T_min + rand(1,3) .* (T_max - T_min);
    x(m, Var+1) = frac_min + rand(1, frac_var) .* (frac_max - frac_min);

    % Salvează pozițiile inițiale
    xp(m, :) = x(m, :);

    % Model Parametres
    [Kp,M,N,Ti,Td,Ta,alpha] = deal(x(m, 1), x(m, 2), x(m, 3), x(m, 4),x(m, 5), x(m, 6), x(m, 7));

   
    %Simulation Model
    f1=fotf(Ti,1,1,0);
    fd2=fotf([1 Td/N],[0,1],Td,1);
    fdd2a=fotf([1 2*Td/N (Td/M)^2],[0,1,2],Ta,2*alpha);

    Gc=Kp*(1+f1+fd2+fdd2a);
    %ITAE
    ITAE(m)=costFunction(Gc,G,criteriu,criteriu_combinat);
end

%Find the best value
[Best_Performance,location]=min(ITAE);
fg=Best_Performance;

xg=x(location,:);

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

        % for n=Var+1:Var+frac_var %Nr of powers (lambda,mu)
        %     v(m,n)=(w*v(m,n))+(c*rand*(xp(m,n)-x(m,n)))+(c*rand*(xg(n)-x(m,n)));  %update velocity
        %     x(m,n)=x(m,n)+v(m,n);
        % end

        %Check bound
        % Verificare limite pentru K (reglatori PID)
        x(m, 1:Var-3) = max(K_min, min(K_max, x(m, 1:Var-3)));

        % Verificare limite pentru frac_var (exponenți fracționari)
         x(m, Var-2:Var) = T_min + rand(1, 3) .* (T_max - T_min);

        x(m, Var+1)  = max(frac_min, min(frac_max, x(m, Var+1)));


        % Model Parametres
       [Kp,M,N,Ti,Td,Ta,alpha] = deal(x(m, 1), x(m, 2), x(m, 3), x(m, 4),x(m, 5), x(m, 6), x(m, 7));

   

        %Simulation Model
        f1=fotf(Ti,1,1,0);
        fd2=fotf([1 Td/N],[0,1],Td,1);
        fdd2a=fotf([1 2*Td/N (Td/M)^2],[0,1,2],Ta,2*alpha);

        Gc=Kp*(1+f1+fd2+fdd2a);
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
        xg(:)=xp(location,:); %pos var 1
    end
    c_cf=c_cf+1;
    best_cf_ac(c_cf)=fg;
end

runtime=toc;
Min_ITAE=fg
%%
% Model Parametres
[Kp,M,N,Ti,Td,Ta,alpha] = deal(xg( 1), xg( 2), xg( 3), xg( 4),xg( 5), xg( 6), xg( 7))


%%
%Simulation Model
f1=fotf(Ti,1,1,0);
fd2=fotf([1 Td/N],[0,1],Td,1);
fdd2a=fotf([1 2*Td/N (Td/M)^2],[0,1,2],Ta,2*alpha);

Gc_fotf=Kp*(1+f1+fd2+fdd2a)
%%
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
legend([criteriu ' for PSO-PID']);
title('Error with each iteration');

RegPIDD_H11_IAE = struct('regulator', [], 'runtime', [],'iteration',[],'best',[],'parametrii',[]);
RegPIDD_H11_IAE.regulator=Gc_fotf;
RegPIDD_H11_IAE.runtime=runtime;
RegPIDD_H11_IAE.iteration=iteration;
RegPIDD_H11_IAE.best=best_cf_ac;
RegPIDD_H11_IAE.parametrii=xg;
%%
