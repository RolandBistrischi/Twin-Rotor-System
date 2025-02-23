%% Funcție obiectiv pentru regulator fracționar MultiPID

function J = objectiveFunctionforMultiPID(Hc, G, criteriu, varargin)
umax=1;
switch class(Hc)
    case 'tf'
        % Direct utilizabil
    case 'fotf'
        Hc = zpk(minreal( oustapp(Hc, 0.001, 1000, 7)));
    case 'pid'
         % Direct utilizabil
    otherwise
        error('Hc trebuie să fie de tip tf sau fotf.');
end

J = inf;
w1 = 1; w2 = 0; w3 = 0; w4=0; w5=0;

% Setează ponderile dacă criteriul este "combined" și au fost introduse de utilizator
if strcmp(criteriu, "combined")
    if numel(varargin) == 5
        w1 = varargin{1};
        w2 = varargin{2};
        w3 = varargin{3};
        w4 = varargin{4};
        w5 = varargin{5};
    else
        error('Pentru criteriul "combined", specificați w1, w2, w3, w4 si w5.');
    end
end


switch criteriu
    case "ISE"
        % Calcul ISE: Integral of Squared Error
        [e, t] = simulateResponse(Hc, G,umax);
        if isinf(e)
            J=inf;
            return
        end
        J = trapz(t, e.^2);

    case "ITSE"
        % Calcul ITSE: Integral of Time-weighted Squared Error
        [e, t] = simulateResponse(Hc, G,umax);
        if isinf(e)
            J=inf;
            return
        end
        J = trapz(t, t' .* e.^2);

    case "IAE"
        % Calcul IAE: Integral of Absolute Error
        [e, t] = simulateResponse(Hc, G,umax);
        if isinf(e)
            J=inf;
            return
        end
        J = trapz(t, abs(e));

    case "ITAE"
        % Calcul ITAE: Integral of Time-weighted Absolute Error
        [e, t] = simulateResponse(Hc, G,umax);
        if isinf(e)
            J=inf;
            return
        end
        J = trapz(t, t' .* abs(e));

    case "sensibility"
        % Folosește suma normelor pentru sensibilitate
        S = feedback(1, Hc * G);  % Funcția de sensibilitate
        T = feedback(Hc * G, 1);  % Funcția de sensibilitate complementară
        J = norm(S, inf) + norm(T, inf);
        J = min(J, 1);
        J = 1 - J;

    case "combined"
        % Combinație de criterii: ISE, ITAE și sensibilitate
        [e, t] = simulateResponse(Hc, G,umax);
        if isinf(e)
            J=inf;
            return
        end
        ISE = trapz(t, (r-y).^2);
        ITSE=trapz(t, t .* e.^2);
        IAE=trapz(t, abs(e));
        ITAE = trapz(t, t .* abs(r-y));
        S = feedback(1, Hc * G);  % Funcția de sensibilitate
        T = feedback(Hc * G, 1);  % Funcția de sensibilitate complementară
        sensibility = norm(S, inf) + norm(T, inf);
        sensibility = min(sensibility, 1);
        sensibility = 1 - sensibility;
        J = w1 * ISE + w2 * ITSE + w3 * IAE + w4 * ITAE + w5 * sensibility;

    otherwise
        error('Criteriu necunoscut. Alegeți între "ISE", "ITSE", "IAE", "ITAE", "sensibility", sau "combined".');
end
end






function [e, t] = simulateResponse1(Hc, G)
%t = 0:0.01:10;%t = 0: 3.9e-03:10; % Timp de simulare cu pas mai mic (10000 Hz)

bw = bandwidth(minreal(G * Hc)) / (2 * pi); % Frecvență în rad/s -> Hz
Ts = 1 / (10 * bw); % Eșantionare de 10 ori mai rapidă decât Nyquist
t = 0:Ts:10;


r = ones(size(t));
[y1, t] = lsim(feedback(Hc * G,1), r, t);
%[y2,t]= lsim(feedback(G,1), r, t);
e = r - y1';

% figure;
% plot(t,y1);
% hold on
% plot(t,y2);
end



function [e, t] = simulateResponse_vechi(Hc, G, umax)
% Parametrii de simulare
%t = 0:0.01:10;
bw = bandwidth(minreal(G * Hc)) / (2 * pi); % Frecvență în rad/s -> Hz
Ts = 1 / (10 * bw); % Eșantionare de 10 ori mai rapidă decât Nyquist
t = 0:Ts:Ts*10^5;

r = ones(size(t));

% Calculăm răspunsul sistemului și semnalul de comandă
try
    [y, t] = lsim(minreal(feedback(G * Hc, 1)), r, t); % Ieșirea sistemului

    % Verificăm dacă ieșirea conține NaN sau Inf
    if any(isnan(y)) || any(isinf(y))
        e = inf;
        return;
    end

    % Calculăm semnalul de comandă
    u = lsim(Hc, r - y', t); % Semnalul de comandă al regulatorului

    % Verificăm dacă semnalul de comandă depășește limita
    if any(abs(u) > umax)
        % Aplicăm limitarea semnalului de comandă
        u_limited = min(max(u, -umax), umax);

        % Recalculăm răspunsul ieșirii cu semnalul limitat
        [y_limited, ~] = lsim(G, u_limited, t);

        % Calculăm eroarea folosind ieșirea recalculată
        e = r - y_limited';
    else
        % Dacă semnalul este valid, folosim ieșirea inițială
        e = r - y';
    end
catch
    % Dacă apare vreo eroare în timpul simulării, penalizăm regulatorul
    e = inf;
end
end




function [e, t] = simulateResponse(Hc, G, umax)

H11=tf(8072.8,[1 1.287]);
H22= tf(33157,[1 3.527]);
T=inf;
% Determinare constantă de timp T
if isequal(G, H11)
    T = 4 / 1.287;
    T_rise=0.000272; % timp ridicare pt procesul initial
elseif isequal(G, H22)
    T = 4 / 3.527;
    T_rise=6.63e-05;% timp ridicare pt procesul initial
else
    T = inf; % Default dacă G nu este H11 sau H22
end

% Parametrii de simulare
bw = bandwidth(minreal(G * Hc)) / (2 * pi); % Frecvență în Hz
Ts = 1 / (10 * bw); % Eșantionare de 10 ori mai rapidă decât Nyquist


maxSimTime = min(10, 10 * T); % Timp maxim de simulare (ajustează dacă e necesar)
numPoints = min(10000, floor(maxSimTime / Ts)); % Limitează la max 10.000 de puncte
t = linspace(0, maxSimTime, numPoints);
%t = 0:Ts:10; % Simulăm pentru 10 secunde

r = ones(size(t)); % Semnal de referință (treaptă unitară)

try
    % Calculăm răspunsul sistemului
    sys_cl = minreal(feedback(Hc * G, 1));
    [y, t] = lsim(sys_cl, r, t);

    % Verificăm dacă ieșirea conține NaN sau Inf
    if any(isnan(y)) || any(isinf(y))
        e = inf;
        return;
    end

    if max(abs(y)) > 100 * max(abs(r)) 
        e = inf;
        return;
    end

     % Detectare oscilații continue (fără stabilizare)
    if range(y(end-10:end)) > 0.05 % Dacă oscilează cu amplitudine > 0.05 în final
        e = inf;
        return;
    end

    % Calculăm timpul de răspuns
    steady_state = y(end); % Valoarea de regim
    tol = 0.01; % Prag pentru a considera că suntem la regim stabil
    idx = find(abs(y - steady_state) <= tol, 1, 'first');
    T_r = t(idx);

    if isempty(idx)||(T_r < T / 4 || T_r > T / 2)
        e = inf;
        return;
    end

    % Calculăm timpul de ridicare (T_rise)
    y_10 = steady_state * 0.1; % 10%
    y_90 = steady_state * 0.9; % 90% 
    idx_10 = find(y >= y_10, 1, 'first'); 
    idx_90 = find(y >= y_90, 1, 'first'); 

    if isempty(idx_10) || isempty(idx_90)
        e = inf; % Penalizare dacă nu se găsesc limitele
        return;
    end

    T_ris = t(idx_90) - t(idx_10);

    % **Constrângere: T_rise trebuie să fie între T/10 și T/5**
    if T_ris < T_rise / 10 || T_ris > T_rise / 5
        e = inf;
        return;
    end


    % Calculăm semnalul de comandă
    u = lsim(Hc, r - y', t);

    % Limitare semnal și recalculare doar dacă e necesar
    if any(abs(u) > umax)
        u = min(max(u, -umax), umax);
        [y, ~] = lsim(G, u, t);
    end

    % Calcul eroare
    e = r - y';
catch
    % Dacă apare o eroare în timpul simulării
    e = inf;
end
end
