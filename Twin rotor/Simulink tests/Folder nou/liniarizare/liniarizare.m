close all;clc;clear;
load("D:\MATLAB\An 3 Exercitii\Twin rotor\Twin-Rotor-System\Twin rotor\date.mat");
%%

% load("date_step_azimuth.mat");
% load("date_step_pitch.mat");
% 
% 
% 
% %% Azimuth step azimuth
% 
% ref_azi_step_azi=azimuth_step_azimuth.Data(:,1);
% rpm_azi_step_azi=azimuth_step_azimuth.Data(:,2);
% t_azi_step_azi=azimuth_step_azimuth.Time;
% 
% 
% figure;plot(t_azi_step_azi,rpm_azi_step_azi)
% 
% Yst=887.896;
% y0=0;
% U=0.1;
% 
% K=(Yst-y0)/U;
% 
% yT=Yst*0.6321+y0; %trebuie sa ma uit la y=yT
% T=0.254818;
% 
% H22=tf(K,[T,1])
% 
% figure;step(feedback(H22,1))



Ih=1/37000;
Iv=1/6100;
Jh=0.0268;
Jv=0.0268;
kHh=7.0742*10^3;
kHv=5.1574*10^3;
kFh=1.3218*10^-4;
kFv=2.0124*10^4;
kfh=5.889*10^-3;
kfv=1.271*10^-2;
khv=4.175*10^-3;
kvh=-1.782*10^-2;
Rv=9.360078*10^-2;
lt=0.2165;
lm=0.202;
k1=2.379e-2;
k2=3.009e-3;
k3=5.006e-2;
k4=9.361e-2;
k5=0.010624;


uh=0;
uv=0;



syms wh wv Oh Ov alpha_h alpha_v      % uh uv

f1=kHh*wh;
f2=kFh*wh;
f3=kHv*wv;
f4=kFv*wv;

wh_d=-(1/Ih)*f1+1/Ih*uh;

Oh_d=(lt/(k1*cos(alpha_v)*cos(alpha_v)+k2))*f2*cos(alpha_v)-kfh*Oh/(k1*cos(alpha_v)*cos(alpha_v)+k2)-kvh*cos(alpha_v)*uv/(k1*cos(alpha_v)*cos(alpha_v)+k2);

wv_d=-(1/Iv)*f3+(1/Iv)*uv;

Ov_d=lm*f4/Jv-kfv*Ov/Jv-(k3*cos(alpha_v)+k4*sin(alpha_v)+k5*sin(alpha_v)*cos(alpha_v))/Jv+(khv/Jv)*uh;


alpha_h_d=Oh;
alpha_v_d=Ov;

% Egalăm la zero pentru punctele de echilibru
eqs = [wh_d == 0, wv_d == 0, Oh_d == 0, Ov_d == 0, alpha_h_d == 0, alpha_v_d == 0];

% Rezolvăm sistemul pentru x1, x2, x3, x4 în funcție de u
sol = solve(eqs, [wh wv Oh Ov alpha_h alpha_v]);

% Afișăm soluțiile
disp(sol)
%% Liniarizare
syms wh wv Oh Ov alpha_h alpha_v uh uv

wh_d=-(1/Ih)*f1+1/Ih*uh;

Oh_d=(lt/(k1*cos(alpha_v)*cos(alpha_v)+k2))*f2*cos(alpha_v)-kfh*Oh/(k1*cos(alpha_v)*cos(alpha_v)+k2)-kvh*cos(alpha_v)*uv/(k1*cos(alpha_v)*cos(alpha_v)+k2);

wv_d=-(1/Iv)*f3+(1/Iv)*uv;

Ov_d=lm*f4/Jv-kfv*Ov/Jv-(k3*cos(alpha_v)+k4*sin(alpha_v)+k5*sin(alpha_v)*cos(alpha_v))/Jv+(khv/Jv)*uh;


alpha_h_d=Oh;
alpha_v_d=Ov;




u=[uh;uv];

f = [wh_d , wv_d , Oh_d , Ov_d, alpha_h_d, alpha_v_d];

x = [wh; wv ;Oh; Ov; alpha_h ;alpha_v ];
A = jacobian(f, x);
B=jacobian(f,u);



x_eq = [0; 0; 0; 0;0;0];
u_eq = [0;0];

global A_lin 
global B_lin 
global C_lin


A_lin =eval( subs(A, [x; u], [x_eq; u_eq]));
B_lin=eval(subs(B, [x; u], [x_eq; u_eq]));


C_lin=[1 0 0 0 0 0;
       0 1 0 0 0 0];

%%
clc;
A_lin=eval([-1/(Ih*kHh)        0            0 0 0      0;
        lt*kFh*cos(0)/Jh  -kfh/Jh      0 0 0   -(lt*kFh*sin(0)+kvh*sin(0)*uv)/Jh;
        0                   1          0 0 0        0;
        0 0 0                          -1/(kHv*Iv) 0   0;
        0 0 0                  lm*kFv/Jv        -kfv/Jv     -(Rv+2*k5*cos(2*0))/Jv;
        0 0 0 0 1 0]);


B_lin=[1/Ih 0;
       0 -kvh*cos(0)/Jh;
       0   0;
       0   1/Iv;
       khv/Jv  0;
       0    0];

C_lin=[1 0 0 0 0 0;
       0 1 0 0 0 0];
%%
%s = tf('s');
%syms s
s=tf("s");
H=C_lin*(s*eye(6)-A_lin)^-1*B_lin

figure;step(H);
%%
G11 = 6275 / (0.7773 * s + 1);
G12 = -8.597 / (0.1762 * s + 1);
G21 = -11.81 / (0.7562 * s + 1);
G22 = 9400 / (0.2835 * s + 1);

G=[G11, G12;
    G21, G22];

D=minreal(G^-1);

HH=zpk([tf(37000,[1 5.23]), 0;
    0, tf(0.6649,[1  0.2197])]);

DD=minreal(zpk(D*HH));


%step(H)
figure;step(H(1,1))
hold on;step(H(2,2))

figure; bode(H(1,1))

figure; bode(H(2,2))