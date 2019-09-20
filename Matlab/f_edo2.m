function dydt = f_edo2(t,y,M,B,K,fa) 

dydt = zeros(2,1); 

dydt(1) = y(2);
dydt(2) = 1/M*(-B*y(2) - K*y(1) + fa); 

end
