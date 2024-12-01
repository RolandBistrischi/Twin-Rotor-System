%% MultiPID licenta

function  C = CalculFractionarptProces(Hp)%out regulator, in proces

C=-1;
%H22= tf(33157,[1 3.527]);

if ~isa(Hp, 'tf') && ~isa(Hp, 'fotf')
    error('Hp trebuie să fie de tip tf sau fotf.');
end
%%
n=20;
K_inceput=100;
ai_pas=0.01;
ai_figure=-1:ai_pas:1;
Ki_figure=-K_inceput:1:K_inceput;
J_figure=zeros(length(ai_figure), length(Ki_figure));
poli = [1];
exponenti_poli = [0];
zerouri = zeros(1,n);
exponenti_zerouri=zeros(1,n);
%%
Hc_eficient_ISE=fotf([35 56 ], [2,3], [12 ],[2 ]);
Hc_eficient_ISE_initial=fotf([35 56 ], [2,3], [12 ],[2 ]);
J_ISE=inf;
current_combination = [0, 0];
%used_combinations{end+1, 1} = current_combination;
i=1;
while i<=n

    for ai_idx = 1:length(ai_figure)
        for Ki_idx = 1:length(Ki_figure)
            % Extrage valorile curente de ai și Ki
            ai = ai_figure(ai_idx);
            Ki = Ki_figure(Ki_idx);

            % Creează regulatorul fotf
            zerouri(i) = Ki;
            exponenti_zerouri(i) = ai;

            %if ismember(current_combination, used_combinations, 'rows')
            if Ki~=0 && ai~=0
                Hc = fotf(poli, exponenti_poli, zerouri, exponenti_zerouri);
            %else
             %   continue
            end

          Hc_eficient_ISE =  CompareControllers(Hc, Hc_eficient_ISE, Hp)
            % % Calculează funcția obiectiv ISE
            % J_ISE_aux = objectiveFunctionforMultiPID(Hc, Hp, 'ISE');
            % 
            % % Stochează valoarea lui J în matrice
            % J_figure(ai_idx, Ki_idx) = J_ISE_aux;
            % 
            % 
            % if J_ISE_aux < J_ISE
            % 
            % 
            %     J_ISE = J_ISE_aux
            %     Hc_eficient_ISE = Hc
            %     % current_combination = [ai, Ki];
            %     % used_combinations{end+1, 1} = current_combination;
            %     % current_combination = [ai, -Ki];
            %     % used_combinations{end+1, 1} = current_combination;
            % 
            % end
        end
    end

   if Hc_eficient_ISE==Hc_eficient_ISE_initial
       break;
   else
       Hc_eficient_ISE_initial=Hc_eficient_ISE;
   end
    i=i+1


    % 
    % [Ki_mesh, ai_mesh] = meshgrid(Ki_figure, ai_figure);
    % figure;
    % mesh(Ki_mesh, ai_mesh, J_figure);
    % xlabel('Ki');
    % ylabel('ai');
    % zlabel('J');
    % title('Funcția obiectiv ISE pentru MultiPID %d',i);
end
%C=[Hc_eficient_ISE, Hc_eficient_Stabil]
C=Hc_eficient_ISE
%C=oustafopid(Hfopid, N, w_L, w_H);

end