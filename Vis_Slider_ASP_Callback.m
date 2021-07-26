 % Function - Slider AnzASP Callback
function Vis_Slider_ASP_Callback (src,~)
    % Globale Variablen einf�hren
    global ax1
    global ax2
    global ax4
    global gui_1_3
    global ASP_akt
    ASP_akt = ceil(src.Value);

    % Subplot 1 - Draufsicht von oben auf Kolben
        Vis_Kolb_Seg_akt();
    % Subplot 2 - Balkendiagramm f�r ausgew�hlte Sensoren
        Vis_Balk_akt();
    % Subplot 2 - Scatterdiagramm f�r ausgew�hlte Sensoren
        Vis_Scat_akt
    % Subplot 5 - Tabelle
        Vis_Tab_akt();

    % Aktuelles ausgew�hltes ASP in Text ausgeben
    gui_1_3.String = ['Ausgew�hltes Arbeitsspiel: ', num2str(ASP_akt)];
    % Funktion f�r Titel ax1 aufrufen
    Vis_ax1_title(ax1);
    % Funktion f�r Titel ax2 aufrufen
    Vis_ax2_title(ax2);
    % Funktion f�r Titel ax4 aufrufen
    Vis_ax4_title(ax4);
end