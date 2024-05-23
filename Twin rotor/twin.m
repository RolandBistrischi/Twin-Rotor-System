close all;clc;
load("date.mat");
load("date_step_azimuth.mat");
load("date_step_pitch.mat");
load("step_azimuth_din0.mat");
load("step_pitch_din0.mat");
%%
load("C:\partitia d\Aplicatii\Matlab\An 3 Exercitii\Twin rotor\Twin-Rotor-System\Twin rotor\date_motor\azimuth_din0.mat");
load("C:\partitia d\Aplicatii\Matlab\An 3 Exercitii\Twin rotor\Twin-Rotor-System\Twin rotor\date_motor\pitch_din0.mat");
%load("step03_pitch_din0.mat");
%load("step03_azimuth_din0.mat");
%load("C:\Users\Roland\Desktop\Twin rotor\MDL\tras_char.mat");
%% date initializate   pt step azimuth
u_azi_identificare=azimuth_variables_step_azimuth.Data(:,3);
azi_rpm_identificare=azimuth_variables_step_azimuth.Data(:,2);
azi_pos_identificare=azimuth_variables_step_azimuth.Data(:,1);
t_azi_identificare=azimuth_variables_step_azimuth.Time;

%u_azi_validare=azimuth_variables_10.Data(:,3);
%azi_rpm_validare=azimuth_variables_10.Data(:,2);
%azi_pos_validare=azimuth_variables_10.Data(:,1);
%t_azi_validare=azimuth_variables_10.Time;


%figure;plot(t_azi_identificare,u_azi_identificare,t_azi_identificare,azi_rpm_identificare);title("Azimuth RPM");
%figure;plot(t_azi_identificare,u_azi_identificare,t_azi_identificare,azi_pos_identificare);title("Azimuth POS");


u_pitch_identificare=pitch_variables_step_pitch.Data(:,3);
pitch_rpm_identificare=pitch_variables_step_pitch.Data(:,2);
pitch_pos_identificare=pitch_variables_step_pitch.Data(:,1);
t_pitch_identificare=pitch_variables_step_pitch.Time;


% u_pitch_validare=pitch_variables_10.Data(:,3);
% pitch_rpm_validare=pitch_variables_10.Data(:,2);
% pitch_pos_validare=pitch_variables_10.Data(:,1);
% t_pitch_validare=pitch_variables_10.Time;


%figure;plot(t_pitch_identificare,u_pitch_identificare,t_pitch_identificare,pitch_rpm_identificare);title("Pitch RPM");
%figure;plot(t_pitch_identificare,u_pitch_identificare,t_pitch_identificare,pitch_pos_identificare);title("Pitch POS");

%% fac rpm-ul pe azimuth
close all;
u_azi_identificare=azimuth_variables_step_azimuth_din0.Data(:,3);
azi_rpm_identificare=azimuth_variables_step_azimuth_din0.Data(:,2);
azi_pos_identificare=azimuth_variables_step_azimuth_din0.Data(:,1);
t_azi_identificare=azimuth_variables_step_azimuth_din0.Time;
figure;plot(t_azi_identificare,u_azi_identificare,t_azi_identificare,azi_rpm_identificare);title("Azimuth RPM");

y_motor=variables_step_azimuth_din0.signals.values(:,1);
b=variables_step_azimuth_din0.signals.values(:,2);
u_motor=variables_step_azimuth_din0.signals.values(:,3);
t_motor=variables_step_azimuth_din0.time;

%azimuth
%Yst=6600;
Yst=1880;
%y0=-8.5643;
y0=0;
Ust=1;

K=(Yst-y0)/Ust;
K=1880/0.2;

yT=Yst*0.6321+y0 %trebuie sa ma uit la y=yT
ccc=4163.43138826848;
%T=1.158523-1;
%T=0.1583;%original
T=0.2835;
%A=-1/T;
%B=K/T;
%C=1;D=0;


%H11=ss(A,B,C,D)
H22=tf(K,[T,1])
%H11=tf(8393,[ 0.22  1])%magdalena

%figure;plot(t_azi,u_azi,t_azi,azi_rpm);title("Azimuth RPM");
%hold on;
t_azi_validare=t_azi_identificare;
u_azi_validare=u_azi_identificare;
azi_rpm_validare=azi_rpm_identificare;

%figure
%plot(t_motor,b);

figure;
plot(t_azi_validare,u_azi_validare);
hold on;
plot(t_azi_validare,azi_rpm_validare);
hold on;
lsim(H22,u_azi_validare,t_azi_validare,'g');legend('u val','y val','H(s)');title("H22 simulator");
ysim=lsim(H22,u_azi_validare,t_azi_validare,'g');

