% Function - Subplot 2 - Balkendiagramm f�r ausgew�hlte Sensoren Titel �ndern
function Vis_ax2_title(aufzu_plot)
    global ASP_akt;
    global KW_akt;
    global Tempebene
    if Tempebene == 1
        title(aufzu_plot, ['Temperatur und Abstand an der oberen Ebene f�r ', num2str(ASP_akt) ,'. Arbeitsspiel und ', num2str(KW_akt) ,'�KW']);
    elseif Tempebene == 0
        title(aufzu_plot, ['Temperatur und Abstand an der unteren Ebene f�r ', num2str(ASP_akt) ,'. Arbeitsspiel und ', num2str(KW_akt) ,'�KW']);
    else
    end
end