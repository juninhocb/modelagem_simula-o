% sistemas n�o lineares
% simulando as equa��es 

%
%
% novas vari�veis de estado 

% z1(t) = x1(t) - 0.0016
% z2(t) = x2(t)
% g(t) = f(t) - 0.1

%solu��o numerica

Dt = 0.001;  %passo
tmax = 20; 
tempo = 0:Dt:tmax; 
N = numel(tempo); 


% Simula��o n�merica


z1 = zeros(1,N);
z2 = zeros(1,N);



% Euler Explicito

for k = 1: N-1
    
    z1(k+1) = z1(k) + Dt*z2(k);
    
    z2(k+1) = z2(k) + Dt*(entrada2(Dt*k) - 2*z2(k) - 31.25*z1(k));

end

%Recuperando os valores utilizando o ponto de opera��o

x1 = z1 + 0.0016;
x2 = z2; 
% Apresenta��o de resultados 

figure; 
plot(tempo, x1, 'b');
hold on 
plot(tempo, x2, 'r');
hold on 

legend('x1(t) azul linearizado', 'x2(t) vermelho linearizado');