%e=azi_rpm_identificare-ysim;
%emp=1/length(e)*sum(e.^2);
%fprintf("Eroarea medie pareatica pt H22 este: %.4f\n",emp);


figure;
plot(t_motor,u_motor);
hold on;
plot(t_motor,y_motor);
hold on;
lsim(H22,u_motor,t_motor,'g');legend('u val','y mot','H(s)');title("H22 fizic");
ysim=lsim(H22,u_motor,t_motor,'g');

e=y_motor-ysim;
emp=1/length(e)*sum(e.^2);
fprintf("Eroarea medie pareatica pt H22 motor este: %.4f\n",emp);
% arx
% yval=azi_rpm_identificare;
% uval=u_azi_identificare;
% yid=azi_rpm_validare;
% uid=u_azi_validare;
% t=t_azi_identificare;
% Na=8;Nb=14;Nk=1;
%
% idqqid=iddata(yid,uid,t(2)-t(1));
% model=arx(idqqid,[Na,Nb,Nk]);
% figure;
% plot(yval);
% hold on;
% compare(model, idqqid);title('Identificare Azimuth');
%
% figure
% idqqval=iddata(yval,uval,t(2)-t(1));
% compare(model,idqqval);title('Validare Azimuth');
%
%
% Na = 1:15;
% Nb = 1:15;
% Nk = 1:5;
% NN = struc(Na, Nb, Nk);
% V = arxstruc(idqqid, idqqval, NN);
% N = selstruc(V, "plot");
%
%
% %% azimuth pos
% %azimuth (aproximare cu ordin 1)
% close all;clc;
% u_azi_identificare=azimuth_variables_step03_azimuth_din0.Data(:,3);
% azi_rpm_identificare=azimuth_variables_step03_azimuth_din0.Data(:,2);
% azi_pos_identificare=azimuth_variables_step03_azimuth_din0.Data(:,1);
% t_azi_identificare=azimuth_variables_step03_azimuth_din0.Time;
%
% figure;plot(t_azi_identificare,u_azi_identificare,t_azi_identificare,azi_pos_identificare);title("Azimuth POS");
% %azi_pos_identificare=azimuth_variables_step_azimuth_din0.Data(:,1);
% Yst=6;
% %y0=-8.5643;
% y0=0;
% Ust=0.3;
%
% K=(Yst-y0)/Ust;
% %yT=Yst*(1-exp(1)^-1)  %trebuie sa ma uit la y=yT
% yT=Yst*0.6321+y0
% ccc=3.7926;
% %T=2.0894-1;
% T=1.13549;
%
% T1=0.6;%inainte a fost 0.14 la toate
% T2=0.6;
% T3=0.7;
% %H21=zpk(tf(K,[T,1],'iodelay',1));
% %H11=ss(A,B,C,D);
% T=0.3;%0.13 pt timp de raspuns
% H21=zpk(tf(K,conv( [T1,1], conv([T2,1],[T3,1])),'iodelay',0.5))
% %H21=zpk(tf(K,conv([T,1],[T,1])))
% %H11=tf(K,[ 0.22  1])
%
% figure;plot(t_azi_identificare,u_azi_identificare,t_azi_validare,azi_pos_identificare);title("Azimuth RPM");
% hold on;
% % figure;
% % plot(t_azi_validare,u_azi_validare);
% % hold on;
% % plot(t_azi_validare,azi_pos_validare);
% % hold on;
% lsim(H21,u_azi_identificare,t_azi_validare,'g');legend('u val','y val','H(s)');
% ysim=lsim(H21,u_azi_identificare,t_azi_validare,'g');
%
% e=azi_pos_identificare-ysim;
% emp=1/length(e)*sum(e.^2);
% fprintf("Eroarea medie pareatica pt ordinul II (pozitie) azimuth este: %.4f\n",emp);
%% pitch rpm with step 0
%close all;
u_pitch_identificare=pitch_variables_step_azimuth.Data(:,3);
pitch_rpm_identificare=pitch_variables_step_azimuth.Data(:,2);
pitch_pos_identificare=pitch_variables_step_azimuth.Data(:,1);
t_pitch_identificare=pitch_variables_step_azimuth.Time;
figure;plot(t_pitch_identificare,u_pitch_identificare,t_pitch_identificare,pitch_rpm_identificare);title("Pitch RPM with step on azimuth");

Yst=-11.8082;
%y0=-8.5643;
y0=0;
Ust=1;

