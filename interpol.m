function [f] = interpol(verts,faces,adj,val,g)
    
    [M,~] = size(faces); % finds the number of triangles
    
    T = 1; % initial triangle
    
    for i = 1 : M
        
        A = [verts(faces(T,:),:)';ones(1,3)]; % matrix of coefficients for barycentric coordinates
        B = [g';ones(1,1)];                   % target point coordinates and coordinate conditions
        
        l = A\B; % calculates barycentric coordinates
        
        if sum(l < -1.0e-12) == 0 % checks if the target point is within the triangle
            
            break
            
        end
        
        [~,pos] = min(l); % finds the most negative barycentric coordinate and the edge to jump
        
        if adj(T,pos) < 0 % checks if there is no adjacent triangle
            
            fprintf('\nERROR : TARGET OUTSIDE TRIANGULATION\n\n')
            return
            
        end
        
        T = adj(T,pos); % jumps the edge opposite the most negative barycentric coordinate
        
    end
    
    f = l'*val(faces(T,:)); % calculates linear interpolant value on triangle
    
end