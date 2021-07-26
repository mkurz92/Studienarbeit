% Hauptprogramm der Auswertung
% Datum: 26.06.2019
% Markus Kurz

%tic;

fprintf('Hauptprogramm wird ausgeführt...%s\n', mfilename);

% --- Skript Aufruf - Eingabewerte_Lesen ---
Aus_Ergebnisordner_Eingabewerte_Lesen;

% Eingabewertedatei lesen fehlgeschlagen
if Eingabewerte_Lesen_Check ~= 0
    
    % --- Skript Aufruf - Eingabewerte ---
    Aus_Eingabewerte;
    
    % --- Skript Aufruf - Eingabewerte_Check ---
    Aus_Eingabewerte_Check;
    
    % Fensterung stimmt
    if Fenst_Check == 1
     
        % --- Skript Aufruf - Einlesen und Verarbeitung der Messdaten ---
        Aus_Messdaten_Lesen;
        
        % --- Skript Aufruf - Messdaten_Filterung ---
        Aus_Messdaten_Filterung;
        
        % --- Skript Aufruf - Ausgabematrizen_initialisieren ---
        Aus_Ausgabematrizen_initialisieren;
        
        % --- Skript Aufruf - Berechnung_split_einmalig ---
        Aus_Berechnung_Messdaten_unabhaengig;
        
        % --- Skript Aufruf - Berechnung_split_Vektor ---
        Aus_Berechnung_Messdaten_abhaengig;

        % --- Skript Aufruf - Ergebnisse_Schreiben ---
        Aus_Ergebnisse_Schreiben;
    
    % Fensterung stimmt nicht
    elseif Fenst_Check ~= 1
        error('Fehler in Eingabewerten erkannt! Programm wird beendet!');
    end

% Eingabewertedatei lesen erfolgreich    
elseif Eingabewerte_Lesen_Check == 0
    
    % --- Skript Aufruf - AnzASP_Lesen ---
    Aus_AnzASP_Lesen;
    
    % --- Skript Aufruf - Ausgabematrizen_initialisieren ---
    Aus_Ausgabematrizen_initialisieren;
        
    % --- Skript Aufruf - Ergebnisse_Lesen ---
    Aus_Ergebnisse_Lesen;
          
    % --- Skript Aufruf - Berechnung_split_einmalig ---
    Aus_Berechnung_Messdaten_unabhaengig;
        
    % Ergebnisse einlesen fehlgeschlagen
    if Ergebnisse_Lesen_Check ~= 0
        disp('Ergebnisse konnten nicht gelesen werden!');
        
        % --- Skript Aufruf - Eingabewerte ---
        Aus_Eingabewerte;
    
        % --- Skript Aufruf - Eingabewerte_Check ---
        Aus_Eingabewerte_Check;
        
        % --- Einlesen und Verarbeitung der Messdaten ---
        Aus_Messdaten_Lesen;
        
        % --- Skript Aufruf - Messdaten_Filterung ---
        Aus_Messdaten_Filterung;
        
        % --- Skript Aufruf - Berechnung_split_Vektor ---
        Aus_Berechnung_Messdaten_abhaengig;

        % --- Skript Aufruf - Ergebnisse_Schreiben ---
        Aus_Ergebnisse_Schreiben;    
    end        
end

%tCPU = toc;
%disp(['Programmlaufzeit in Sekunden: ',num2str(tCPU)]);

