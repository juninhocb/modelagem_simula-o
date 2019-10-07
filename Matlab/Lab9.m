%lab 9

%Euler Explicito 

% x(k+1) = x(k) + t* f[x(k), fa(k)]

% dx(t) + f[x(t), fa(t)]

% A.x(k) + B.fa(k)

% x(k+1) = x(k) + t*A*x(k) + t*B*fa(k)

% x (k+1) = (I + t*A)x(k) + t*B*fa(k)

% y(k) = C * x(k) + D*fa(k)

%instanciando variáveis

M = 1; %kg
K = 3; %N/m
B = 2; %Ns/m

x0 = [0.5; 0];

%fa = e^-t

A = [0 , 1; -K/M, -B/M]; 
Bm = [0 ; 1/M]; 
C = [1 , 0]; 
D = 0; 

t = 0.2; 
tmax = 10; 

tempo = 0:t:tmax;
N = numel(tempo); %numero de elementos do vetor de tempo 
fa = exp(-tempo);

x = zeros(2, N);
x (:,1) = x0;

y = zeros(1, N); 

for k = 1:N-1
    
    y(k) = C*x(:,k) + D*fa(k);
    
    x(:, k+1) = (eye(2) + t*A)*x(:,k) + t *Bm*fa(k);
    
    
end

%solução analitica

ya = -0.5*exp(-tempo).*cos(sqrt(2)*tempo) + ...
    0.5*exp(-tempo) + ...
    0.612*exp(-tempo).*cos(sqrt(2)*tempo - 0.615);




figure; 
plot(tempo, y, 'k--');
hold on;
plot(tempo, ya, 'b');
