function [A,B,C,D] = Task2(R,L,Cap,d,model,f)

W = 2*pi*f;
Z = R + 1j*W*L*d;
Y = 1j*W*Cap*d;
Zc = (Z/Y)^0.5;
GAM = (Z*Y)^0.5;

if(d < 80000)
    A = 1;
    B = Z;
    C = 0;
    D = 1;
    
elseif (d < 250000)
    if(strcmp(model,'pi'))
        A = 1 + Z*Y/2;
        B = Z;
        C = Y*(1 + Z*Y/4);
        D = A;
    elseif(strcmp(model,'T'))
        A = 1 + Z*Y/2;
        B = Z*(1 + Z*Y/4);
        C = Y;
        D = A;
    end
elseif(d > 250000)
    A = cosh(GAM);
    B = Zc*sinh(GAM);
    C = (1/Zc)*sinh(GAM);
    D = A;
end

end