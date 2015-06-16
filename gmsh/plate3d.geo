

// Gmsh allows variables; these will be used to set desired
// element sizes at various Points
cl1 = 6;
cl2 = .03;
cl3 = 10;

sz=2;

platesz=40*sz;

extr = -sz*10;

// Exterior (bounding box) of mesh
Point(1) = {0, 0, 0, cl1};
Point(2) = {platesz,  0, 0, cl3};
Point(3) = { platesz,  platesz, 0, cl3};
Point(4) = {0,  platesz, 0, cl1};

Line(1) = {1, 2};
Line(2) = {2, 3};
Line(3) = {3, 4};
Line(4) = {4, 1};

Transfinite Line {1,2,3,4} = platesz/sz+1; // We want 40 points along each of these lines


Line Loop(1) = {1,2,3,4};

// Each region which to be independently meshed must have a line loop
// Regions which will be meshed with Transfinite Surface must have 4 lines
// and be labeled in CCW order, with the correct orientation of each edge
//Line Loop(1) = {1, 2, 3, 4, 7, 16, 8, 15}; // Exterior
//Line Loop(2) = {10, 8, -11, -5}; // RH side of quad region - note ordering
//Line Loop(3) = {7, -12, -6, 9}; // LH side of quad region - note ordering
//Line Loop(4) = {-10, -14, 12, 15}; // RH side of quad region - note ordering
//Line Loop(5) = {16, -9, -13, 11}; // LH side of quad region - note ordering

Plane Surface(1) = {1};


// Mesh these surfaces in a structured manner
Transfinite Surface{1};

// Turn into quads (optional, but Transfinite Surface looks best with quads)
Recombine Surface {1};
// Turn outer region into unstructured quads (optional)
//Recombine Surface {1};

// Change layer to increase z subdivision
Extrude {0, 0, extr} { Surface{1}; Layers{10}; Recombine;}


Physical Surface("wall") = {13};
Physical Surface("inflow") = {25};
Physical Surface("top") = {21};
Physical Surface("outflow") = {17};
Physical Surface("periodic_0_r") = {1};
Physical Surface("periodic_0_l") = {26};
Physical Volume("fluid") = {1};
