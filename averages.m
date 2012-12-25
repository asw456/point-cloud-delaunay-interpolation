function [xaves,yaves,zaves] = averages(xgrid,ygrid,zgrid,beams)
    
    [~,m] = size(zgrid);
    [~,n] = size(beams);
    
    xaves = xgrid;
    yaves = beams;

    zaves = zeros(n,m);

    for i = 1 : n
        
        if i == 1
            size(zaves(i,:))
            size(mean(zgrid(ygrid <= mean(yaves(i:i + 1)),:)))
            zaves(i,:) = mean(zgrid(ygrid <= mean(yaves(i:i + 1)),:));
            continue
            
        end
        
        if i == n 
            
            zaves(i,:) = mean(zgrid(ygrid > mean(yaves(i - 1:i)),:));
            continue
            
        end
        
        zaves(i,:) = mean(zgrid((ygrid > mean(yaves(i - 1:i))) == (ygrid <= mean(yaves(i:i + 1))),:));
        
    end
    
end