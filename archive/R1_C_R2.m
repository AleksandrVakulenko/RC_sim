clear
clc

R1 = 100e3;
R2 = 100e3;
C = 10e-6;


tstep = 0.001;
start = 0;
stop = 10;
t = [start:tstep:stop];
Nt = -(start-stop)/tstep+1;

Uin = zeros(size(t));
range = t >= 1;
Uin(range) = 1;

Uout = zeros(1,Nt);

for i = 1 : Nt-1
    Uout(i+1) = tstep/(R1*C) * (Uin(i) - Uout(i)) - tstep/(R2*C)*Uout(i) + ... 
    + Uout(i);
end

hold on
plot(t, Uin, 'b');
plot(t, Uout, 'r');
