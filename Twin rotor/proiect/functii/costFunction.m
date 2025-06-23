function ff1=costFunction(Gc,G, criteriu, varargin)
% Verificare și conversie tip Gc
if isa(Gc, 'fotf')
    try
        Gc = minreal(oustapp(Gc, 1e-3, 10, 7));
    catch
        % Aproximarea a eșuat – atribuim un cost mare
        ff1 =  5 * 10^5;
        return;
    end
elseif ~isa(Gc, 'tf') && ~isa(Gc, 'pid')
    error('Gc trebuie să fie de tip tf, fotf sau pid.');
end

Gc_zpk = zpk(Gc);
[z, p, ~] = zpkdata(Gc_zpk, 'v');
if length(z) > length(p)
    ff1 = 5 * 10^5;
    return;
end

if isequal(Gc, tf(0, 1)) %|| isequal(Gc, tf(1, 1))
    ff1 = 5 * 10^5;
    return;
end

%H11=tf(8072.8,[1 1.287]);
H11=tf(8072.8,[1 1.287]);
H22= tf(33157,[1 3.527]);

% Determinare constantă de timp T
if isequal(G, H11)
    %T =3.04;
    %T_rise=1.71; % timp ridicare pt procesul initial
    T=0.005;
    T_rise=0.001;
elseif isequal(G, H22)
    %T =1/4;
    %T_rise=0.5/4;% timp ridicare pt procesul initial
    T=0.001;
    T_rise=0.0001;
else
    T = inf; % Default dacă G nu este H11 sau H22
end

ff1 = 5 * 10^5;

Gcf=minreal(zpk(feedback(Gc*G,1)));
t = 0:0.00001:0.9; % Pas mai mic pentru precizie
y=step(Gcf,t);



% %%
% 
% % Parametri simulare
% dt = 0.001;                           % Pas de timp
% Tsim = 5;                             % Timp total
% t = 0:dt:Tsim;
% N = length(t);
% r = 10*ones(1, N);                       % Semnal de referință
% 
% % Inițializare vectori
% e = zeros(1, N);
% u = zeros(1, N);
% y = zeros(1, N);
% 
% % Inițializare stări
% x_reg = [];                          % stare regulator
% x_proc = [];                         % stare proces
% 
% % Simulare pas cu pas
% for k = 2:N
%     % Eroare
%     e(k) = r(k) - y(k-1);
% 
%     % Răspunsul regulatorului Hr la eroare
%     [u_sim, ~, x_reg] = lsim(Gc, [e(k-1), e(k)], [0, dt], x_reg);
%     u(k) = u_sim(end);
% 
%     % Limitare semnal de comandă
%     u(k) = max(min(u(k), 1), -1);
% 
%     % Aplicare semnal de comandă asupra procesului Gp
%     [y_sim, ~, x_proc] = lsim(G, [u(k-1), u(k)], [0, dt], x_proc);
%     y(k) = y_sim(end);
% end

% Afișare rezultate
% figure;
% subplot(2,1,1);
% plot(t, y, 'LineWidth', 1.5);
% title('Ieșire sistem (y)'); ylabel('y(t)');
% 
% subplot(2,1,2);
% plot(t, u, 'LineWidth', 1.5);
% title('Semnal de comandă (u)'); ylabel('u(t)'); xlabel('Timp [s]');
%figure; plot(t, e, 'LineWidth', 1.5);
%%

if y(2)>0.5
    return
end

hold on;
%figure;step(feedback(Gc*G,1))

% if y(1)<y(end)
%     y=y-y(1);
% end

% Verificare stabilitate
if any(isnan(y)) || any(isinf(y)) || max(abs(y)) > 100
    return;
end

% Calcul Timp de ridicare (T_rid)
y_final = y(end);
idx_90 = find(y >= 0.9 * y_final, 1);
idx_10 = find(y >= 0.1 * y_final, 1);

if isempty(idx_90) || isempty(idx_10)
    return;
end

% Calculăm timpul de raspuns
tol = 0.01;           % Pragul pentru regim staționar
in_regim = abs(y - y(end)) <= tol;

% Găsim tranzițiile: 0 -> 1 (intrare în regim), 1 -> 0 (ieșire din regim)
transitions = diff([0; in_regim(:)]);  % Extindem cu 0 pentru a prinde prima intrare

idx_in = find(transitions == 1);  % Indecșii unde intră în regim
idx_out = find(transitions == -1); % Indecșii unde iese din regim

