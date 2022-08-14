close all
clear all



Nsamples=100;
dt = 1;
t=0:dt:dt*Nsamples;
RC=2.275; %hours

T_initial = 20; % Celcius

for t=1:dt:5*RC
T(t)=(T_initial*exp(-t/RC))+normrnd(0,2);
end


T_true = T_initial*exp(-t/RC);



Tk_prev=10; % start with initial temperature=10

Tk=[]; %current state estimate

A=-1/RC;

sigma_model=1;

P_k_minus=sigma_model^2;

Q=0.5;

H=1;

sigma_measurement=2;

R=sigma_measurement^2;

Tk_buffer = zeros(2,Nsamples+1);
Tk_buffer(:,1) = Tk_prev;
Z_buffer = zeros(1,Nsamples+1);

for k=1:Nsamples
    
    % Z is the measurement vector. In our
    % case, Z = TrueData + RandomGaussianNoise
    Z=T_initial*exp(-k/RC)+normrnd(0,2);
    Z_buffer(k+1) = Z;
    
    % Kalman iteration
    P1 = A*P_k_minus*A' + Q;
    S = H*P1*H' + R;
    
    % K is Kalman gain. If K is large, more weight goes to the measurement.
    % If K is low, more weight goes to the model prediction.
    K = P1*H'*inv(S);
    P_k_minus = P1 - K*H*P1;
    
    Tk = A*Tk_prev + K*(Z-H*A*Tk_prev);
    Tk_buffer(:,k+1) = Tk;
    
    % For the next iteration
    Tk_prev = Tk; 
end


figure;
hold on;
plot(Z_buffer,'c');
plot(Tk_buffer(1,:),'m');
title('Temperature estimation results');
xlabel('Time (hours)');
ylabel('Temperatue (C)');
legend('Measurements','Kalman estimated Temperature');