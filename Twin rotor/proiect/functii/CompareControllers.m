function bestController = CompareControllers(Hc1, Hc2, G)
% Functie care compara doua regulatoare Hc1 si Hc2 pe procesul G
% si returneaza regulatorul mai bun in functie de:
% - Timpul de raspuns
% - Suprareglajul minim
% - Timpul de urcare

switch class(Hc1)
    case 'tf'
        Hc1_oust=Hc1;
    case 'fotf'
        Hc1_oust = oustapp(Hc1, 0.001, 1000, 7);
    otherwise
        error('Hc1 trebuie să fie de tip tf sau fotf.');
end

switch class(Hc2)
    case 'tf'
        Hc2_oust=Hc2;
    case 'fotf'
        Hc2_oust = oustapp(Hc2, 0.001, 1000, 7);
    otherwise
        error('Hc2 trebuie să fie de tip tf sau fotf.');
end

if checkZerosGreaterThanPoles(Hc1_oust)
   bestController = Hc2;
    return;
end

% Verifică dacă Hc2 are mai multe zerouri decât poli
if checkZerosGreaterThanPoles(Hc2_oust)
    bestController = Hc1;
    return; 
end

% Creare sisteme în buclă închisă
loop1 = feedback(Hc1_oust * G, 1);
loop2 = feedback(Hc2_oust * G, 1);

if ~isstable(loop1)
    %fprintf('Sistemul cu Hc1 este instabil. Se alege Hc2.\n');
    bestController = Hc2;
    return;  % Iesim din functie imediat daca Hc1 este instabil
end

if ~isstable(loop2)
    %fprintf('Sistemul cu Hc2 este instabil. Se alege Hc1.\n');
    bestController = Hc1;
    return;  % Iesim din functie imediat daca Hc2 este instabil
end
% Simulare răspuns treaptă
[y1, t1] = step(loop1);
[y2, t2] = step(loop2);

% Extrage parametrii de performanță pentru fiecare regulator
metrics1 = EvaluatePerformance(t1, y1);
metrics2 = EvaluatePerformance(t2, y2);

% Comparația între regulatori
% Prioritate: timp de răspuns, suprareglaj, timp de urcare
if metrics1.responseTime < metrics2.responseTime || ...
        (metrics1.responseTime == metrics2.responseTime && metrics1.overshoot < metrics2.overshoot) || ...
        (metrics1.responseTime == metrics2.responseTime && metrics1.overshoot == metrics2.overshoot && metrics1.riseTime < metrics2.riseTime)

    bestController = Hc1;
else
    bestController = Hc2;
end
end

function metrics = EvaluatePerformance(t, y)
% Functie care evalueaza performanta unui raspuns treapta
% Parametri: timp de răspuns, suprareglaj, timp de urcare

% Timp de raspuns (95% din valoarea finală)
finalValue = y(end);
responseTime = t(find(y >= 0.95 * finalValue, 1, 'first'));

% Suprareglaj (maxim - valoare finală, procentual)
overshoot = max(0, max(y) - finalValue) / finalValue * 100;

% Timp de urcare (10%-90% din valoarea finală)
riseStart = find(y >= 0.1 * finalValue, 1, 'first');
riseEnd = find(y >= 0.9 * finalValue, 1, 'first');
riseTime = t(riseEnd) - t(riseStart);

% Returnează metricele într-o structură
metrics.responseTime = responseTime;
metrics.overshoot = overshoot;
metrics.riseTime = riseTime;
end



function isValid = checkZerosGreaterThanPoles(Hc)
% Verifică dacă regulatorul Hc are mai multe zerouri decât poli
[z, p, k] = zpkdata(Hc);  % Extrage zerourile și poli din funcția de transfer

numZeros = length(z{1});  % Numărul de zerouri
numPoles = length(p{1});  % Numărul de poli

% Compară numărul de zerouri și poli
if numZeros==0
    isValid=true;
    return;
end

isValid = numZeros > numPoles;


end