if isempty(idx_in)
    T_r = inf; % Niciodată nu intră în regim
elseif isscalar(idx_in) && (isempty(idx_out) || idx_in(end) > idx_out(end))
    T_r = t(idx_in(1)); % Intrare unică, sistem monoton
else
    T_r = t(idx_in(end)); % Mai multe intrări: sistem oscilant ⇒ ultima intrare
end


T_rid = t(idx_90) - t(idx_10);

if T_r==0 || T_rid==0
    return
end

%T_r
%T
%Intervalele dorite
%if (T_r < T / 4 || T_r > T * 1.5)
if ( T_r < T  || T_r>0.5)
    return;
end


if (T_rid < T_rise /2)% || T_rid > T_rise*7 )
%if (T_rid > T_rise * 3 || T_rid < T_rise / 4)
    return
end

% 

% figName = 'Step Response CostFunction';
% figHandle = findobj('Type', 'figure', 'Name', figName);
% if isempty(figHandle) || ~isvalid(figHandle)
%     figHandle = figure('Name', figName);
% else
%     figure(figHandle);
% end
% 
% hold on;
% step(Gcf);
%ITAE

%ff1 = trapz(t, abs(y - 1) .* t');

ff1=objectiveFunctionPID(Gc,G,y,t,criteriu, varargin{:});


end








function J = objectiveFunctionPID(Hc,G,y,t,criteriu, ww)

% Setează ponderile dacă criteriul este "combined" și au fost introduse de utilizator
w = zeros(1, 5);
if strcmpi(criteriu, "combined")
    if isnumeric(ww) && numel(ww) == 5
        w = reshape(ww, 1, 5); % Asigură că este un vector linie cu 5 elemente
    else
        error('Pentru criteriul "combined", ww trebuie să fie un vector numeric de exact 5 elemente.');
    end
end

J = 5 * 10^5;
e=1-y;
if any(isnan(e)) || any(isinf(e))
    return;
end

% Selectare criteriu
switch lower(criteriu)
    case "ise"
        J = trapz(t, e.^2);

    case "itse"
        J = trapz(t, t' .* e.^2);

    case "iae"
        J = trapz(t, abs(e));

    case "itae"
        J = trapz(t, t' .* abs(e));

    case "sensibility"
        % Folosește suma normelor pentru sensibilitate
        %S = feedback(1, Hc * G);  % Funcția de sensibilitate
        %T = feedback(Hc * G, 1);  % Funcția de sensibilitate complementară
        %sensibility = 1 - min(norm(S, inf) + norm(T, inf), 1);
        %J = sensibility;

        S = feedback(1, Hc * G);  % Funcția de sensibilitate
        T = feedback(Hc * G, 1);  % Funcția de sensibilitate complementară

        % Calcul norma H-infinit (cea mai mare amplificare)
        S_inf = norm(S, inf);
        T_inf = norm(T, inf);

        % Praguri recomandate
        S_max = 2;   % Sensibilitate maximă admisă
        T_max = 1.5; % Sensibilitate complementară maximă admisă

        % Penalizare dacă se depășesc pragurile
        penalty_S = max(0, S_inf - S_max);  % Dacă S > 2, penalizează
        penalty_T = max(0, T_inf - T_max);  % Dacă T > 1.5, penalizează

        % Funcția de cost
        J = penalty_S + penalty_T;  % Penalizare cumulativă

        % Dacă sistemul este instabil (norma prea mare), setează costul la Inf
        if S_inf > 100 || T_inf > 100
            J = Inf;
        end

    case "combined"
        % Combinație de criterii: ISE, ITAE și sensibilitate

        ISE = trapz(t, e.^2);
        ITSE= trapz(t, t' .* e.^2);
        IAE=trapz(t, abs(e));
        ITAE = trapz(t, abs(e) .* t');

        S = feedback(1, Hc * G);  % Funcția de sensibilitate
        T = feedback(Hc * G, 1);  % Funcția de sensibilitate complementară
        sensibility = 1 - min(norm(S, inf) + norm(T, inf), 1);
        J = w(1) * ISE + w(2) * ITSE + w(3) * IAE + w(4) * ITAE + w(5) * sensibility;

    otherwise
        error('Criteriu necunoscut. Alegeți între "ISE", "ITSE", "IAE", "ITAE", "sensibility", sau "combined".');
end
end
