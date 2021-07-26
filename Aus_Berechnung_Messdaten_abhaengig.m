% Berechnung
% Datum: 08.12.2018
% Markus Kurz
%
% Changelog:
% 
% - Abstand Kolben -Buchse an Kolbendach hinzugefügt
% 
% 
% - Dauer Berechnung: 1,4s für 1 ASP = 25min für alle 1066 ASP (R2018a)
% - Dauer Berechnung: 2,6s für 1 ASP = 40min für alle 1066 ASP (R2015a)
% 


% ----- Berechnung ----- (Hier nichts mehr ändern!!!)
fprintf('Parallele Berechnungen werden ausgeführt (kann lange dauern)...%s\n', mfilename);

tic
% --- Berechnung ---     
    
    % Bereich der Fensterung um Zünd- und Gaswechsel-OT als Matrix
    Fensterung_Mat = [Fenster_Zuend_Beg*KW_in_Mat:Fenster_Zuend_End*KW_in_Mat Fenster_GasW_Beg*KW_in_Mat:Fenster_GasW_End*KW_in_Mat];
    % Anzahl an Einträgen in Fensterung_Mat
    Fensterung_Anz = (Fenster_Zuend_End-Fenster_Zuend_Beg)*KW_in_Mat+1+(Fenster_GasW_End-Fenster_GasW_Beg)*KW_in_Mat+1;



    % --- Kolbenwinkel ---
        
        % Verschiebung Mittelpunkt Obere Ebene [mm]
         % Positiv für Verschiebung zur Druckseite
        delta_Kolben_M_o = (Abst_Sens_GDS_oben_gefiltert-Abst_Sens_DS_oben_gefiltert)/2;
        
        % Verschiebung Mittelpunkt Untere Ebene [mm]
         % Positiv für Verschiebung zur Druckseite
        delta_Kolben_M_u = (Abst_Sens_GDS_unten_gefiltert-Abst_Sens_DS_unten_gefiltert)/2;
        
        % Abstand beider Mittelpunkte [mm]
         % Positiv wenn zur Druckseite hin gekippt
        delta_Kolben_M_o_u = delta_Kolben_M_o - delta_Kolben_M_u;
        
        % Verkippwinkel des Kolbens [°]
         % Positiv wenn zur Druckseite hin gekippt
        Winkel_Kolben_Mat(Fensterung_Mat, ASP_Beg:ASP_End) = atand(delta_Kolben_M_o_u(Fensterung_Mat, ASP_Beg:ASP_End)/Sensor_Abstand);
      
    
        
    % --- Verschiebung Mittelpunkt Kolbendach zu Mittelpunkt Kolben untere Abstandssensormessebene in x-Richtung 
        % Länge Strecke Kolbenbolzen zu Mittelpunkt Kolbendach [mm]
        Abs_KB_MKD = sqrt(Desax^2+KolbenB_KD^2);
        % Winkel zwischen Strecke Kolbenbolzen zu Mittelpunkt Kolbendach und z-Achse [°]
        Winkel_KB_MKD = -atand(Desax/KolbenB_KD);
        % Kolbenbolzenposition Matrix [mm]
        Kolb_S_desax_Mat = repmat(Kolb_S_desax((360-Beg_MD_KW)*KW_in_Mat+1:(720-Beg_MD_KW)*KW_in_Mat,2),2,AnzASP);
        % Mittelpunkt Kolbendach Position in z-Richtung [mm]
        MKD_z_pos = zeros(WerteASP, AnzASP);
        MKD_z_pos(:,:) = NaN;
        MKD_z_pos(Fensterung_Mat, ASP_Beg:ASP_End) = Kolb_S_desax_Mat(Fensterung_Mat, ASP_Beg:ASP_End)-cosd(Winkel_KB_MKD+Winkel_Kolben_Mat(Fensterung_Mat, ASP_Beg:ASP_End))*Abs_KB_MKD;
        % Abstand Mittelpunkt Kolbendach zu Mittelpunkt Kolben in der unteren Abstandssensormessebene in z-Richtung [mm]
        Abs_MKD_MSU(1:WerteASP, 1:AnzASP) = Sens_Abst_Unten-MKD_z_pos;
        % Verschiebung Mittelpunkt Kolbendach zu Mittelpunkt Kolben in der unteren Abstandssensormessebene in x-Richtung durch Verkippung [mm]
         % Positiv für Verschiebung zur Druckseite (Auslassseite)
        delta_Kolben_M_FSo = tand(Winkel_Kolben_Mat(Fensterung_Mat, ASP_Beg:ASP_End)).*(Abs_MKD_MSU(Fensterung_Mat, ASP_Beg:ASP_End));
        
        
        
    % --- Verschiebung Mittelpunkt Kolben auf Höhe Mitte Feuersteg zu Mittelpunkt Kolben untere Abstandssensormessebene in x-Richtung 
        % Länge Strecke Kolbenbolzen zu Mittelpunkt Kolben auf Höhe Mitte Feuersteg [mm]
        Abs_KB_MKMFS = sqrt(Desax^2+(KolbenB_KD-H_Fst/2)^2);
        % Winkel zwischen Strecke Kolbenbolzen zu Mittelpunkt Kolben auf Höhe Mitte Feuersteg und z-Achse [°]
        Winkel_KB_MKMFS = -atand(Desax/(KolbenB_KD-H_Fst/2));
        % Mittelpunkt Kolben auf Höhe Mitte Feuersteg Position in z-Richtung [mm]
        MKMFS_z_pos = zeros(WerteASP, AnzASP);
        MKMFS_z_pos(:,:) = NaN;
        MKMFS_z_pos(Fensterung_Mat, ASP_Beg:ASP_End) = Kolb_S_desax_Mat(Fensterung_Mat, ASP_Beg:ASP_End)-cosd(Winkel_KB_MKMFS+Winkel_Kolben_Mat(Fensterung_Mat, ASP_Beg:ASP_End))*Abs_KB_MKMFS;
        % Abstand Mittelpunkt Kolben auf Höhe Mitte Feuersteg zu Mittelpunkt Kolben in der unteren Abstandssensormessebene in z-Richtung [mm]
        Abs_MKMFS_MSU(1:WerteASP, 1:AnzASP) = Sens_Abst_Unten-MKMFS_z_pos;
        % Verschiebung Mittelpunkt Kolben auf Höhe Mitte Feuersteg zu Mittelpunkt Kolben in der unteren Abstandssensormessebene in x-Richtung durch Verkippung [mm]
         % Positiv für Verschiebung zur Druckseite (Auslassseite)
        delta_Kolben_M_FSm = tand(Winkel_Kolben_Mat(Fensterung_Mat, ASP_Beg:ASP_End)).*(Abs_MKMFS_MSU(Fensterung_Mat, ASP_Beg:ASP_End));
        
    
    % --- Mittelpunkt Kolben im Feuerstegbereich (für Berechnung) ---           
        % Verschiebung in y-Richtung bei Mittelpunkt Feuersteg [mm]
        delta_y_m = 0;
        
        % Verschiebung in y-Richtung bei Kolbendach [mm]
        delta_y_o = 0;

        % Mittelpunkt Kolben bei Mitte Feuersteg in Matrix [mm]
        Kolben_M_x_Mat(Fensterung_Mat, ASP_Beg:ASP_End) = delta_Kolben_M_FSm+delta_Kolben_M_u(Fensterung_Mat, ASP_Beg:ASP_End);
        Kolben_M_y_Mat(Fensterung_Mat, ASP_Beg:ASP_End) = (0+delta_y_m);
        
        % Mittelpunkt Kolben bei Kolbendach in Matrix [mm]
        Kolben_M_x_o_Mat(Fensterung_Mat, ASP_Beg:ASP_End) = delta_Kolben_M_FSo+delta_Kolben_M_u(Fensterung_Mat, ASP_Beg:ASP_End);
        Kolben_M_y_o_Mat(Fensterung_Mat, ASP_Beg:ASP_End) = (0+delta_y_o);
        
        
    % --- Punkte P ---
        
        % Abstand bei Mitte Feuersteg: Mittelpunkt Kolben - Punkt P [mm]
        Abst_M_Ko_P = zeros(Fensterung_Anz, ASP_End-ASP_Beg+1, P_Anz);
        Abst_M_Ko_P(:,:,:) = NaN;
        for i=1:P_Anz
            Abst_M_Ko_P(:,:,i) = sqrt(abs(P_x(i) - Kolben_M_x_Mat(Fensterung_Mat, ASP_Beg:ASP_End)).^2 + abs(P_y(i) - Kolben_M_y_Mat(Fensterung_Mat, ASP_Beg:ASP_End)).^2);
        end
        
        % Abstand bei Kolbendach: Mittelpunkt Kolben - Punkt P [mm]
        Abst_M_Ko_o_P = zeros(Fensterung_Anz, ASP_End-ASP_Beg+1, P_Anz);
        Abst_M_Ko_o_P(:,:,:) = NaN;
        for i=1:P_Anz
            Abst_M_Ko_o_P(:,:,i) = sqrt(abs(P_x(i) - Kolben_M_x_o_Mat(Fensterung_Mat, ASP_Beg:ASP_End)).^2 + abs(P_y(i) - Kolben_M_y_o_Mat(Fensterung_Mat, ASP_Beg:ASP_End)).^2);
        end

         % Abstand bei Mitte Feuersteg: Kolben - Buchse an Punkt P [mm]
         Seg_Mat_Abs_K_P(Fensterung_Mat, ASP_Beg:ASP_End, :) = Abst_M_Ko_P - R_Kolben;

         
        % Abstand bei Kolbendach: Kolben - Buchse an Punkt P [mm]
        Seg_Mat_Abs_K_o_P(Fensterung_Mat, ASP_Beg:ASP_End, :) = Abst_M_Ko_o_P - R_Kolben;

        
    
    % --- 360 Hilfspunkte ---

        % Abstand bei Mitte Feuersteg: Mittelpunkt Kolben - 360 Hilfspunkte [mm]
        Abst_M_Ko_360 = zeros(Fensterung_Anz, ASP_End-ASP_Beg+1, 360);
        Abst_M_Ko_360(:,:,:) = NaN;
        for i=1:360
            Abst_M_Ko_360(:,:,i) = sqrt(abs(P_x_360(i) - Kolben_M_x_Mat(Fensterung_Mat, ASP_Beg:ASP_End)).^2 + abs(P_y_360(i) - Kolben_M_y_Mat(Fensterung_Mat, ASP_Beg:ASP_End)).^2);
        end

        % Richtungsvektoren 360 Hilfspunkte
            % x-Richtung
            Vek_x_360 = zeros(Fensterung_Anz, ASP_End-ASP_Beg+1, 360);
            Vek_x_360(:,:,:) = NaN;
            for k=1:360
                Vek_x_360(:,:,k) = P_x_360(k) - Kolben_M_x_Mat(Fensterung_Mat, ASP_Beg:ASP_End);
            end
            % y-Richtung
            Vek_y_360 = zeros(Fensterung_Anz, ASP_End-ASP_Beg+1, 360);
            Vek_y_360(:,:,:) = NaN;
            for k=1:360
                Vek_y_360(:,:,k) = P_y_360(k) - Kolben_M_y_Mat(Fensterung_Mat, ASP_Beg:ASP_End);
            end
        
        % Winkel zwischen 360 Hilfspunkten [°]
        Wink_360 = zeros(Fensterung_Anz, ASP_End-ASP_Beg+1, 360);
        Wink_360(:,:,:) = NaN;
        for i=1:Fensterung_Anz
            for m=1:ASP_End-ASP_Beg+1
                Wink_360(i,m,1) = acosd((dot([Vek_x_360(i,m,360) Vek_y_360(i,m,360)], [Vek_x_360(i,m,1) Vek_y_360(i,m,1)]))/(norm([Vek_x_360(i,m,360) Vek_y_360(i,m,360)])*norm([Vek_x_360(i,m,1) Vek_y_360(i,m,1)])));
                for k=2:360
                    Wink_360(i,m,k) = acosd((dot([Vek_x_360(i,m,k) Vek_y_360(i,m,k)], [Vek_x_360(i,m,k-1) Vek_y_360(i,m,k-1)]))/(norm([Vek_x_360(i,m,k) Vek_y_360(i,m,k)])*norm([Vek_x_360(i,m,k-1) Vek_y_360(i,m,k-1)])));
                end
            end
        end

        % Fläche bei Mitte Feuersteg: Mittelpunkt Kolben - 360 Segmente Buchse [mm^2]
        A_360 = zeros(Fensterung_Anz, ASP_End-ASP_Beg+1, 360);
        A_360(:,:,:) = NaN;
        A_360(:,:,1) = (Wink_360(:,:,1)/360) * pi .* ((Abst_M_Ko_360(:,:,360)+Abst_M_Ko_360(:,:,1))/2).^2;
        for i=2:360
           A_360(:,:,i) = (Wink_360(:,:,i)/360) * pi .* ((Abst_M_Ko_360(:,:,i)+Abst_M_Ko_360(:,:,i-1))/2).^2;
        end
         
        
    % --- Segmente ---
        
        % Richtungsvektoren Segmentlinien
            % x-Richtung
            Seg_x_Vek = zeros(Fensterung_Anz, ASP_End-ASP_Beg+1, P_Anz);
            Seg_x_Vek(:,:,:) = NaN;
            for k=1:P_Anz
                Seg_x_Vek(:,:,k) = Seg_P_x(k) - Kolben_M_x_Mat(Fensterung_Mat, ASP_Beg:ASP_End);
            end
            % y-Richtung
            Seg_y_Vek = zeros(Fensterung_Anz, ASP_End-ASP_Beg+1, P_Anz);
            Seg_y_Vek(:,:,:) = NaN;
            for k=1:P_Anz
                Seg_y_Vek(:,:,k) = Seg_P_y(k) - Kolben_M_y_Mat(Fensterung_Mat, ASP_Beg:ASP_End);
            end

        % Winkel zwischen Segmentlinien [°]
        Seg_Wink = zeros(Fensterung_Anz, ASP_End-ASP_Beg+1, P_Anz);
        Seg_Wink(:,:,:) = NaN;
        for i=1:Fensterung_Anz
            for m=1:ASP_End-ASP_Beg+1
                Seg_Wink(i,m,P_Anz) = acosd((dot([Seg_x_Vek(i,m,P_Anz) Seg_y_Vek(i,m,P_Anz)], [Seg_x_Vek(i,m,1) Seg_y_Vek(i,m,1)]))/(norm([Seg_x_Vek(i,m,P_Anz) Seg_y_Vek(i,m,P_Anz)])*norm([Seg_x_Vek(i,m,1) Seg_y_Vek(i,m,1)])));
                for k=1:P_Anz-1
                    Seg_Wink(i,m,k) = acosd((dot([Seg_x_Vek(i,m,k) Seg_y_Vek(i,m,k)], [Seg_x_Vek(i,m,k+1) Seg_y_Vek(i,m,k+1)]))/(norm([Seg_x_Vek(i,m,k) Seg_y_Vek(i,m,k)])*norm([Seg_x_Vek(i,m,k+1) Seg_y_Vek(i,m,k+1)])));
                end
            end
        end
        
        % Segmentfläche Kolben [mm^2]
        Seg_A_K = zeros(Fensterung_Anz, ASP_End-ASP_Beg+1, P_Anz);
        Seg_A_K(:,:,:) = NaN;
        Seg_A_K(:,:,:) = (Seg_Wink/360)* 0.25 * pi * D_Kolbenkrone^2;

        % Segmentfläche Buchse Matrix [mm^2]
        Seg_Mat_A_B = zeros(Fensterung_Anz, ASP_End-ASP_Beg+1, P_Anz);
        Seg_Mat_A_B(:,:,:) = NaN;
        for i=1:P_Anz
            Seg_Mat_A_B(:,:,i) = sum(A_360(:,:,1+(i-1)*P_Wi_Ab:i*P_Wi_Ab),3);
        end
        
        % Segmentfläche Feuersteg Matrix [mm^2]
        Seg_Mat_A_Fst(Fensterung_Mat, ASP_Beg:ASP_End, :) = Seg_Mat_A_B - Seg_A_K;

        % Segmentvolumen Feuersteg Matrix [mm^3]
        Seg_Mat_V_Fst(Fensterung_Mat, ASP_Beg:ASP_End, :) = Seg_Mat_A_Fst(Fensterung_Mat, ASP_Beg:ASP_End, :) * H_Fst;
       
    % Volumen Feuersteg komplett [mm^3]
    Feuer_Mat_V_sum(Fensterung_Mat, ASP_Beg:ASP_End, :) = sum(Seg_Mat_V_Fst(Fensterung_Mat, ASP_Beg:ASP_End), 3);
    
toc