K=(Yst-y0)/Ust;
yT=Yst*0.6321+y0;   %trebuie sa ma uit la y=yT
ccc=4163.43138826848;
T=0.7562;
%A=-1/T;
%B=K/T;
%C=1;D=0;
%H11=ss(A,B,C,D)


H21=tf(K,[T,1])

figure;
plot(t_pitch_identificare,u_azi_identificare);
hold on;
plot(t_pitch_identificare,pitch_rpm_identificare);
hold on;
lsim(H21,u_azi_identificare,t_pitch_identificare,'g');legend('u val','y val','H(s)');title("H21")
ysim=lsim(H21,u_azi_identificare,t_pitch_identificare,'g');

e=pitch_rpm_identificare-ysim;
emp=1/length(e)*sum(e.^2);
fprintf("Eroarea medie pareatica pt H21 este: %.4f\n",emp);


%% pitch
close all;
u_pitch_identificare=pitch_variables_step_pitch_din0.Data(:,3);
pitch_rpm_identificare=pitch_variables_step_pitch_din0.Data(:,2);
pitch_pos_identificare=pitch_variables_step_pitch_din0.Data(:,1);
t_pitch_identificare=pitch_variables_step_pitch_din0.Time;
figure;plot(t_pitch_identificare,u_pitch_identificare,t_pitch_identificare,pitch_rpm_identificare);title("Pitch RPM");

a=variables_step_pitch_din0.signals.values(:,1);
y_mot=variables_step_pitch_din0.signals.values(:,2);
u_mot=variables_step_pitch_din0.signals.values(:,3);
t_motor=variables_step_pitch_din0.time;


Yst=3600;
Yst=1255;
%y0=-8.5721;
y0=0;
Ust=1;
Ust=0.2;

K=(Yst-y0)/Ust;
%yT=Yst*(1-exp(1)^-1)  %trebuie sa ma uit la y=yT
yT=Yst*0.6321+y0
ccc=2275.56000000000;
%T=0.468467;%model
T=0.7773;
%K=1255/0.2

H11=tf(K,[T,1])

figure;
plot(t_pitch_identificare,u_pitch_identificare);
hold on;
plot(t_pitch_identificare,pitch_rpm_identificare);
hold on;
lsim(H11,u_pitch_identificare,t_pitch_identificare,'g');legend('u val','y val','H(s)');title("H11 simulat");
ysim=lsim(H11,u_pitch_identificare,t_pitch_identificare,'g');

e=pitch_rpm_identificare-ysim;
emp=1/length(e)*sum(e.^2);
%fprintf("Eroarea medie pareatica pt H11 este: %.4f\n",emp);



figure;
plot(t_motor,y_mot);
figure;
plot(t_motor,u_mot);
hold on;
plot(t_motor,y_mot);
hold on;
lsim(H11,u_motor,t_motor,'g');legend('u val','y mot','H(s)');title("H11 fizic");
ysim=lsim(H11,u_motor,t_motor,'g');

e=y_mot-ysim;
emp=1/length(e)*sum(e.^2);
fprintf("Eroarea medie pareatica pt H11 motor este: %.4f\n",emp);


%% azimuth rpm with step 0
%close all;clc;
u_azi_identificare=azimuth_variables_step_pitch.Data(:,3);
azi_rpm_identificare=azimuth_variables_step_pitch.Data(:,2);
azi_pos_identificare=azimuth_variables_step_pitch.Data(:,1);
t_azi_identificare=azimuth_variables_step_pitch.Time;

figure;plot(t_azi_identificare,u_azi_identificare,t_azi_identificare,azi_rpm_identificare);title("Azimuth RPM with step on pitch");

Yst=-8.5972;
%y0=-8.5643;
y0=0;
Ust=1;

K=(Yst-y0)/Ust;
yT=Yst*0.6321+y0; %trebuie sa ma uit la y=yT
T=0.1762;
%A=-1/T;
%B=K/T;
%C=1;D=0;

%H11=ss(A,B,C,D)
H12=tf(K,[T,1])

%figure;plot(t_azi,u_azi,t_azi,azi_rpm);title("Azimuth RPM");
%hold on;
% t_azi_validare=t_azi_identificare;
% u_azi_validare=u_azi_identificare;
% azi_rpm_validare=azi_rpm_identificare;

u_azi_identificare=u_pitch_identificare;
figure;
plot(t_azi_identificare,u_azi_identificare);
hold on;
plot(t_azi_identificare,azi_rpm_identificare);
hold on;
lsim(H12,u_azi_identificare,t_azi_identificare,'g');legend('u val','y val','H(s)');title("H12");
ysim=lsim(H12,u_azi_identificare,t_azi_identificare,'g');

