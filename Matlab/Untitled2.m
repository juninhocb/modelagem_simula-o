figure('Units', 'Centimeters', 'Position', [2 3 15 10], 'color', [1 1 1]);
axes('FontName', 'Arial', 'FontSize', 11, 'Position', [0.1 0.1 0.5 0.5]); 
box on; %insere borda 
t = 0:0.5:5
%plot(sin(t), 'LineWidth', 2);   %grossura da linha 
%plot(sin(t), 'LineStyle', '--');  %tracejado
%plot(sin(t), 'r');  %cor  ou plot(sin(t), 'Color', (1 0 0)); 
plot(sin(t))
hold on 
plot(cos(t), '--')
xlabel('Tempo(segundos)', 'FontName', 'Arial', 'FontSize', 11);
ylabel('Amplitude(metros)', 'FontName', 'Arial', 'FontSize', 11); 
title('Gráfico do Seno e Cosseno', 'FontName', 'Arial', 'FontSize', 20,'Color', 'B');
grid on   % as labels tem que estar abaixo do plot  


