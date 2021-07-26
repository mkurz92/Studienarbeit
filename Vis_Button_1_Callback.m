% Funktion - Radiobuttongroup 1 Callback    
function Vis_Button_1_Callback(~, event)
    % Globale Variablen
    global ax2
    global ax4
    global Tempebene
    global KW_akt
    global ASP_akt
    global buttongroup_7
    global button_7_1
    global button_7_2
    global Button_String
    
    % Temperatur obere Ebene
    if strcmp(event.NewValue.String, 'Temperatur obere Ebene')
        fprintf('Temperatur obere Ebene wurde ausgewählt.\n');
        Button_String = event.NewValue.String;
        set(buttongroup_7,'SelectedObject',button_7_1);
        ax2.Title.String = ['Temperatur und Abstand an der oberen Ebene für ', num2str(ASP_akt) ,'. Arbeitsspiel und ', num2str(KW_akt) ,'°KW'];
        ax2.XLabel.String = 'Temperatursensoren obere Ebene';
        % Temperaturebene setzen
        Tempebene = 1;
        % Subplot 1 - Farbige Segmente
            Vis_Kolb_Seg_akt();
        % Subplot 2 - Balkendiagramm
            Vis_Balk_akt();
        % Subplot 2 - Scatterdiagramm
            Vis_Scat_akt();
            ax4.Title.String = ['Temperatur über Abstand an der oberen Ebene für ', num2str(ASP_akt) ,'. Arbeitsspiel und ', num2str(KW_akt) ,'°KW'];
    % Temperatur untere Ebene
    elseif strcmp(event.NewValue.String, 'Temperatur untere Ebene')
        fprintf('Temperatur untere Ebene wurde ausgewählt.\n');
        Button_String = event.NewValue.String;
        set(buttongroup_7,'SelectedObject',button_7_2);
        ax2.Title.String = ['Temperatur und Abstand an der unteren Ebene für ', num2str(ASP_akt) ,'. Arbeitsspiel und ', num2str(KW_akt) ,'°KW'];
        ax2.XLabel.String = 'Temperatursensoren untere Ebene';
        % Temperaturebene setzen
        Tempebene = 0;
        % Subplot 1 - Farbige Segmente
            Vis_Kolb_Seg_akt();
        % Subplot 2 - Balkendiagramm
            Vis_Balk_akt();
        % Subplot 2 - Scatterdiagramm
            Vis_Scat_akt();
            ax4.Title.String = ['Temperatur über Abstand an der unteren Ebene für ', num2str(ASP_akt) ,'. Arbeitsspiel und ', num2str(KW_akt) ,'°KW'];
    else
    end    
end