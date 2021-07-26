% Visualisierung - Colormaps und Colororder setzen
% Datum: 28.06.2019
% Markus Kurz

% Colormap
    colormap_rot_seq = [255,247,236
                        254,232,200
                        253,212,158
                        253,187,132
                        252,141,89
                        239,101,72
                        215,48,31
                        179,0,0
                        127,0,0]/255;
    colormap(colormap_rot_seq)
% Colororder
    colororder_12 = [166,206,227
                    31,120,180
                    178,223,138
                    51,160,44
                    251,154,153
                    227,26,28
                    253,191,111
                    255,127,0
                    202,178,214
                    106,61,154
                    255,255,153
                    177,89,40]/255;
    colororder_5 = [228,26,28
                    55,126,184
                    77,175,74
                    152,78,163
                    255,127,0]/255;
% FKFS Farben für Plot
    global FKFS_blau
    FKFS_blau = [0 81/255 158/255];
    global FKFS_grau
    FKFS_grau = [62/255 68/255 76/255];