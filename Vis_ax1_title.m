% Function - Subplot 1 - Draufsicht von oben auf Kolben Titel �ndern
function Vis_ax1_title(aufzu_plot)
    global ASP_akt;
    global KW_akt;
    title(aufzu_plot, {'�bertriebene Darstellung Buchse+Kolben von oben';['f�r ', num2str(ASP_akt) ,'. Arbeitsspiel und ', num2str(KW_akt) ,'�KW']});
end
