
% sistemas não lineares
% simulando as equações 


%equação

% dx1/dt = x2(t)
% dx2/dt = f(t) - 2*x2(t) - 2.5*sqrt(x1(t))

% x1(k+1) = x1(k) + dt*x2(k)
% x2(k+1) = x2(k) + dt*[f(k) - 2*x2(k) - 2.5*sqrt(x1(k))]

%solução numerica

Dt = 0.001;  %passo
tmax = 20; 
tempo = 0:Dt:tmax; 
N = numel(tempo); 

x1 = zeros(1,N);
x2 = zeros(1,N);



% Euler Explicito

for k = 1: N-1
    
    x1(k+1) = x1(k) + Dt*x2(k);
    
    x2(k+1) = x2(k) + Dt*(entrada1(Dt*k) - 2*x2(k) - 2.5*sqrt(x1(k)));

end

% Apresentação de resultados 

figure; 
plot(tempo, x1, 'b');
hold on 
plot(tempo, x2, 'r');
hold on 

legend('x1(t) azul', 'x2(t) vermelho');