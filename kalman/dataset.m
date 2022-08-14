close all
clear all


Nsamples=100;
dt = 1;
RC=2.275; %hours

T_initial = 20; % Celcius

for t=1:dt:5*RC
T(t)=(T_initial*exp(-t/RC))+normrnd(0,2);
end

plot(T)

