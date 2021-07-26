% Function - Subplot 4 - Scatterdiagramm für ausgewählte Sensoren Titel ändern
function Vis_ax4_title(aufzu_plot)
    global ASP_akt;
    global KW_akt;
    global Tempebene
    if Tempebene == 1
        title(aufzu_plot, ['Temperatur über Abstand an der oberen Ebene für ', num2str(ASP_akt) ,'. Arbeitsspiel und ', num2str(KW_akt) ,'°KW']);
    elseif Tempebene == 0
        title(aufzu_plot, ['Temperatur über Abstand an der unteren Ebene für ', num2str(ASP_akt) ,'. Arbeitsspiel und ', num2str(KW_akt) ,'°KW']);
    else
    end
end