function PlotButtonPushed(app, event)
    % 1. Retrieve inputs from UI components
    Ko = app.KoSlider.Value;          % Pre-exponential factor 
    Ea = app.EaSlider.Value;          % Activation energy 
    Kdo = app.KdoSlider.Value;        % Catalyst deactivation prefactor 
    Ead = app.EadSlider.Value;        % Deactivation activation energy 
    dH = app.dHSlider.Value;          % Heat of reaction 
    Cp = app.CpSlider.Value;          % Heat capacity 
    rho = app.rhoSlider.Value;        % Density 
    Xo = app.XoSlider.Value;          % Initial conversion 
    To = app.ToKnob.Value;            % Inlet temperature 
    Zf = app.ZfSlider.Value;          % Final reactor length 
    h = app.hSpinner.Value;           % Step size 

    % Constants
    R = 8.314; % Universal gas constant (J/mol.K) [cite: 45]
    
    % Initial Conditions
    % State vector Y = [X; T; A]
    Y0 = [Xo; To; 1]; % A(0) = 1 (Fresh catalyst) [cite: 58, 59]
    Z = 0:h:Zf;       
    N = length(Z);

    % Define the system of ODEs
    % dY/dZ = f(Z, Y)
    % Y(1) = X, Y(2) = T, Y(3) = A
    ode_func = @(Z, Y) [
        (Ko * exp(-Ea / (R * Y(2)))) * Y(3) * (1 - Y(1));                                     % dX/dZ [cite: 22, 34]
        (dH * (Ko * exp(-Ea / (R * Y(2)))) * Y(3) * (1 - Y(1))) / (rho * Cp);                 % dT/dZ [cite: 23, 34]
        -(Kdo * exp(-Ead / (R * Y(2)))) * Y(3)                                                % dA/dZ [cite: 24, 36]
    ];

    % Clear previous plots
    cla(app.UIAxes_Conversion);
    cla(app.UIAxes_Temperature);
    cla(app.UIAxes_Activity);
    hold(app.UIAxes_Conversion, 'on');
    hold(app.UIAxes_Temperature, 'on');
    hold(app.UIAxes_Activity, 'on');

    colors = lines(4);
    
    % 2. Numerical Solvers
    
    % RK1 (Explicit Euler) [cite: 14, 54]
    if app.RK1CheckBox.Value
        Y_rk1 = zeros(3, N);
        Y_rk1(:, 1) = Y0;
        for i = 1:(N-1)
            Y_rk1(:, i+1) = Y_rk1(:, i) + h * ode_func(Z(i), Y_rk1(:, i));
        end
        plotResults(app, Z, Y_rk1, 'RK1', colors(1,:), 'o-');
    end

    % RK2 (Heun's Method)
    if app.RK2CheckBox.Value
        Y_rk2 = zeros(3, N);
        Y_rk2(:, 1) = Y0;
        for i = 1:(N-1)
            k1 = ode_func(Z(i), Y_rk2(:, i));
            k2 = ode_func(Z(i) + h, Y_rk2(:, i) + h*k1);
            Y_rk2(:, i+1) = Y_rk2(:, i) + (h/2) * (k1 + k2);
        end
        plotResults(app, Z, Y_rk2, 'RK2', colors(2,:), 's--');
    end

    % RK3
    if app.RK3CheckBox.Value
        Y_rk3 = zeros(3, N);
        Y_rk3(:, 1) = Y0;
        for i = 1:(N-1)
            k1 = ode_func(Z(i), Y_rk3(:, i));
            k2 = ode_func(Z(i) + h/2, Y_rk3(:, i) + (h/2)*k1);
            k3 = ode_func(Z(i) + h, Y_rk3(:, i) - h*k1 + 2*h*k2);
            Y_rk3(:, i+1) = Y_rk3(:, i) + (h/6) * (k1 + 4*k2 + k3);
        end
        plotResults(app, Z, Y_rk3, 'RK3', colors(3,:), '^-.');
    end

    % RK4 [cite: 14, 54]
    if app.RK4CheckBox.Value
        Y_rk4 = zeros(3, N);
        Y_rk4(:, 1) = Y0;
        for i = 1:(N-1)
            k1 = ode_func(Z(i), Y_rk4(:, i));
            k2 = ode_func(Z(i) + h/2, Y_rk4(:, i) + (h/2)*k1);
            k3 = ode_func(Z(i) + h/2, Y_rk4(:, i) + (h/2)*k2);
            k4 = ode_func(Z(i) + h, Y_rk4(:, i) + h*k3);
            Y_rk4(:, i+1) = Y_rk4(:, i) + (h/6) * (k1 + 2*k2 + 2*k3 + k4);
        end
        plotResults(app, Z, Y_rk4, 'RK4', colors(4,:), 'd:');
    end
    
    % Update Status Label
    app.StatusLabel.Text = 'Plot updated successfully'; [cite: 83]
    
    % Finalize plots
    legend(app.UIAxes_Conversion, 'show');
    legend(app.UIAxes_Temperature, 'show');
    legend(app.UIAxes_Activity, 'show');
end

% Helper function to keep the main callback clean
function plotResults(app, Z, Y, methodName, col, lineSpec)
    plot(app.UIAxes_Conversion, Z, Y(1,:), lineSpec, 'Color', col, 'DisplayName', methodName, 'LineWidth', 1.5);
    plot(app.UIAxes_Temperature, Z, Y(2,:), lineSpec, 'Color', col, 'DisplayName', methodName, 'LineWidth', 1.5);
    plot(app.UIAxes_Activity, Z, Y(3,:), lineSpec, 'Color', col, 'DisplayName', methodName, 'LineWidth', 1.5);
end
