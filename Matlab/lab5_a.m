% lab 5 Questão A 
clc 
clear
% a) Função de transferencia, H(s) = 1 / m*s^2 + b*s + k
% b) tf ([1], [1 0.5 0.75])

% atribuindo valores a tf 

%x = tf ([1], [1 0.5 0.75]); 

% c) resposta ao degrau da função de transferencia 'x'
%step(x) 
% respostao ao impulso da FT 'x'
%impulse(x)
% resposta a x(t) = u(t?2)?u(t?3) 
% lsim (x, u, t)  x = função de transferencia, u = sinal u(t-2) - u(t-3)??, t = tempo de amostra

% d) x1 = x ; x2 = v 
% então x1' = x2 e x2' = 1/M*(-B*x2 -K*x1 + Fa); 

% e) 

M = 1; 
B = 0.5; 
K = 0.75;
tempo = 0:0.0005: 0.05;

%%%%%%%%%%%%% Representando a função %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Espaço de estados
Am = [ 0 , 1 ; -K/M , -B/M];

Bm = [0; 1/M ];

Cm = [ 1 , 0 ];

Dm = 0;

Sys = ss(Am, Bm, Cm, Dm); %função que demonstra a função em E.E

% Resposta ao Degrau
%ys = step(Sys,tempo);

% Resposta ao Impulso
ys = impulse(Sys, tempo);

figure();
plot(tempo, ys);
















