% Messdaten Filterung
% Datum: 18.09.2018
% Markus Kurz
%
% Changelog:
% - Messdaten Filterung komplett überarbeitet. Namen der Messdateien schon
%   vor dem Einlesen bekannt
% - Filterung einzeln für jeweils Druck, Temperatur und Abstand


% Messdaten Filterung
fprintf('Messdaten werden gefiltert...%s\n', mfilename);

% Anzahl der vollständigen Arbeitsspiele
global AnzASP


% --- Messdaten Filterung ---

    % Abstandssensoren
        % Messdaten in Variable_gefiltert kopieren
        Abst_Sens_GDS_oben_gefiltert = Abst_Sens_GDS_oben;
        Abst_Sens_GDS_unten_gefiltert = Abst_Sens_GDS_unten;
        Abst_Sens_DS_oben_gefiltert = Abst_Sens_DS_oben;
        Abst_Sens_DS_unten_gefiltert = Abst_Sens_DS_unten;
        % Namen der Messdatenvariablen_gefiltert in Cell Array schreiben
        fileNamen_gefiltert{1, 1} = cellstr('Abst_Sens_GDS_oben_gefiltert');
        fileNamen_gefiltert{2, 1} = cellstr('Abst_Sens_GDS_unten_gefiltert');
        fileNamen_gefiltert{3, 1} = cellstr('Abst_Sens_DS_oben_gefiltert');
        fileNamen_gefiltert{4, 1} = cellstr('Abst_Sens_DS_unten_gefiltert');
        % Messdaten nach negativen Werten durchsuchen und je nach Anzahl der negativen Werte
        % verschiedene Anpassungen durchführen 
        % Zählvariable für Position in Cell Array
        Zelle_zaehler=1;
        for i = 1:length(fileNamen_gefiltert)
            % Anzahl negativer Werte in Messdaten_gefiltert ermitteln
            eval(['min_Wert = min(',char(fileNamen_gefiltert{i, 1}),'(:));']);
            eval(['Anz_neg_Werte = sum(sum(', char(fileNamen_gefiltert{i, 1}), '<0));']);
            % Cell Array für Messdaten Log erzeugen
                % Betroffener Dateinamen von Cell Array in Array Form bringen
                Messdaten_char = char(fileNamen_gefiltert{i, 1});
            % ab Anz_neg_Werte_Offset negativen Werten ganze Matrix um selben
            % Betrag nach oben korrigieren
            if min_Wert < 0 && Anz_neg_Werte >= Anz_neg_Werte_Offset
                min_Wert = abs(min_Wert);
                eval([char(fileNamen_gefiltert{i, 1}), ' = ', char(fileNamen_gefiltert{i, 1}), ' + min_Wert;']);
                Messdaten_gefiltert_txt{Zelle_zaehler, 1} = cellstr(sprintf('Es wurden %d negative Werte in Datei %s entdeckt und somit ein Offset von %.4f auf Matrix angewendet.\n', Anz_neg_Werte, Messdaten_char, min_Wert));
                % Nächste Zelle
                Zelle_zaehler=Zelle_zaehler+1;
            % Messdaten_gefiltert Matrix nach negativen Werten
            % durchsuchen und durch Arithmetisches Mittel
            % benachbarter Werte oder NaN ersetzen
            % bei mehreren benachbarten negativen Werten wird mit
            % diesen gerechnet! Programm also an dieser Stelle
            % fehleranfällig!    
            elseif min_Wert < 0 && Anz_neg_Werte < Anz_neg_Werte_Offset
                    for n=1:AnzASP
                        for m=1:WerteASP
                            % Momentane Zelle vergleichen
                            eval(['Zelle_temp = ', char(fileNamen_gefiltert{i, 1}),'(m, n);']);
                            if Zelle_temp < 0
                                % Falls Wert~=1 und Wert~=WerteASP
                                if m ~= 1 && m~= WerteASP
                                    eval([char(fileNamen_gefiltert{i, 1}),'(m, n) = (', char(fileNamen_gefiltert{i, 1}), '(m+1, n) + ', char(fileNamen_gefiltert{i, 1}), '(m-1, n))/2', ';']);
                                    Messdaten_gefiltert_txt{Zelle_zaehler, 1} = cellstr(sprintf('Es wurden Messfehler in Datei %s in ASP %d und Wert %d entdeckt und durch Arithmetisches Mittel benachbarter Werte ersetzt.\n', Messdaten_char, n, m));
                                    % Nächste Zelle
                                    Zelle_zaehler=Zelle_zaehler+1;
                                % Falls Wert==1 und ASP~=1
                                elseif m==1 && n~=1
                                    eval([char(fileNamen_gefiltert{i, 1}),'(m, n) = (', char(fileNamen_gefiltert{i, 1}), '(m+1, n) + ', char(fileNamen_gefiltert{i, 1}), '(end, n-1))/2', ';']);
                                    Messdaten_gefiltert_txt{Zelle_zaehler, 1} = cellstr(sprintf('Es wurden Messfehler in Datei %s in ASP %d und Wert %d entdeckt und durch Arithmetisches Mittel benachbarter Werte ersetzt.\n', Messdaten_char, n, m));
                                    % Nächste Zelle
                                    Zelle_zaehler=Zelle_zaehler+1;
                                elseif m==1 && n==1
                                    eval([char(fileNamen_gefiltert{i, 1}),'(m, n) = NaN;']);
                                    Messdaten_gefiltert_txt{Zelle_zaehler, 1} = cellstr(sprintf('Es wurden Messfehler in Datei %s in ASP %d und Wert %d entdeckt und durch NaN ersetzt.\n', Messdaten_char, n, m));
                                    % Nächste Zelle
                                    Zelle_zaehler=Zelle_zaehler+1;
                                elseif m==WerteASP && n==AnzASP
                                    eval([char(fileNamen_gefiltert{i, 1}),'(m, n) = NaN;']);
                                    Messdaten_gefiltert_txt{Zelle_zaehler, 1} = cellstr(sprintf('Es wurden Messfehler in Datei %s in ASP %d und Wert %d entdeckt und durch NaN ersetzt.\n', Messdaten_char, n, m));
                                    % Nächste Zelle
                                    Zelle_zaehler=Zelle_zaehler+1;
                                elseif m==WerteASP && n~=AnzASP
                                    eval([char(fileNamen_gefiltert{i, 1}),'(m, n) = (', char(fileNamen_gefiltert{i, 1}), '(1, n+1) + ', char(fileNamen_gefiltert{i, 1}), '(m-1, n))/2', ';']);
                                    Messdaten_gefiltert_txt{Zelle_zaehler, 1} = cellstr(sprintf('Es wurden Messfehler in Datei %s in ASP %d und Wert %d entdeckt und durch Arithmetisches Mittel benachbarter Werte ersetzt.\n', Messdaten_char, n, m));
                                    % Nächste Zelle
                                    Zelle_zaehler=Zelle_zaehler+1;
                                else
                                    error('Fehler aufgetreten in Messdatenfilterung! Programm wird beendet!');
                                end
                            end
                        end
                    end
            end
        end
        % Messdaten auf [mm] umrechnen
        for i = 1:length(fileNamen_gefiltert)
            eval([char(fileNamen_gefiltert{i, 1}), ' = ', char(fileNamen_gefiltert{i, 1}),'* Sensor_Einheit;']);
        end
        
    % Temperatursensoren
    
    % Drucksensoren
        
        
        
        
        
        
        
        