%% CALORS EDUARDO DOS SANTOS JUNIOR 

%% MODELAGEM E SIMULAÇÃO DO SISTEMA MECÂNICO 

 

%instanciando as variáveis 

M1 = 1;  %KG
M2 = 2;

B1 = 0.5; % Ns/m
B2 = 1; 

K1 = 1;   % N/m 
K2 = 1; 

% X1,V1,X2,V2

A = [0, 1, 0, 0; -(K1+K2)/M1, -B1/M1, -K2/M1, 0 ...
     ; 0, 0, 0, 1; K2/M2, 0, -K2/M2, -B2/B2];

B = [0;0;0;1/M2]; 

C = [0,M1,0, 0; 0 0 0 M2];  

D = [0;0];

%solução numerica

Dt = 0.1;  %passo
tmax = 100; 
tempo = 0:Dt:tmax; 
N = numel(tempo); 

x0 = [0; 0; 0; 0];

x = zeros(4,N); %armazena

x(:, 1) = x0; 

y  = zeros(2,N); 

% Euler Explicito

for k = 1: N-1
    
    y(:,k) = C*x(:, k) + D*entrada11(Dt*k);
    
    x(:, k+1) = (eye(4) + Dt*A)*x(:,k)+ Dt*B*entrada11(Dt*k);

end

% Apresentação de resultados 

figure; 
plot(tempo, y(1,: ), 'b');
hold on 
plot(tempo, y(2, :), 'r');
hold on 

legend('Momento Linear 1 p1(t)', 'Momento Linear 2 p2(t)');