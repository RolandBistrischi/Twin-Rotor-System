load("D:\MATLAB\Licenta_fractionar\Twin-Rotor-System\Twin rotor\date_motor\RegFrac_H11_limitat_ITAE.mat") 
load("D:\MATLAB\Licenta_fractionar\Twin-Rotor-System\Twin rotor\date_motor\RegFrac_H22_limitat_ITAE.mat") 
%%
n=20;
H11=tf(8072.8,[1 1.287]);
H22= tf(33157,[1 3.527]);
%[bestJ_H11, bestReg_H11, bestJ_H22, bestReg_H22] =findBestRegulators(n,H11,H22,RegFrac_H11_limitat,RegFrac_H22_limitat_ISE,5)
[bestJ_H11, bestReg_H11] = findBestRegulators(n, H11, RegFrac_H11_limitat_ITAE, 5,'ITAE');
[bestJ_H22, bestReg_H22] = findBestRegulators(n, H22, RegFrac_H22_limitat_ITAE, 5,'ITAE');
%%
close all;clc;
for i=1:5
    Hb11=bestReg_H11(i).regulator
    Hc= zpk(minreal( oustapp(Hb11, 0.001, 1000, 7)));
    loop1 = feedback( series( Hc , H11), 1);
    figure;
    step(loop1);
    %bode(H11*Hc);
end
close all;
%%
close all;clc;
for i=1:5
    Hb22=bestReg_H22(i).regulator
    Hc= zpk(minreal( oustapp(Hb22, 0.001, 1000, 7)));
    loop1 = feedback( series( Hc , H22), 1);
    figure;
    step(loop1);
    %bode(H11*Hc);
end


close all;