function  F = NonlinearEq(fi,mk,x)

%x1=lambda1
%x2=alpha
%x3=wt
%x4=wpi

lambda1 = x(1);
alpha = x(2);
wt = x(3);
wpi = x(4);

F(1)=-fi+pi+atan((3.75-lambda1/2)*wt)-(alpha+1)*pi/2-3.75*wt;
F(2)=1/(2*lambda1)^2+(3.75/(2*lambda1)-1/4)^2 *wt^2+wt^(2*alpha+2);
F(3)=-mk+wpi^(alpha+1)/sqrt(1/(2*lambda1)^2+(3.75/(2*lambda1)-1/4)^2 *wpi^2);
F(4)=pi+atan((3.75-lambda1/2)*wpi)-(alpha+1)*pi/2-3.75*wpi;

end