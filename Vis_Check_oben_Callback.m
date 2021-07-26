% Funktion - Checkboxen obere Ebene Callback
function Vis_Check_oben_Callback(src, ~, data)
    % Global Variablen
    global P_Anz_gui
    global splot_5_1_0 %#ok<NUSED>
    global ax5
    for k=1:P_Anz_gui
            eval(['global splot_5_1_', int2str(k)]);
    end
    
    if (get(src,'Value') == get(src,'Max'))
        eval(['set(splot_5_1_', int2str(data), ', ''Visible'', ''on'');']);
    elseif (get(src,'Value') == get(src,'Min'))
        eval(['set(splot_5_1_', int2str(data), ', ''Visible'', ''off'');']);
    else
    end
    
    legend_sichtbar = findobj(ax5,'type','line','visible','on');
    if (size(legend_sichtbar, 1) == 0)
        legend(ax5, 'off');
    else
        legende_set = legend(legend_sichtbar, 'Location','southeast');
        set(legende_set, 'Interpreter','none', 'Box','off');
    end
end
