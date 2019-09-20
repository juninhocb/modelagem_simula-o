clear; 
clc; 

% instanciando os parâmetros

Ro = 10; 
Rl = 0.1;
Rc = 0.1;
L = 6.2*10^-3;
C = 100*10^-6;
Va = 0;
%%%

% pkg load control; 

Am = [-1/(C*(Ro + Rc)), Ro/(C*(Ro+Rc)); (Rc/(Ro + Rc)- 1)/L, -(Rl + Ro*Rc)/L];

Bm = [0; 1/L ];

Cm = [1/(Ro + Rc), Rc/(Ro + Rc)];

Dm = 0;

Sys = ss(Am, Bm, Cm, Dm);

% Resposta ao Degrau
tempo = 0:0.0005: 0.05;
ys = step(Sys,tempo);

figure();
plot(tempo, ys);



