% Funktion - Checkboxen Druck Callback
function Vis_Check_Druck_Callback(src, ~, data)
    % Global Variablen
    global Drucksensor_Anz_gui
    global splot_9_1_0 %#ok<NUSED>
    global ax9
    for k=1:Drucksensor_Anz_gui
            eval(['global splot_9_1_', int2str(k)]);
    end
    eval(['global splot_9_1_', num2str(Drucksensor_Anz_gui+1)]);
    
    if (get(src,'Value') == get(src,'Max'))
        eval(['set(splot_9_1_', int2str(data), ', ''Visible'', ''on'');']);
    elseif (get(src,'Value') == get(src,'Min'))
        eval(['set(splot_9_1_', int2str(data), ', ''Visible'', ''off'');']);
    else
    end
    
    legend_sichtbar = findobj(ax9,'type','line','visible','on');
    if (size(legend_sichtbar, 1) == 0)
        legend(ax9, 'off');
    else
        legende_set = legend(legend_sichtbar, 'Location','southeast');
        set(legende_set, 'Interpreter','none', 'Box','off');
    end
end
