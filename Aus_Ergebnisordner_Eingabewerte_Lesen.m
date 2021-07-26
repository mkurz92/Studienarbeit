% Ergebnissordner suchen und Eingabewerte aus Ergebnissen einlesen
% Datum: 20.08.2018
% Markus Kurz
%
% Changelog:
% 
% - Eingabewerte_Lesen_v01 erstellt
% - Auswahl bei mehreren Ergebnissordnern hinzugefügt


% ----- Eingabewerte_Lesen -----
fprintf('Ergebnissordner werden gesucht und Eingabewerte aus Ergebnissen werden eingelesen...%s\n', mfilename);

% Ergebnisse einlesen Check Variable
Eingabewerte_Lesen_Check = 0;

% Momentanen Ordner zu Programmordner setzen
pwd_Programm = pwd;


% Ergebnissordner suchen und für Skript setzen
    Verz_Programm = dir;
    % Anzahl Elemente in momentanem Verzeichnis ermitteln
    AnzElemente_Programm = size(Verz_Programm);
    AnzElemente_Programm = AnzElemente_Programm(:,1);
    AnzErgOrdner = 0;
    PosErgOrdner = 0;
    % Ergebnissordner Namen Array anlegen
    Verz_Programm_Ergeb_Ordner = [];
    % Anzahl und Position Ordner die 'Ergebnisse_' enthalten ermitteln
    for i=1:AnzElemente_Programm
        if contains(Verz_Programm(i).name, 'Ergebnisse_') && Verz_Programm(i).isdir == 1
            Verz_Programm_Ergeb_Ordner = [(Verz_Programm_Ergeb_Ordner); cellstr(Verz_Programm(i).name)];   
            AnzErgOrdner = AnzErgOrdner + 1;
            PosErgOrdner(AnzErgOrdner, 1) = i;
            Ergeb_Ordner_temp = char(Verz_Programm(i).name);
            Ergebnissordner_Auswahl{AnzErgOrdner, 1} = cellstr(sprintf('(%d) %s\n', AnzErgOrdner, Ergeb_Ordner_temp));
        end
    end
    % Ein Ergebnissordner
    if AnzErgOrdner == 1
        fprintf('\nEs wurde ein Ergebnissordner gefunden:\n');
        % Gefundene Ergebnissordner anzeigen
        for i=1:AnzErgOrdner
            Cell2Str = char(Ergebnissordner_Auswahl{i, 1});
            fprintf('\n%s', Cell2Str);
        end
        fprintf('\n\n(0) Neuberechnung durchführen\n');
        % Benutzereingabe anfordern 
        prompt = '\nBitte wählen Sie durch Eingabe der entsprechenden Zahl den zu ladenden Ergebnissordner aus:   ';
        Auswahl = input(prompt);
        % Auswahl überprüfen
        if Auswahl <= AnzErgOrdner && Auswahl > 0
            Folder_Erg = Verz_Programm(PosErgOrdner(Auswahl, 1)).name;
            fprintf('%s wurde als Ergebnissordner ausgewählt.\n\n',Folder_Erg);
        elseif Auswahl == 0
            fprintf('Es werden keine Ergebnisse eingelesen sondern eine Neuberechnung durchgeführt.\n\n');
            Eingabewerte_Lesen_Check = Eingabewerte_Lesen_Check + 1;
        else
            fprintf('Der eingegebene Wert liegt außerhalt des Eingabebereichs!\n');
            fprintf('Es werden keine Ergebnisse eingelesen sondern eine Neuberechnung durchgeführt.\n\n');
            Eingabewerte_Lesen_Check = Eingabewerte_Lesen_Check + 1;
        end
    % Mehrere Ergebnissordner
    elseif AnzErgOrdner >= 1
        fprintf('\nEs wurden mehrere Ergebnissordner gefunden:\n');
        % Gefundene Ergebnissordner anzeigen
        for i=1:AnzErgOrdner
            Cell2Str = char(Ergebnissordner_Auswahl{i, 1});
            fprintf('\n%s', Cell2Str);
        end
        fprintf('\n\n(0) Neuberechnung durchführen\n');
        % Benutzereingabe anfordern 
        prompt = '\nBitte wählen Sie durch Eingabe der entsprechenden Zahl den zu ladenden Ergebnissordner aus:   ';
        Auswahl = input(prompt);
        % Auswahl überprüfen
        if Auswahl <= AnzErgOrdner && Auswahl > 0
            Folder_Erg = Verz_Programm(PosErgOrdner(Auswahl, 1)).name;
            fprintf('%s wurde als Ergebnissordner ausgewählt.\n\n',Folder_Erg);
        elseif Auswahl == 0
            fprintf('Es werden keine Ergebnisse eingelesen sondern eine Neuberechnung durchgeführt.\n\n');
            Eingabewerte_Lesen_Check = Eingabewerte_Lesen_Check + 1;
        else
            fprintf('Der eingegebene Wert liegt außerhalt des Eingabebereichs!\n');
            fprintf('Es werden keine Ergebnisse eingelesen sondern eine Neuberechnung durchgeführt.\n\n');
            Eingabewerte_Lesen_Check = Eingabewerte_Lesen_Check + 1;
        end
    % Kein Ergebnissordner
    elseif AnzErgOrdner == 0
        fprintf('\nEs wurde kein Ergebnissordner gefunden.\n');
        fprintf('Es werden keine Ergebnisse eingelesen sondern eine Neuberechnung durchgeführt.\n\n');
        Eingabewerte_Lesen_Check = Eingabewerte_Lesen_Check + 1;
    end

