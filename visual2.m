function [] = visual2(xgrid,ygrid,zgrid,xlims,ylims,zlims,filename)
    
    [xgrid,ygrid] = meshgrid(xgrid,ygrid);
    
    xgrid = xgrid';
    ygrid = ygrid';
    zgrid = zgrid';
    
    figure('name',filename)
    axes('box','on','visible','on','xlim',xlims,'ylim',ylims,'zlim',zlims) % creates axes
    view([28 25])
    
    set(gca,'projection','perspective','dataaspectratio',[1 1 1],'plotboxaspectratio',[1 1 1]) % fixes scaling and perspective
    set(gca,'cameraviewangle',5)                                                               % fixes camera viewing angle
    
    hold on
    box  on
    
%     plot3(xgrid,ygrid,zgrid,'-','color',[0.5 0.5 0.8],'linewidth',1)
    
    [m,~] = size(zgrid);
    
    for i = 1 : m - 1
        
        patch(xgrid(i:i + 1,:),ygrid(i:i + 1,:),zgrid(i:i + 1,:),'r','facecolor','none','edgealpha',0.3,'edgecolor',[0.5 0.5 0.8])
        
    end
    
end