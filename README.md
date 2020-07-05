Surface interpolation from a point cloud
==================================

Tool that interpolates a surface in R3 given an (x,y) point and a file of (x,y,z) input points. 

The method uses Delaunay triangulation and an efficient search to find the triangle corresponding to the query point.

Originally written to digitize wind tunnel pressure charts for calculating uplift forces on a large warehouse in Queensland.

![Example Surface](/surface_all1.png)