% Gespeicherte Ergebnisdatei suchen und Name in Variable setzen falls gefunden  
if Eingabewerte_Lesen_Check == 0
    % In Ergebnisordner wechseln
    cd(Folder_Erg);
    % Datei suchen
    Verz_Ergebnisse = dir;
    % Anzahl Elemente in momentanem Verzeichnis ermitteln
    AnzElemente_Ergebnisse = size(Verz_Ergebnisse);
    AnzElemente_Ergebnisse = AnzElemente_Ergebnisse(:,1);
    AnzEingabewerteDateien = 0;
    PosEingabewerteDateien = 0;
    % Anzahl Dateien die 'Eingabewerte' und '.m' enthalten ermitteln
    for i=1:AnzElemente_Ergebnisse
        if contains(Verz_Ergebnisse(i).name, 'Eingabewerte') && contains(Verz_Ergebnisse(i).name, '_Ergebnisse.m') && Verz_Ergebnisse(i).isdir == 0
            AnzEingabewerteDateien = AnzEingabewerteDateien + 1;
            PosEingabewerteDateien = i;
        end
    end
    % Wenn nur eine Datei gefunden, Dateiname_Eingabewerte_gespeichert auf diese Datei setzen
    if AnzEingabewerteDateien == 1
        Dateiname_Eingabewerte_gespeichert = Verz_Ergebnisse(PosEingabewerteDateien).name;
        % Eingabewerte Datei einlesen
            % Überprüfen ob Datei vorhanden ist
            if exist([pwd,'\',Dateiname_Eingabewerte_gespeichert],'file')
                % Eingabewerte_gespeichert Skript ausführen
                run([pwd,'\',Dateiname_Eingabewerte_gespeichert]);
                fprintf('- %s Skript ausgeführt\n', Dateiname_Eingabewerte_gespeichert);
            else
                Eingabewerte_Lesen_Check = Eingabewerte_Lesen_Check + 1;
            end  
    elseif AnzEingabewerteDateien >= 1
        disp('Es wurden mehrere Eingabedateien gefunden!');
        disp('Falsche Eingabedateien löschen!');
        Eingabewerte_Lesen_Check = Eingabewerte_Lesen_Check + 1;
    elseif AnzEingabewerteDateien == 0
        disp('Es wurde keine Eingabedatei gefunden!');
        Eingabewerte_Lesen_Check = Eingabewerte_Lesen_Check + 1;
    end
    % In Programmordner wechseln
    cd(pwd_Programm);
    
    

end
    
    
    
    