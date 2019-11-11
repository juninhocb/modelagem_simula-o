%% AULA 12 

%% MODELO DO SISTEMA ELETROMECÂNICO

% RaIa + LaIa' + Eb(t) = Va(t)

% JW' + BW + Tl = Tm(t)

% Ia' = 1/La*(-KW - RaIa + Va(t))

% W' = 1/J*(-BW - Tl + KIa)

% Y = Tm = K*Ia

clc
clear

Ra = 1; 
La = 1;
K = 1; 
J = 1; 
B = 1;

Am = [-Ra/La, -K/La; K/J -B/J]; 
Bm = [1/La, 0; 0, 1/J];
Cm = [K, 0]; 
Dm = [0, 0];

% Parametros de simulação 
Dt = 0.1;  
tmax = 20; 

tempo = 0:Dt:tmax; 
N = numel(tempo);

x0 = [0; 0];
x = zeros(2,N);
x(:,1) = x0; 

y = zeros(1,N); 

%RK4
%m1 = A* x(k) + B*va(k)
%m2 = A*(x(k)+ (dt/2)*m1) + B*va(k + 1/2)
%m3 = A*(x(k) + (dt/2)*m2) + B*va(k  + 1/2)
%m4 = A(x(k) + dt * m3) + B*va(l+1)



for k = 1:N-1; 
    
    y(k) = Cm*x(:,k)  + Dm*entrada10(Dt*k);
    
    m1 = Am*x(:, k) + Bm*entrada10(Dt*k); 
    
    m2 = Am*(x(:, k) + 0.5*Dt*m1 ) + Bm*entrada10(Dt*(k+0.5));
    
    m3 = Am*(x(: ,k) + 0.5*Dt*m2) + Bm*entrada10(Dt*(k + 0.5));
    
    m4 = Am*(x(:,k) + Dt*m3) + Bm*entrada10(Dt*(k+1));
    
    x(:, k+1) = x(:,k) + Dt*((m1/6)+ (m2/3)+ (m3/3)+ (m4/6));
        

end

%apresentação dos resultados
figure(); 
plot(tempo , y);
hold on
plot(tempo, x(1,:), 'k');
hold on 
plot(tempo, x(2,:), 'b--');



legend('Torque(t)', 'Velocidade Angular', 'Corrente');
 