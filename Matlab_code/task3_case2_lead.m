function [pf, efficiency, V_reg] = task3_case2_lead(A, B, C, D, Vr_line)
    % Initialize parameters
    pf = linspace(0.3, 1, 100); % Power factor range from 0.5 to 1
    theta = -acos(pf); % Corresponding angles for power factor
    Vr_ph = Vr_line / sqrt(3);
    Vr_vector = Vr_ph * exp(1j * 0); 
    
    p_w = 100e3;
    
    efficiency = zeros(1, length(p_w));
    V_reg = zeros(1, length(p_w));
    
    for i = 1:length(pf)
        Ir_mag = p_w / (sqrt(3) * Vr_line * pf(i));
        
        Ir_vector = Ir_mag * exp(-1j * theta(i));
        Vs_vector = A * Vr_vector + B * Ir_vector;
        Is_vector = C * Vr_vector + D * Ir_vector;
        Ps = 3 * real(Vs_vector * conj(Is_vector));
        
        efficiency(i) = (p_w / Ps) * 100;
        
        V_reg(i) = ((abs(Vs_vector/A) - abs(Vr_vector)) / abs(Vr_vector)) * 100;
    end
end