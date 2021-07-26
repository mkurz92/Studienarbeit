% Hauptprogramm welches alle weiteren aufruft
% Datum: 01.08.2018
% Markus Kurz
%
% Changelog:
% 
% - Datei in Eingabewerte_Check_v1 umbenannt
%  


% --- Eingabewerte überprüfen ---
fprintf('Eingabewerte werden überprüft...%s\n', mfilename);

% Fenster Check Variable zu 0 setzen
Fenst_Check = 0;

    % 2 Fenster
    if Fenster_Anz == 2
        % Eingabewerte kleiner als 720
        if ((Fenster_Zuend_Beg < 720) && (Fenster_Zuend_End < 720) && (Fenster_GasW_Beg < 720) && (Fenster_GasW_End < 720))
            % Fensterung Beginn und Ende richtig
            if ((Fenster_Zuend_Beg < Fenster_Zuend_End) && (Fenster_GasW_Beg < Fenster_GasW_End))
                % Fensterung um Zünd-OT
                if ((abs(Beg_MD_KW-Fenster_Zuend_Beg) < 80) && (abs(Beg_MD_KW-Fenster_Zuend_End) < 80))
                    % Gaswechsel-OT nach Zünd-OT
                    if (((Fenster_Zuend_Beg+Fenster_Zuend_End)/2) < ((Fenster_GasW_Beg+Fenster_GasW_End)/2))
                        % Fensterung um Gaswechsel-OT
                        if ((abs(Beg_MD_KW+360-Fenster_GasW_Beg) < 80) && (abs(Beg_MD_KW+360-Fenster_GasW_End) < 80))
                            % Fensterung Check Variable zu 1 setzen wenn alles richtig ist
                            Fenst_Check = 1;
                        else
                            % Fensterung Check Variable zu 0 setzen weil Fehler vorhanden
                            Fenst_Check = 0;
                            disp('--- Der Anfang bzw. das Ende der Fensterung um den Gaswechsel-OT stimmt nicht! ---');
                            disp('Die Fensterung um den Gaswechsel-OT muss in einem Bereich von +/- 80°KW liegen.');
                            disp('Die Berechnung wurde deswegen nicht ausgeführt.');
                            disp(' ');
                            disp(' ');
                        end
                    % Gaswechsel-OT vor Zünd-OT    
                    elseif (((Fenster_Zuend_Beg+Fenster_Zuend_End)/2) > ((Fenster_GasW_Beg+Fenster_GasW_End)/2))
                        % Fensterung um Gaswechsel-OT
                        if ((abs(Beg_MD_KW-360-Fenster_GasW_Beg) < 80) && (abs(Beg_MD_KW-360-Fenster_GasW_End) < 80))
                            % Fensterung Check Variable zu 1 setzen wenn alles richtig ist
                            Fenst_Check = 1;
                        else
                            % Fensterung Check Variable zu 0 setzen weil Fehler vorhanden
                            Fenst_Check = 0;
                            disp('--- Der Anfang bzw. das Ende der Fensterung um den Gaswechsel-OT stimmt nicht! ---');
                            disp('Die Fensterung um den Gaswechsel-OT muss in einem Bereich von +/- 80°KW liegen.');
                            disp('Die Berechnung wurde deswegen nicht ausgeführt.');
                            disp(' ');
                            disp(' ');
                        end
                    else
                        % Fensterung Check Variable zu 0 setzen weil Fehler vorhanden
                        Fenst_Check = 0;
                        disp('--- Die Fensterung stimmt nicht! ---');
                        disp('Die Fensterung um den Zünd-OT muss von der Fensterung um den Gaswechsel-OT verschieden sein.');
                        disp('Die Berechnung wurde deswegen nicht ausgeführt.');
                        disp(' ');
                        disp(' ');
                    end
                else
                    % Fensterung Check Variable zu 0 setzen weil Fehler vorhanden
                    Fenst_Check = 0;
                    disp('--- Der Anfang bwz. das Ende der Fensterung um den Zünd-OT stimmt nicht! ---');
                    disp('Die Fensterung um den Zünd-OT muss in einem Bereich von +/- 80°KW liegen.');
                    disp('Die Berechnung wurde deswegen nicht ausgeführt.');
                    disp(' ');
                    disp(' ');
                end
            else
                % Fensterung Check Variable zu 0 setzen weil Fehler vorhanden
                Fenst_Check = 0;
                disp('--- Die Anfänge und Ende der Fensterung stimmen nicht! ---');
                disp('Die Die Anfänge müssen vor den Enden liegen.');
                disp('Die Berechnung wurde deswegen nicht ausgeführt.');
                disp(' ');
                disp(' ');
            end
        else
            % Fensterung Check Variable zu 0 setzen weil Fehler vorhanden
            Fenst_Check = 0;
            disp('--- Mindestens einer der Eingabewerte der Fensterung stimmt nicht! ---');
            disp('Die Eingabewerte müssen kleiner als 720 sein.');
            disp('Die Berechnung wurde deswegen nicht ausgeführt.');
            disp(' ');
            disp(' ');
        end
    else
        % Fensterung Check Variable zu 0 setzen weil Fehler vorhanden
        Fenst_Check = 0;
        disp('--- Die Anzahl der Fenster stimmen nicht! ---');
        disp('Es müssen 2 Fenster sein.');
        disp('Die Berechnung wurde deswegen nicht ausgeführt.');
        disp(' ');
        disp(' ');
    end
    
    
% --- Verwendetes Messsystem überprüfen --- 


        
    