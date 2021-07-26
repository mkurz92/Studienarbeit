% Function - Slider KW Callback 
function Vis_Slider_Werte_Callback (src,~)
    % Globale Variablen einführen
    global ax1
    global ax2
    global ax4
    global gui_2_3
    global KW_akt
    KW_akt = ceil(src.Value);

    % Subplot 1 - Draufsicht von oben auf Kolben
        Vis_Kolb_Seg_akt();
    % Subplot 2 - Balkendiagramm für ausgewählte Sensoren
        Vis_Balk_akt();
    % Subplot 2 - Scatterdiagramm für ausgewählte Sensoren
        Vis_Scat_akt();
    % Subplot 5 - Tabelle
        Vis_Tab_akt();

    % Aktueller ausgewählter Kurbelwinkel in Text ausgeben
    gui_2_3.String = ['Ausgewählter Kurbelwinkel: ', num2str(KW_akt), '°KW'];
    % Funktion für Titel ax1 aufrufen
    Vis_ax1_title(ax1);
    % Funktion für Titel ax2 aufrufen
    Vis_ax2_title(ax2);
    % Funktion für Titel ax4 aufrufen
    Vis_ax4_title(ax4);
end