e=azi_rpm_identificare-ysim;
emp=1/length(e)*sum(e.^2);
fprintf("Eroarea medie pareatica pt H12 este: %.4f\n",emp);


% %% pitch pos
% %pitch (ordin 2)
% %close all;clc;
% u_pitch_identificare=pitch_variables_step03_pitch_din0.Data(:,3);
% pitch_rpm_identificare=pitch_variables_step03_pitch_din0.Data(:,2);
% pitch_pos_identificare=pitch_variables_step03_pitch_din0.Data(:,1);
% t_pitch_identificare=pitch_variables_step03_pitch_din0.Time;
%
% figure;plot(t_pitch_identificare,u_pitch_identificare,t_pitch_identificare,pitch_pos_identificare);title("Pitch POS");
% %
% % Yst=1.5708;
% % Ust=1;
% % K=Yst/Ust;
% % yT2=K*0.632
% % T=1.38845;
% % %T=10.15-3.5;
% % %T=9-6.8;
% %
% %
% % Haux=tf(1,[1 1]);
% % minepm=100000000;
% % Tax=0;
% % Tziiit=0;
% % Tzet=0.4966;
% % T=0.4799;
% % %for Tzet=0.4:0.0001:0.6
% % %for T=0.4:0.0001:0.6
% %
% %     %T=0.5;
% %
% %     %H2=tf(K*wn^2,[1,2*cita*wn,wn^2]);
% %
% %     %H22=zpk(K*tf([-0.3 1],conv([0.4,1],[0.4,1]))) %inainte
% %     H22=zpk(K*tf([-Tzet 1],conv([T,1],[T,1])));
% %
% %     %H22=zpk(tf(K,[T,1]))
% %     %validare
% %     %
% %     % u_val2=u2(200:end);
% %     % y_val2=y2(200:end);
% %     % tval2=t(200:end);
% %
% %     %figure;
% %     %plot(t_pitch_identificare,u_pitch_identificare);
% %     %hold on;
% %     %plot(t_pitch_identificare,pitch_pos_identificare);
% %     %lsim(H22,u_pitch_identificare,t_pitch_identificare,'g'),legend('u val','y val','H(s)'),xlabel('t'),ylabel('y(t)');
% %     ysim=lsim(H22,u_pitch_identificare,t_pitch_identificare);
% %
% %     e=pitch_pos_identificare-ysim;
% %     emp2=1/length(e)*sum(e.^2);
% %     %fprintf("Eroarea medie pareatica pt ordinul II (pos) pitch este: %.4f",emp2);
% %
% %     if emp2<minepm
% %         minepm=emp2;
% %         Haux=H22;
% %         Tax=T;
% %         Tziiit=Tzet;
% %     end
% %
% % %end
% % %end
% % %[z,index]=min(emp2)
% %
% % Tzero=0.4966;
% % Tpol=0.4799;
% %  Haux=zpk(K*tf([-Tzero 1],conv([Tpol,1],[Tpol,1])));
%
%
%
%
% %% pitch pos 2.0
% close all;clc;
% u_pitch_identificare=pitch_variables_step03_pitch_din0.Data(:,3);
% pitch_rpm_identificare=pitch_variables_step03_pitch_din0.Data(:,2);
% pitch_pos_identificare=pitch_variables_step03_pitch_din0.Data(:,1);
% t_pitch_identificare=pitch_variables_step03_pitch_din0.Time;
%
% figure;plot(t_pitch_identificare,u_pitch_identificare,t_pitch_identificare,pitch_pos_identificare);title("Pitch POS");
%
% Yst=0;
% Ust=0.3;
% K=Yst/Ust;
% yT2=K*0.632;
%
% T=6.68-3.26;
% %T=9-6.8;
%
% ymax=0.330;
% %M=9.03986-6;
%
%
% %M=(ymax-K)/K
% M=2*pi/T;
% %M=1.9;
% cita=log(M)/sqrt(pi^2+log(M)*log(M))
%
%
% %cita=0.5;
% wn=2*pi/(T*sqrt(1-cita^2))
%
%
%
% H22=zpk(tf(wn^2*[-1 1],[1,2*cita*wn,wn^2]))
%  Haux=H22;
% %validare
%
% figure;
% plot(t_pitch_identificare,u_pitch_identificare);
% hold on;
% plot(t_pitch_identificare,pitch_pos_identificare);
% lsim(Haux,u_pitch_identificare,t_pitch_identificare,'g'),legend('u val','y val','H(s)'),xlabel('t'),ylabel('y(t)');
% ysim=lsim(Haux,u_pitch_identificare,t_pitch_identificare);
%  e=pitch_pos_identificare-ysim;
%     emp2=1/length(e)*sum(e.^2);
% minepm=emp2;
%
%
% fprintf("Eroarea medie pareatica pt ordinul II (pos) pitch este: %.4f",minepm);
% %fprintf("\nT=%.4f\nTzet=%.4f",Tax,Tziiit);
% %Tzero=0.4966;
% %Tpol=0.4799;


