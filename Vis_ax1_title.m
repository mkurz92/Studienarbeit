% Function - Subplot 1 - Draufsicht von oben auf Kolben Titel ändern
function Vis_ax1_title(aufzu_plot)
    global ASP_akt;
    global KW_akt;
    title(aufzu_plot, {'Übertriebene Darstellung Buchse+Kolben von oben';['für ', num2str(ASP_akt) ,'. Arbeitsspiel und ', num2str(KW_akt) ,'°KW']});
end
