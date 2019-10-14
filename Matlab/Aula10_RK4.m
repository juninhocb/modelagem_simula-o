% AULA 10

%RK4 
% Mais estável em relação ao RK2

clear;
clc; 

% Parametros do sistema

R = 50; %ohms
C = 220e-6;  %faraday
L = 6.2e-3;  %Henry

Am = [-1/(R*C), -1/C; 1/L, 0];
Bm = [1/(R*C); 0];
Cm = [-1, 0];
Dm = 1;

% Parametros de simulação 
Dt = 0.001;  
tmax = 0.2; 

tempo = 0:Dt:tmax; 
N = numel(tempo);

x0 = [0; 0];
x = zeros(2,N);
x(:,1) = x0; 

vr = zeros(1,N); 

%RK2

%m1 = A* x(k) + B*va(k)
%m2 = A*(x(k)+ (dt/2)*m1) + B*va(k + 1/2)
%m3 = A*(x(k) + (dt/2)*m2) + B*va(k  + 1/2)
%m4 = A(x(k) + dt * m3) + B*va(l+1)

for k = 1:N-1; 
    
    vr(k) = Cm*x(:,k)  + Dm*entrada1(Dt*k);
    
    m1 = Am*x(:, k) + Bm*entrada1(Dt*k); 
    
    m2 = Am*(x(:, k) + 0.5*Dt*m1 ) + Bm*entrada1(Dt*(k+0.5));
    
    m3 = Am*(x(: ,k) + 0.5*Dt*m2) + Bm*entrada1(Dt*(k + 0.5));
    
    m4 = Am*(x(:,k) + Dt*m3) + Bm*entrada1(Dt*(k+1));
    
    x(:, k+1) = x(:,k) + Dt*((m1/6)+ (m2/3)+ (m3/3)+ (m4/6));
        

end

%apresentação dos resultados
figure(); 
plot(tempo , vr);

figure();
plot(tempo, x(1,:)); 
hold on 
plot (tempo, x(2, :), 'k');

legend('v_c(t)', 'i_L(t)');