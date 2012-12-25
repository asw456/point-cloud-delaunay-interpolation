%% START UP AND DECLARATIONS

clear all
close all
clc

filename = 'TEST'; % project name

%     x = [ ]; % raw x values
%     y = [ ]; % raw y values
%     z = [ ]; % raw z values
% 
%     xlims = [xmin xmax]; % interpolation region x limits
%     ylims = [ymin ymax]; % interpolation region y limits
%     xyres = [xres yres]; % interpolation resolution
%
%     beams = [ ]; % raw beam positions ASSUMED TO BE Y AXIS

    coordinates = csvread('coordinates.csv');
    
    x = coordinates(:,1);
    y = coordinates(:,2);
    z = coordinates(:,3);

    xlims = [min(x) + 10e-2 max(x) - 10e-2];
    ylims = [min(y) + 10e-2 max(y) - 10e-2];
    zlims = [0 8];
    xyres = [300 80]; % interpolation resolution
    
    beams = [0.2 : 1 : ylims(2)];

%% MAIN

[verts,faces,adj,val] = triangle(x,y,z);       % DELAUNAY TRIANGULATION
visual1(verts,faces,val,xlims,ylims,zlims,filename); % STANDARD VISUALISATION

xgrid = linspace(xlims(1),xlims(2),xyres(1)); % x values
ygrid = linspace(ylims(1),ylims(2),xyres(2)); % y values

zgrid = zeros(xyres(2),xyres(1));

for i = 1 : xyres(1)
    
    for j = 1 : xyres(2)
        
        g = [xgrid(i) ygrid(j)];             % grid xy values
        f = interpol(verts,faces,adj,val,g); % GRID INTERPOLATION
        
        zgrid(j,i) = f; % stores grid z value
        
    end
    
    clc
    
    fprintf('\n%i',i);
    
end

visual2(xgrid,ygrid,zgrid,xlims,ylims,zlims,filename); % GRID VISUALISATION

[xaves,yaves,zaves] = averages(xgrid,ygrid,zgrid,beams); % BEAM AVERAGES

visual3(xaves,yaves,zaves); % BEAM VISUALISATION

csvwrite('x_beam_averages1.csv',xaves);
csvwrite('y_beam_averages1.csv',yaves);
csvwrite('z_beam_averages1.csv',zaves);