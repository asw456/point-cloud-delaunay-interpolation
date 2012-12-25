function [] = visual1(verts,faces,val,xlims,ylims,zlims,filename)
    
    figure('name',filename)
    axes('box','on','visible','on','xlim',xlims,'ylim',ylims,'zlim',zlims) % creates axes
    view([28 25])
    
    set(gca,'projection','perspective','dataaspectratio',[1 1 1],'plotboxaspectratio',[1 1 1]) % fixes scaling and perspective
    set(gca,'cameraviewangle',5)                                                               % fixes camera viewing angle
    
    hold on
    box  on
    
    plot3(verts(:,1),verts(:,2),val,'.','color',[0.1 0.1 0.3],'markersize',5)
    patch('vertices',[verts val],'faces',faces,'facecolor',[0.5 0.5 0.8],'facealpha',1.0,'edgecolor',[0.0 0.0 0.0],'edgealpha',0.1) % plots faces
    
end