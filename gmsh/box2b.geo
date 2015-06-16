

// Gmsh allows variables; these will be used to set desired
// element sizes at various Points
cl1 = 6;
cl2 = .03;
cl3 = 10;

sz=2;

boxsz=1*sz;

numbox=10;

extr = -sz;

// Exterior (bounding box) of mesh
Point(1) = {0, 0, 0, cl1};
Point(2) = { boxsz, 0.01*boxsz, 0, cl3};
Point(3) = { boxsz,  boxsz, 0, cl3};
Point(4) = {0,  boxsz, 0, cl1};
Point(5) = {2*boxsz,  0, 0, cl1};
Point(6) = {2*boxsz,  boxsz, 0, cl1};


Line(1) = {1, 2};
Line(2) = {2, 3};
Line(3) = {3, 4};
Line(4) = {4, 1};
Line(5) = {2, 5};
Line(6) = {5, 6};
Line(7) = {6, 3};

Transfinite Line {1,2,3,4,5,6,7} = 2;    // And 10 points along each of these lines

// Each region which to be independently meshed must have a line loop
// Regions which will be meshed with Transfinite Surface must have 4 lines
// and be labeled in CCW order, with the correct orientation of each edge

Line Loop(1) = {1,2,3,4};
Line Loop(2) = {5,6,7,-2};


Plane Surface(1) = {1};
Plane Surface(2) = {2};

// Mesh these surfaces in a structured manner
Transfinite Surface{1,2};

// Turn into quads (optional, but Transfinite Surface looks best with quads)
Recombine Surface {1,2};

// Change layer to increase z subdivision
Extrude {0, 0, extr} { Surface{1,2}; Layers{1}; Recombine;}


Physical Surface("wall") = {29,51};
Physical Surface("inflow") = {28};
Physical Surface("sides") = {1,2,24,46,16,38};
Physical Surface("outflow") = {42};
Physical Volume("fluid") = {1, 2};
