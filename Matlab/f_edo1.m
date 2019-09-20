function dvdt =  f_edo1(t,v,M,B)

dvdt = 1/M*(-B*v+forca_externa(t)); 

end

function fa = forca_externa(t)

    if  t >= 1 && t <= 70
    fa  = 1; 
    else 
    fa = 0; 
    
    end
end

