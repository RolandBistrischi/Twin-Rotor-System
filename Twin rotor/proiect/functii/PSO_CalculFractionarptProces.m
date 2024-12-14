function C = PSO_CalculFractionarptProces_MultiTermeni(Hp, n)
    % Parametrii PSO
    nParticles = 30;       % Număr de particule
    nIterations = 50;     % Număr de iteratii
    dim = 2 * n;           % Dimensiunea particulei: K1...Kn și a1...an
    w = 0.7;               % Inerția
    c1 = 1.5;              % Coeficient de atracție către cea mai bună soluție locală
    c2 = 1.5;              % Coeficient de atracție către cea mai bună soluție globală
    
    % Limitele variabilelor
    ai_limits = [-1, 1];    % Limite pentru a_i
    Ki_limits = [-100, 100]; % Limite pentru K_i
    
    % Inițializare particule și viteze
    particles = rand(nParticles, dim);
    velocities = zeros(nParticles, dim);
    
    % Scalează particulele în limitele variabilelor
    for i = 1:n
        particles(:, 2*i-1) = particles(:, 2*i-1) * (Ki_limits(2) - Ki_limits(1)) + Ki_limits(1); % K_i
        particles(:, 2*i) = particles(:, 2*i) * (ai_limits(2) - ai_limits(1)) + ai_limits(1);    % a_i
    end
    
    personalBest = particles;
    globalBest = particles(1, :);
    personalBestScores = inf(nParticles, 1);
    globalBestScore = inf;
    
    % Obiectiv: Minimizați ISE
    for iter = 1:nIterations
        for p = 1:nParticles
            % Extragem valorile particulei curente
            K_vals = particles(p, 1:2:2*n);
            a_vals = particles(p, 2:2:2*n);
            
            % Construim regulatorul Hc
            poli = [1]; % Polinoame fixe pentru fotf
            exponenti_poli = [0];
            Hc = fotf(poli, exponenti_poli, K_vals, a_vals);
            
            % Evaluăm funcția obiectiv
            J = objectiveFunctionforMultiPID(Hc, Hp, 'sensibility');
            
            % Actualizăm cea mai bună soluție locală
            if J < personalBestScores(p)
                personalBestScores(p) = J;
                personalBest(p, :) = particles(p, :);
            end
            
            % Actualizăm cea mai bună soluție globală
            if J < globalBestScore
                globalBestScore = J;
                globalBest = particles(p, :);
            end
        end
        
        % Actualizare viteze și poziții
        for p = 1:nParticles
            velocities(p, :) = w * velocities(p, :) ...
                + c1 * rand() * (personalBest(p, :) - particles(p, :)) ...
                + c2 * rand() * (globalBest - particles(p, :));
            particles(p, :) = particles(p, :) + velocities(p, :);
        end
        
        % Aplicăm limitele pentru fiecare variabilă
        for i = 1:n
            particles(:, 2*i-1) = max(min(particles(:, 2*i-1), Ki_limits(2)), Ki_limits(1)); % K_i
            particles(:, 2*i) = max(min(particles(:, 2*i), ai_limits(2)), ai_limits(1));    % a_i
        end
    end
    
    % Returnăm regulatorul optimizat
    K_opt = globalBest(1:2:2*n);
    a_opt = globalBest(2:2:2*n);
    poli = [1];
    exponenti_poli = [0];
    C = fotf(poli, exponenti_poli, K_opt, a_opt);
end
