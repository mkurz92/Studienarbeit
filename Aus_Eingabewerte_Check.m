% Hauptprogramm welches alle weiteren aufruft
% Datum: 01.08.2018
% Markus Kurz
%
% Changelog:
% 
% - Datei in Eingabewerte_Check_v1 umbenannt
%  


% --- Eingabewerte �berpr�fen ---
fprintf('Eingabewerte werden �berpr�ft...%s\n', mfilename);

% Fenster Check Variable zu 0 setzen
Fenst_Check = 0;

    % 2 Fenster
    if Fenster_Anz == 2
        % Eingabewerte kleiner als 720
        if ((Fenster_Zuend_Beg < 720) && (Fenster_Zuend_End < 720) && (Fenster_GasW_Beg < 720) && (Fenster_GasW_End < 720))
            % Fensterung Beginn und Ende richtig
            if ((Fenster_Zuend_Beg < Fenster_Zuend_End) && (Fenster_GasW_Beg < Fenster_GasW_End))
                % Fensterung um Z�nd-OT
                if ((abs(Beg_MD_KW-Fenster_Zuend_Beg) < 80) && (abs(Beg_MD_KW-Fenster_Zuend_End) < 80))
                    % Gaswechsel-OT nach Z�nd-OT
                    if (((Fenster_Zuend_Beg+Fenster_Zuend_End)/2) < ((Fenster_GasW_Beg+Fenster_GasW_End)/2))
                        % Fensterung um Gaswechsel-OT
                        if ((abs(Beg_MD_KW+360-Fenster_GasW_Beg) < 80) && (abs(Beg_MD_KW+360-Fenster_GasW_End) < 80))
                            % Fensterung Check Variable zu 1 setzen wenn alles richtig ist
                            Fenst_Check = 1;
                        else
                            % Fensterung Check Variable zu 0 setzen weil Fehler vorhanden
                            Fenst_Check = 0;
                            disp('--- Der Anfang bzw. das Ende der Fensterung um den Gaswechsel-OT stimmt nicht! ---');
                            disp('Die Fensterung um den Gaswechsel-OT muss in einem Bereich von +/- 80�KW liegen.');
                            disp('Die Berechnung wurde deswegen nicht ausgef�hrt.');
                            disp(' ');
                            disp(' ');
                        end
                    % Gaswechsel-OT vor Z�nd-OT    
                    elseif (((Fenster_Zuend_Beg+Fenster_Zuend_End)/2) > ((Fenster_GasW_Beg+Fenster_GasW_End)/2))
                        % Fensterung um Gaswechsel-OT
                        if ((abs(Beg_MD_KW-360-Fenster_GasW_Beg) < 80) && (abs(Beg_MD_KW-360-Fenster_GasW_End) < 80))
                            % Fensterung Check Variable zu 1 setzen wenn alles richtig ist
                            Fenst_Check = 1;
                        else
                            % Fensterung Check Variable zu 0 setzen weil Fehler vorhanden
                            Fenst_Check = 0;
                            disp('--- Der Anfang bzw. das Ende der Fensterung um den Gaswechsel-OT stimmt nicht! ---');
                            disp('Die Fensterung um den Gaswechsel-OT muss in einem Bereich von +/- 80�KW liegen.');
                            disp('Die Berechnung wurde deswegen nicht ausgef�hrt.');
                            disp(' ');
                            disp(' ');
                        end
                    else
                        % Fensterung Check Variable zu 0 setzen weil Fehler vorhanden
                        Fenst_Check = 0;
                        disp('--- Die Fensterung stimmt nicht! ---');
                        disp('Die Fensterung um den Z�nd-OT muss von der Fensterung um den Gaswechsel-OT verschieden sein.');
                        disp('Die Berechnung wurde deswegen nicht ausgef�hrt.');
                        disp(' ');
                        disp(' ');
                    end
                else
                    % Fensterung Check Variable zu 0 setzen weil Fehler vorhanden
                    Fenst_Check = 0;
                    disp('--- Der Anfang bwz. das Ende der Fensterung um den Z�nd-OT stimmt nicht! ---');
                    disp('Die Fensterung um den Z�nd-OT muss in einem Bereich von +/- 80�KW liegen.');
                    disp('Die Berechnung wurde deswegen nicht ausgef�hrt.');
                    disp(' ');
                    disp(' ');
                end
            else
                % Fensterung Check Variable zu 0 setzen weil Fehler vorhanden
                Fenst_Check = 0;
                disp('--- Die Anf�nge und Ende der Fensterung stimmen nicht! ---');
                disp('Die Die Anf�nge m�ssen vor den Enden liegen.');
                disp('Die Berechnung wurde deswegen nicht ausgef�hrt.');
                disp(' ');
                disp(' ');
            end
        else
            % Fensterung Check Variable zu 0 setzen weil Fehler vorhanden
            Fenst_Check = 0;
            disp('--- Mindestens einer der Eingabewerte der Fensterung stimmt nicht! ---');
            disp('Die Eingabewerte m�ssen kleiner als 720 sein.');
            disp('Die Berechnung wurde deswegen nicht ausgef�hrt.');
            disp(' ');
            disp(' ');
        end
    else
        % Fensterung Check Variable zu 0 setzen weil Fehler vorhanden
        Fenst_Check = 0;
        disp('--- Die Anzahl der Fenster stimmen nicht! ---');
        disp('Es m�ssen 2 Fenster sein.');
        disp('Die Berechnung wurde deswegen nicht ausgef�hrt.');
        disp(' ');
        disp(' ');
    end
    
    
% --- Verwendetes Messsystem �berpr�fen --- 


        
    