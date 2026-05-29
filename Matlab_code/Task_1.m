function [R, L_ph, C_ph] = Task_1(rho, l, d, TS, D_vals)

    d = d/100;
    R=(4*rho*l)/(pi*d^2);

    % Geometric Mean Radius (GMR)
    GMR=0.7788*d/2;

    switch TS
        case 1  % Symmetrical
            D = D_vals(1);
            L_ph=2e-7*log(D/GMR);
            C_ph=2*pi*8.854e-12/log(2*D/d);

        case 2  % Unsymmetrical
            D_ab = D_vals(1);
            D_bc = D_vals(2);
            D_ca = D_vals(3);
            D_eq=(D_ab*D_bc*D_ca)^(1/3);
            L_ph=2e-7*log(D_eq/GMR);
            C_ph=2*pi*8.854e-12/log(2*D_eq/d);
    end         
end