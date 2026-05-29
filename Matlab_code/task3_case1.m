function [p_kw, efficiency, V_reg] = task3_case1(A, B, C, D, Vr_line)
    % Initialize parameters
    pf = 0.8;
    theta = acos(pf);
    Vr_ph = Vr_line / sqrt(3);
    Vr_vector = Vr_ph * exp(1j * 0); 
    
    p_kw = linspace(0, 100, 100);
    p_w = p_kw * 1000;
    
    efficiency = zeros(1, length(p_w));
    V_reg = zeros(1, length(p_w));
    
    for i = 1:length(p_w)
        Ir_mag = p_w(i) / (sqrt(3) * Vr_line * pf);
        Ir_vector = Ir_mag * exp(-1j * theta);

        Vs_vector = A * Vr_vector + B * Ir_vector;
        Is_vector = C * Vr_vector + D * Ir_vector;
        
        Ps = 3 * real(Vs_vector * conj(Is_vector));

        efficiency(i) = (p_w(i) / Ps) * 100;
        
        V_reg(i) = ((abs(Vs_vector/A) - abs(Vr_vector)) / abs(Vr_vector)) * 100;
    end
    
    
end