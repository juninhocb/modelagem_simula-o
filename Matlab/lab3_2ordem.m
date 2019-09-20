% edo de segunda ordem 
% mx'' + bx' + kx = fa(t)
%  em fun��o da velociade 
% mv'' + bv' + kv = fa(t)' 

% fun��o de transferencia 

% MX(s)s^2 + BX(s)s + KX(s) = FA(s) 
% (M*s^2 + B*s + K)X(s) = FA(s)
% X(s)/ FA(s) = 1 / (M*s^2 + B*s + K)

% H(s) = 1/M/ s^2 + B/M*s + K/M (forma monica)
% H(s) = Gs / s^2 * 2*Csi*wn*s + wn^2 
% GS = ganho em regime permanente 
% Wn = Forma natural da oscila��o 
% Csi = Coeficiente de amortecimento 
% Gs = 1/M 
% wn = sqrt(K/M) 
% Csi = B/ 2*sqrt(K*M)
% wd = wn*sqrt(1-Csi^2)     

% voltando a fun��o 
%novas vari�veis     x(t) = y1 e y2 = y1' (para utilizar ode45)
% y1' = y2
% y2' = 1/M*(-B*y2 - K*y1 + fa(t)) 


% Par�metros do sistema
M = 1;     %kg
B = 0.1;    %Ns/m
K = 0.1;    %N/M

tempo = 0:0.5:100; 
fa = 1;  
y0 = [0;0]; 

% Solu��o n�merica da EDO 

[t,y] = ode45(@(t,y) f_edo2(t,y,M,B,K,fa), tempo, y0); %independente,dependente
% retorno de vetores = ode45 (@fun��o , tempo de amostra(intervalo), condi��es
% iniciais)
% ode45 tem que ser representada por equa��es de primeira ordem
% a fun��o � a derivda da fun��o isolada


%Apresenta��o dos resultados 
f1 = figure('Units','Centimeters','Position',.... 
    [3 3 15 9], 'color', [1,1,1]); 
plot(t,y); 
grid on; 

xlabel('Tempo t (segundos)'); 
ylabel('v(t)'); 

% trapz(t,v) mostra a distancia percorrida, ou seja a �rea abaixo da curva 




