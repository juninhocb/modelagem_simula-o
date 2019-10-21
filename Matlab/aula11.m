%%%  AULA 11 

%% MODELAGEM DO SISTEMA 

% Disco 2 
%teta = t
%derivada = . 

% J2t2..  + B2t2. + K2t2 = W2 +  K2t1

% J1t1..  + B1t1. + (K1 + K2)t1 = W1 + K2t2

% L(t) = J2W2
% T2(t) = K2(t2 - t1)
% y = J2W2 + J1W1 + K2t2 - K1t1

%instanciando as variáveis 

J1 = 1; 
J2 = 1;

B1 = 1; 
B2 = 1; 

K1 = 1; 
K2 = 1; 

A = [0, 0, 1, 0; 0, 0, 0, 1; -(K1+K2)/J1, K2/J1, -B1/J1, 0 ...
    ;K2/J2, -K2/J2, 0, -B2/J2];

B = [0;0;0;1/J2]; 

C = [0,0,J1, J2; -K2, K2, 0 ,0];

D = [0; 0];

%solução numerico

Dt = 0.1;  %passo
tmax = 40; 
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
plot(tempo, y(2, :), 'k:');

legend('Momento angular total L(t)', 'Torque \tau_2(t)');

