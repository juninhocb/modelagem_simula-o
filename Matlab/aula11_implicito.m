% aula11 

%Eler Implícito 

% y(k) = C * x(k) + D * Ta(k)
% x(k + 1) = x(k) + dt[ A*x(x+1) + B*Ta(k+1)]
% x(k + 1) = x(k) + dt*A*x(k+1) + dt*B*Ta(k+1)
% (I - dt*A)*x(k+1)  = x(k) + dt*B*Ta(k+1)

% -> x(k+1) = (I - dt*A)-1* [x(k) + dt*B*Ta(k+1)]


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

%solução numerica

Dt = 0.1;  %passo
tmax = 40; 
tempo = 0:Dt:tmax; 
N = numel(tempo); 

x0 = [0; 0; 0; 0];

x = zeros(4,N); %armazena

x(:, 1) = x0; 

y  = zeros(2,N); 

% Euler Implicito

for k = 1: N-1
    
    y(:,k) = C*x(:, k) + D*entrada11(Dt*k);
    
    x(:, k+1) = inv(eye(4) - Dt*A)* (x(:,k) + Dt*B*entrada11(Dt*(k+1)));

end

% Apresentação de resultados 

figure; 
plot(tempo, y(1,: ), 'b');
hold on 
plot(tempo, y(2, :), 'k:');

legend('Momento angular total L(t)', 'Torque \tau_2(t)');

