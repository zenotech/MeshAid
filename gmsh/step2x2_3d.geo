

// Gmsh allows variables; these will be used to set desired
// element sizes at various Points
cl1 = 6;
cl2 = .03;
cl3 = 10;

sz=2;
stepheight=10*sz;


numstep=stepheight/sz+1;
extr = -sz*10;

// Exterior (bounding box) of mesh
Point(1) = {0, 0, 0, cl1};
Point(2) = { 0, stepheight, 0, cl3};
Point(3) = { 10*stepheight,  stepheight, 0, cl3};
Point(4) = {10*stepheight,  11*stepheight, 0, cl1};
Point(5) = {0,  11*stepheight, 0, cl1};
Point(6) = {-10*stepheight,  11*stepheight, 0, cl1};
Point(7) = {-10*stepheight,  stepheight, 0, cl1};
Point(8) = {-10*stepheight,  0, 0, cl1};

Line(1) = {1, 2};
Line(2) = {2, 3};
Line(3) = {3, 4};
Line(4) = {4, 5};
Line(5) = {5, 6};
Line(6) = {6, 7};
Line(7) = {7, 8};
Line(8) = {8, 1};
Line(9) = {2, 5};
Line(10) = {2,7};

Transfinite Line {2,3,4,5,6,8,9,10} = 10*stepheight/sz+1; // We want 40 points along each of these lines
Transfinite Line {1,7} = numstep;    // And 10 points along each of these lines


Line Loop(1) = {2,3,4,-9};
Line Loop(2) = {5,6,-10,9};
Line Loop(3) = {7,8,1,10};

// Each region which to be independently meshed must have a line loop
// Regions which will be meshed with Transfinite Surface must have 4 lines
// and be labeled in CCW order, with the correct orientation of each edge
//Line Loop(1) = {1, 2, 3, 4, 7, 16, 8, 15}; // Exterior
//Line Loop(2) = {10, 8, -11, -5}; // RH side of quad region - note ordering
//Line Loop(3) = {7, -12, -6, 9}; // LH side of quad region - note ordering
//Line Loop(4) = {-10, -14, 12, 15}; // RH side of quad region - note ordering
//Line Loop(5) = {16, -9, -13, 11}; // LH side of quad region - note ordering

Plane Surface(1) = {1};
Plane Surface(2) = {2};
Plane Surface(3) = {3};

//Plane Surface(1) = {1}; // Outer unstructured region
//Plane Surface(1) = {2}; // RH inner structured region
//Plane Surface(2) = {3}; // LH inner structured region
//Plane Surface(3) = {4}; // RH inner structured region
//Plane Surface(4) = {5}; // LH inner structured region

// Mesh these surfaces in a structured manner
Transfinite Surface{1,2,3};

// Turn into quads (optional, but Transfinite Surface looks best with quads)
Recombine Surface {1,2,3};
// Turn outer region into unstructured quads (optional)
//Recombine Surface {1};

// Change layer to increase z subdivision
Extrude {0, 0, extr} { Surface{1,2,3}; Layers{10}; Recombine;}


Physical Surface("wall") = {67,71,19};
Physical Surface("inflow") = {45, 63};
Physical Surface("top") = {41,27};
Physical Surface("outflow") = {23};
Physical Surface("periodic_0_r") = {1,2,3};
Physical Surface("periodic_0_l") = {76,54,32};
Physical Volume("fluid") = {1, 2, 3};
