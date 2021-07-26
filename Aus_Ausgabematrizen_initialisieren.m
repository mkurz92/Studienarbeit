% Ausgabematrizen initialisieren
% Datum: 26.08.2018
% Markus Kurz
%
% Changelog:
% 
% 


% ----- Ausgabematrizen initialisieren -----
fprintf('Ausgabematrizen initialisieren...%s\n', mfilename);


% Anzahl der Werte pro Arbeitsspiel
global WerteASP
WerteASP = 720/Winkelaufloesung;

% Anzahl Arbeitsspiele
global AnzASP


    % --- Ausgabematrizen mit 0 initialisieren und NaN füllen ---
        % Segmentfläche Feuersteg [mm^2]
        Seg_Mat_A_Fst = zeros(WerteASP, AnzASP, P_Anz);
        Seg_Mat_A_Fst(:,:,:) = NaN;
                    
        % Segmentvolumen Feuersteg [mm^3]
        Seg_Mat_V_Fst = zeros(WerteASP, AnzASP, P_Anz);
        Seg_Mat_V_Fst(:,:,:) = NaN;
        
        % Segmentdruck Feuersteg
        Seg_Mat_P_Fst = zeros(WerteASP, AnzASP, P_Anz);
        Seg_Mat_P_Fst(:,:,:) = NaN;
        
        % Volumen Feuersteg komplett [mm^3]
        Feuer_Mat_V_sum = zeros(WerteASP, AnzASP);
        Feuer_Mat_V_sum(:,:) = NaN;
        
        % Abstand bei Mitte Feuersteg: Kolben - Buchse an Punkt P [mm]
        Seg_Mat_Abs_K_P = zeros(WerteASP, AnzASP, P_Anz);
        Seg_Mat_Abs_K_P(:,:,:) = NaN;
        
        % Abstand bei Kolbendach: Kolben - Buchse an Punkt P [mm]
        Seg_Mat_Abs_K_o_P = zeros(WerteASP, AnzASP, P_Anz);
        Seg_Mat_Abs_K_o_P(:,:,:) = NaN;
        
        % Kolbenmittelpunkt in x-Achse bei Mitte Feuersteg [mm]
        Kolben_M_x_Mat = zeros(WerteASP, AnzASP);
        Kolben_M_x_Mat(:,:) = NaN;
        
        % Kolbenmittelpunkt in x-Achse bei Kolbendach [mm]
        Kolben_M_x_o_Mat = zeros(WerteASP, AnzASP);
        Kolben_M_x_o_Mat(:,:) = NaN;
        
        % Kolbenmittelpunkt in y-Achse bei Mitte Feuersteg [mm]
        Kolben_M_y_Mat = zeros(WerteASP, AnzASP);
        Kolben_M_y_Mat(:,:) = NaN;
        
        % Kolbenmittelpunkt in y-Achse bei Kolbendach [mm]
        Kolben_M_y_o_Mat = zeros(WerteASP, AnzASP);
        Kolben_M_y_o_Mat(:,:) = NaN;
        
        % Verkippwinkel Kolben [°]
        Winkel_Kolben_Mat = zeros(WerteASP, AnzASP);
        Winkel_Kolben_Mat(:,:) = NaN;
        
        
        
