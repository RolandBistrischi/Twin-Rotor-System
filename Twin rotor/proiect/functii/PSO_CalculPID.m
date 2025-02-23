function best_pid = optimize_pid_pso(G)
    % Setări PSO
    N_particles = 30;  % Numărul de particule
    max_iter = 100;    % Număr maxim de iterații
    w = 0.7;           % Factor de inerție
    c1 = 1.5;          % Coeficient cognitiv
    c2 = 1.5;          % Coeficient social

    % Limite pentru parametrii PID
    param_min = [0, 0, 0];   
    param_max = [50, 50, 50]; 

    % Inițializare particule și viteze
    particles = rand(N_particles, 3) .* (param_max - param_min) + param_min;
    velocities = zeros(N_particles, 3);

    % Evaluare inițială a particulelor
    personal_best = particles;
    personal_best_cost = arrayfun(@(i) pid_cost(G, particles(i, 1), particles(i, 2), particles(i, 3)), 1:N_particles)';

    % Cea mai bună particulă globală
    [global_best_cost, idx] = min(personal_best_cost);
    global_best = personal_best(idx, :);

    % Algoritmul PSO
    for iter = 1:max_iter
        for i = 1:N_particles
            % Actualizare viteză
            velocities(i, :) = w * velocities(i, :) ...
                + c1 * rand() * (personal_best(i, :) - particles(i, :)) ...
                + c2 * rand() * (global_best - particles(i, :));

            % Actualizare poziție și aplicare limite
            particles(i, :) = max(param_min, min(param_max, particles(i, :) + velocities(i, :)));

            % Calcul cost pentru noua poziție
            cost = pid_cost(G, particles(i, 1), particles(i, 2), particles(i, 3));

            % Actualizare cel mai bun personal
            if cost < personal_best_cost(i)
                personal_best(i, :) = particles(i, :);
                personal_best_cost(i) = cost;
            end
        end

        % Actualizare cel mai bun global
        [new_global_best_cost, idx] = min(personal_best_cost);
        if new_global_best_cost < global_best_cost
            global_best = personal_best(idx, :);
            global_best_cost = new_global_best_cost;
        end

        % Afișare progres
        fprintf('Iter %d: Best Cost = %.6f\n', iter, global_best_cost);
    end

    % Returnează cel mai bun PID găsit
    best_pid = global_best;
end

function cost = pid_cost(Gp, Kp, Ki, Kd)
    % Extrage parametrii din structura Gp
    G = Gp.regulator;
    T = Gp.raspuns;
    T_rid_initial = Gp.ridicare;

    % Creează regulatorul PID și sistemul în buclă închisă
    C = pid(Kp, Ki, Kd);
    T_closed = feedback(C * G, 1);

    % Simulare răspuns la semnal treaptă
    t = 0:0.001:30; 
    r = ones(size(t)); 
    y = lsim(T_closed, r, t);

    % Verificare stabilitate
    if max(abs(y)) > 10 || any(isnan(y)) || any(isinf(y))
        cost = inf;
        return;
    end

    % Calcul eroare și cost ISE
    e = r - y';
    cost = trapz(t, e.^2);

    % Determinare timpi de răspuns și ridicare
    y_final = y(end);
    idx10 = find(y >= 0.1 * y_final, 1);
    idx90 = find(y >= 0.9 * y_final, 1);

    if isempty(idx90) || isempty(idx10)
        cost = inf; % Procesul este instabil sau nu a ajuns la regim
        return;
    end

    T_raspuns = t(idx90); % Când ieșirea ajunge la 90% și rămâne acolo
    T_ridicare = T_raspuns - t(idx10); % Timp de ridicare (10% → 90%)

    % Intervalele dorite pentru timpi
    T_raspuns_target = (T / 4 + T / 10) / 2;
    T_ridicare_target = (T_rid_initial / 5 + T_rid_initial / 2) / 2;

    % Penalizări pentru timpi incorecți
    penalty = 100 * (abs(T_raspuns - T_raspuns_target) + abs(T_ridicare - T_ridicare_target));

    % Cost final
    cost = cost + penalty;
end
