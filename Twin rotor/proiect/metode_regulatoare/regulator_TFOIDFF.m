%% regulator TFOIDFF cu cod de la un indian
%https://www.youtube.com/watch?v=qlZxsP-JQsQ
% se foloseste ITAE

%ant colony:   https://www.youtube.com/watch?v=LKCyZ1bRiyM

addpath('D:\MATLAB\Licenta_fractionar\Twin-Rotor-System\Twin rotor\proiect\functii\');
addpath('D:\MATLAB\Licenta_fractionar\Twin-Rotor-System\Twin rotor\proiect\');


clc;clear all; close all;


%G=tf(8072.8,[1 1.287]);%H11
G= tf(33157,[1 3.527]);%H22

criteriu='itae';
%criteriu_combinat=[0.5,0.5,0.5,0.5,0.5];
criteriu_combinat=0;

Gf_initial=feedback(G,1);
step(Gf_initial);title('G initial');



%PSO

c=2;w=0.7;particles=100;iteration=70;Var=4;frac_var=3;

K_min=0;% lower bound
K_max=100; %upper bound
frac_min=0;
frac_max=1;
n_min=1;
n_max=5;
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
    x(m, 1:Var) = K_min + rand(1, Var) .* (K_max - K_min);
    x(m, Var+1) = n_min + rand(1, 1) .* (n_max - n_min);
    x(m, Var+2:Var+frac_var+1) = frac_min + rand(1, frac_var) .* (frac_max - frac_min);

    % Salvează pozițiile inițiale
    xp(m, :) = x(m, :);

    % Model Parametres
    [kt, ki, kd, Nf,n,lambda,miu,lambdaf] = deal(x(m, 1), x(m, 2), x(m, 3), x(m, 4),x(m, 5), x(m, 6), x(m, 7), x(m, 8));

   
    %Simulation Model
    Gc_1=fotf(1,0,[kt, ki], [-1/n, -lambda]);
    Gc_ff=fotf([1, Nf],[lambdaf,0],kd*Nf, miu);
    Gc=Gc_1+Gc_ff;
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
        x(m, 1:Var) = max(K_min, min(K_max, x(m, 1:Var)));

        % Verificare limite pentru frac_var (exponenți fracționari)
        x(m, Var+1) = max(n_min, min(n_max, x(m, Var+1)));% pt n

        x(m, Var+2:Var+frac_var+1) = max(frac_min, min(frac_max, x(m, Var+1:Var+frac_var)));


        % Model Parametres
        [kt, ki, kd, Nf,n,lambda,miu,lambdaf] = deal(x(m, 1), x(m, 2), x(m, 3), x(m, 4),x(m, 5), x(m, 6), x(m, 7), x(m, 8));


        %Simulation Model
        Gc_1=fotf(1,0,[kt, ki], [-1/n, -lambda]);
        Gc_ff=fotf([1, Nf],[lambdaf,0],kd*Nf, miu);
        Gc=Gc_1+Gc_ff;
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

runtime=toc
Min_ITAE=fg
%%
% Model Parametres
[kt, ki, kd, Nf,n,lambda,miu,lambdaf] = deal(x(m, 1), x(m, 2), x(m, 3), x(m, 4),x(m, 5), x(m, 6), x(m, 7), x(m, 8))


%Simulation Model
Gc_1=fotf(1,0,[kt, ki], [-1/n, -lambda]);
Gc_ff=fotf([1, Nf],[lambdaf,0],kd*Nf, miu);
Gc_fotf=Gc_1+Gc_ff

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

RegTFOIDFFID_H22_ITAE = struct('regulator', [], 'runtime', [],'iteration',[],'best',[]);
RegTFOIDFFID_H22_ITAE.regulator=Gc_fotf;
RegTFOIDFFID_H22_ITAE.runtime=runtime;
RegTFOIDFFID_H22_ITAE.iteration=iteration;
RegTFOIDFFID_H22_ITAE.best=best_cf_ac;

%%
%H22
% Min_ITAE =   9.1603e-12
% kt =   15.7232
% ki =   15.4948
% kd =     0
% n =     5

% 
% H22 sensibility
% Min_ITAE =     0
% kt =    8.6152
% ki =   81.6592
% kd =     0
% n =     5



%H22 IAE
% kt =   56.6695
% ki =     0
% kd =    0.3166
% Nf =   99.0530
% n =    1.2769
% lambda =     1
% miu =    1.0000
% lambdaf =    0.9999

%H22 ITAE
% kt =   15.0133
% ki =     0
% kd =     0
% Nf =   91.9722
% n =    1.8919
% lambda =     1
% miu =    1.0000
% lambdaf =     0
