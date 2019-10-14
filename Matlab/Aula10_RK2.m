% aula 10

% modelagem circuito elétrico 
% EE: 
% dvc = - (1/RC)*Vc - (1/C)*Il + (1/RC)*Va
% dit = (1/L)*Vc
% saída Y =  -1*Il + Va(t)

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
Dt = 0.0001;  
% o passo tem que ser bem calculado para os resultados não divergirem 
% 10^3 -> diverge : 10^4 -> converge
tmax = 0.2; 

tempo = 0:Dt:tmax; 
N = numel(tempo);

x0 = [0; 0];
x = zeros(2,N);
x(:,1) = x0; 

vr = zeros(1,N); 

%RK2

for k = 1:N-1; 
    
    vr(k) = Cm*x(:,k)  + Dm*entrada1(Dt*k);
    
    m1 = Am*x(:, k) + Bm*entrada1(Dt*k); 
    
    m2 = Am*(x(:, k) + 0.5*Dt*m1 ) + Bm*entrada1(Dt*(k+0.5));
    
    x(:, k+1) = x(:,k) + Dt*m2;

end

%apresentação dos resultados
figure(); 
plot(tempo , vr);

figure();
plot(tempo, x(1,:)); 
hold on 
plot (tempo, x(2, :), 'k');

legend('v_c(t)', 'i_L(t)');