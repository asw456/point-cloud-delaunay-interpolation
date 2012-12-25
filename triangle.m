function [verts,faces,adj,val] = triangle(x,y,z)

    T = DelaunayTri(x,y);

    clc

    verts = T.X;
    faces = T.Triangulation;
    adj = neighbors(T); adj(isnan(adj)) = -1;
    val = z;

end