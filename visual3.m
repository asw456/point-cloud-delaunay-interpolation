function [] = visual3(xaves,yaves,zaves)
    
    [xaves,yaves] = meshgrid(xaves,yaves);

    plot3(xaves',yaves',zaves','-','color',[0.1 0.1 0.3],'linewidth',2)
    
end