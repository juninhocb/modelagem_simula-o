%% Aula 3 

% Parâmetros do sistema
M = 10;     %kg
B = 0.5;    %Ns/m

tempo = 0:0.5:150; 
fa = 1;  
v0 = 0;

% Solução númerica da EDO 

[t,v] = ode45(@(t,v) f_edo1(t,v,M,B), tempo, v0); %independente,dependente
% retorno de vetores = ode45 (@função , tempo de amostra, condições
% iniciais)


%Apresentação dos resultados 
f1 = figure('Units','Centimeters','Position',.... 
    [3 3 15 9], 'color', [1,1,1]); 
plot(t,v); 
grid on; 

xlabel('Tempo t (segundos)'); 
ylabel('v(t)'); 

% trapz(t,v) mostra a distancia percorrida, ou seja a área abaixo da curva 