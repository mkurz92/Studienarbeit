% Berechnung
% Datum: 11.12.2018
% Markus Kurz
%
% Changelog:
% 
% - Eingriffszeitpunkt Sensoren berechnen
% 
% - Dauer Berechnung: 1,4s für 1 ASP = 25min für alle 1066 ASP (R2018a)
% - Dauer Berechnung: 2,6s für 1 ASP = 40min für alle 1066 ASP (R2015a)
% 


% ----- Berechnung ----- (Hier nichts mehr ändern!!!)
fprintf('Einmalige Berechnungen werden ausgeführt...%s\n', mfilename);

% Anzahl der Werte pro Arbeitsspiel
global WerteASP
            
       
    % --- Berechnungen die einmalig ausgeführ werden ---
        
        % --- Kolben und Buchse ---
            % Radius Buchse
            R_Buchse = D_Buchse/2;

            % Radius Kolben
            R_Kolben = D_Kolbenkrone/2;
         
            
        % --- Punkte P ---
            % Winkelabstand der Punkte[°]
            P_Wi_Ab = 360/P_Anz;

            % Winkel der Punkte [°]
            P_Wi = P_Wi_0:P_Wi_Ab:(360+P_Wi_0-P_Wi_Ab);

            % Koordinaten mit 0 initialisieren
            P_x = zeros(1, P_Anz);
            P_y = zeros(1, P_Anz);

            % Koordinaten berechnen
            for l=1:P_Anz
                P_x(l) = cosd(P_Wi(l))*R_Buchse;
                P_y(l) = sind(P_Wi(l))*R_Buchse;
            end 
            
        % --- 360 Hilfspunkte ---
            % Koordinaten berechnen
            P_x_360 = zeros(1, 360);
            P_y_360 = zeros(1, 360);
            for l=1:360
                P_x_360(l) = cosd(P_Wi(1)-(P_Wi_Ab)/2+l)*R_Buchse;
                P_y_360(l) = sind(P_Wi(1)-(P_Wi_Ab)/2+l)*R_Buchse;
            end
            
        % --- Segmente ---   
            % Segmentlinien Koordinaten
            Seg_P_x = zeros(1, P_Anz);
            Seg_P_y = zeros(1, P_Anz);
            global splot_1_6_xData
            splot_1_6_xData = zeros(2, P_Anz);
            global splot_1_6_yData;
            splot_1_6_yData = zeros(2, P_Anz);
                    
            for k=1:P_Anz
                Seg_P_x(k) = cosd(P_Wi(k)-P_Wi_Ab/2)*R_Buchse;
                Seg_P_y(k) = sind(P_Wi(k)-P_Wi_Ab/2)*R_Buchse;
                % 2. Matrixzeile für Segmentlinienpunkte auf Buchse
                splot_1_6_xData(2,k) = Seg_P_x(k);
                splot_1_6_yData(2,k) = Seg_P_y(k);
            end
            
            
        % --- Kolbenweg ---
            % Kurbelradius falls nicht gegeben[mm]
            if ~exist('Kurb_Rad','var')
                syms Kurb_Rad_Var
                Kurb_Rad = solve(Hub == sqrt((Pleul_L+Kurb_Rad_Var)^2-Desax^2)-sqrt((Pleul_L-Kurb_Rad_Var)^2-Desax^2),Kurb_Rad_Var);
                Kurb_Rad = double(Kurb_Rad);
            end
            
            % Matrix Schrittweite für Kurbelwinkel        
            KW_in_Mat = 1/Winkelaufloesung;
            
            % Schubstangenverhältnis
            Schub_Ver = Kurb_Rad/Pleul_L;
            
            % Maximaler Kolbenweg von Kurbelwelle zu OT (halber Hub)
            Max_Kolb_Weg = sqrt((Kurb_Rad+Pleul_L)^2-Desax^2);
        
            % Kolbenwegmatrix mit 0 initialisieren
                % Für Winkelfeste Messungen
                Kolb_S = zeros(WerteASP+WerteASP/2, 2);
                Kolb_S_desax = zeros(WerteASP+WerteASP/2, 2);
                % Für Zeitfeste Messungen
                %Kolb_S = zeros(WerteASP, AnzASP);
            
            % Kolbenwegmatrix Winkel eintragen [°KW]
                % Für Winkelfeste Messungen
                Kolb_S(:,1) = Winkelaufloesung:Winkelaufloesung:1080;
                Kolb_S_desax(:,1) = Winkelaufloesung:Winkelaufloesung:1080;
                            
            % Kolbenweg für eine Umdrehung berechnen [mm]
                % Für Winkelfeste Messungen
                Kolb_S(1:360*KW_in_Mat,2) = Kurb_Rad*(1+(1/Schub_Ver)-cosd(Kolb_S(1:360*KW_in_Mat,1))-(1/Schub_Ver)*(1-((Schub_Ver)^2)*(sind(Kolb_S(1:360*KW_in_Mat,1))).^2).^0.5);
                Kolb_S_desax(1:360*KW_in_Mat,2) = Max_Kolb_Weg-(Kurb_Rad*cosd(Kolb_S_desax(1:360*KW_in_Mat,1))+Pleul_L*sqrt(1-(Schub_Ver*sind(Kolb_S_desax(1:360*KW_in_Mat,1))+Desax/Pleul_L).^2))+Abs_KD_Zyl_o+KolbenB_KD;
            % Kolbenweg für 2. und 3. Umdrehung kopieren [mm]
                % Nur für Winkelfeste Messungen
                Kolb_S((360*KW_in_Mat+1):720*KW_in_Mat,2) = Kolb_S(1:(360*KW_in_Mat),2);
                Kolb_S((720*KW_in_Mat+1):end,2) = Kolb_S(1:(360*KW_in_Mat),2);
                Kolb_S_desax((360*KW_in_Mat+1):720*KW_in_Mat,2) = Kolb_S_desax(1:(360*KW_in_Mat),2);
                Kolb_S_desax((720*KW_in_Mat+1):end,2) = Kolb_S_desax(1:(360*KW_in_Mat),2);
            
 