function dydt = f_edo2(t,y,M,B,K,fa) 

dydt = zeros(2,1); 

dydt(1) = y(2);
dydt(2) = 1/M*(-B*y(1) - K*y(2) + fa); 

end