%% decuplarea
close all;clc;
G=zpk([H11,H12;
    H21,H22])

detG=minreal(zpk(H11*H22-H21*H12));

ggg1=minreal(zpk(36*660000*tf([0.7562*0.1762 0.9324 1],conv(conv([0.4685 1],[0.1583 1]),conv([0.7562 1],[0.1762 1])))));
ggg2=minreal(zpk(-101.5306*tf([0.4685*0.1583 0.6268 1],conv(conv([0.4685 1],[0.1583 1]),conv([0.7562 1],[0.1762 1])))));

GGG=ggg1-ggg2;


D=minreal(1/detG*[H22 -H12;
    -H21 H11]);% aici H e defapt G
%H=[H11,0;    0, H22];

%D=minreal(zpk(1/(H11*H22-H12*H21)*[H11*H11,-H12*H22; -H21*H11,H11*H22]));
%D2=minreal(zpk(G^-1  ))

a=3.2039e08;


H=[tf(2.6767*10^8/33157,[1 1.287]),0;
    0, tf(2.6767*10^8/8072.8,[1 3.527])];


D2=zpk([1,tf(15.615/8072.8*[1 1.287],[1 1.322]);
    tf(48.779/33157*[1 3.527],[1 5.675]),1]);

%% Regulatoare
H11=tf(8072.8,[1 1.287]);
H22= tf(33157,[1 3.527]);

%% Rgulator pt H11
%Marginea de faza impusa cu PD
close all;clc;
H11=tf(8072.8,[1 1.287]);
figure;
step(H11);

tr=2;
gammak=45;

%beta=0.115;
beta=3-2*sqrt(2)
%fi=-180-atand((1-beta)/(2*sqrt(beta)))+gammak;

gammaK=atand((1-beta)/(2*sqrt(beta)))
figure;bode(H11);

w=8072.8;
%Kf=-9.18;
%Kp=sqrt(beta)*db2mag(-Kf);
Kp=sqrt(beta)/(8072.8/sqrt(8072.8^2+1.287^2));

Td=1/(w*sqrt(beta));
Hr=zpk(Kp*tf([Td 1],[Td*beta 1]))

Hdes=Hr*H11;
figure;bode(Hr);title('Hr')
figure;bode(Hdes);

figure;step(Hdes);

%% Gullemin-Truxel
close all;clc;
tr=1.8;
t=0:0.1:100;
%cita=abs(log(M))/sqrt(log(M)^2+pi^2);
%wn=4/(cita*tr);

%wb=wn*sqrt(1-2*cita^2+sqrt(2-4*cita^2+4*cita^4));
%Cv=wn/(2*cita);
T=tr/4;
Hf=tf(8072.8,[1 1.287])
%Ho=tf(wn^2,[1, 2*cita*wn, wn^2])
Ho=tf(1,[T 1])
Hr=zpk(minreal((1/Hf)*Ho/(1-Ho)))
Hminreal=minreal(zpk(Hr));
Hdes=zpk(minreal(Hr*Hf));
figure;step(Ho);
figure;bode(Hdes);
figure; lsim(Ho,t,t);
Hoo=zpk(minreal(Hdes/(1+Hdes)));

%% Gullemin-Truxel pt H22
close all;clc;
H22= tf(33157,[1 3.527]);
Ho=H22/(1+H22);
figure;step(Ho);
figure;bode(H22);
%%
close all;clc;
%tr=10^-7;
tr=50*10^-6;
%cita=abs(log(M))/sqrt(log(M)^2+pi^2);
%wn=4/(cita*tr);

%wb=wn*sqrt(1-2*cita^2+sqrt(2-4*cita^2+4*cita^4));
%Cv=wn/(2*cita);
T=tr/4;
Hf=tf(33157,[1 3.527]);
%Ho=tf(wn^2,[1, 2*cita*wn, wn^2])
Ho=tf(1,[T 1])
Hr=(1/Hf)*Ho/(1-Ho)
Hminreal=minreal(zpk(Hr))
Hdes=zpk(minreal(Hr*Hf));
figure;step(Ho);
figure;bode(Hdes);

Hoo=zpk(minreal(Hdes/(1+Hdes)))






