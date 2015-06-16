

// Gmsh allows variables; these will be used to set desired
// element sizes at various Points
cl1 = 6;
cl2 = .03;
cl3 = 10;

sz=2;

boxsz=20*sz;

numbox=10;

extr = -sz;

// Exterior (bounding box) of mesh
Point(1) = {0, 0, 0, cl1};
Point(2) = { boxsz, 0, 0, cl3};
Point(3) = { boxsz,  boxsz, 0, cl3};
Point(4) = {0,  boxsz, 0, cl1};
Point(5) = {-10*boxsz,  -10*boxsz, 0, cl1};
Point(6) = {0,  -10*boxsz, 0, cl1};
Point(7) = {0+boxsz,  -10*boxsz, 0, cl1};
Point(8) = {10*boxsz,  -10*boxsz, 0, cl1};
Point(9) = {10*boxsz,  0, 0, cl1};
Point(10) = {10*boxsz, boxsz, 0, cl1};
Point(11) = {10*boxsz,  10*boxsz, 0, cl1};
Point(12) = {boxsz,  10*boxsz, 0, cl1};
Point(13) = {0, 10*boxsz, 0, cl1};
Point(14) = {-10*boxsz,  10*boxsz, 0, cl1};
Point(15) = {-10*boxsz, boxsz, 0, cl1};
Point(16) = {-10*boxsz,  0, 0, cl1};

Line(1) = {1, 2};
Line(2) = {2, 3};
Line(3) = {3, 4};
Line(4) = {4, 1};
Line(5) = {5, 6};
Line(6) = {6, 7};
Line(7) = {7, 8};
Line(8) = {8, 9};
Line(9) = {9, 10};
Line(10) = {10,11};
Line(11) = {11, 12};
Line(12) = {12, 13};
Line(13) = {13,14};
Line(14) = {14, 15};
Line(15) = {15, 16};
Line(16) = {16,5};

Line(17) = {1, 6};
Line(18) = {2, 7};
Line(19) = {2, 9};
Line(20) = {3, 10};
Line(21) = {3, 12};
Line(22) = {4, 13};
Line(23) = {4, 15};
Line(24) = {1, 16};


Transfinite Line {5,7,8,10,11,13,14,16,17,18,19,20,21,22,23,24} = 10*boxsz/sz+1; // We want 40 points along each of these lines
Transfinite Line {1,2,3,4,6,9,12,15} = boxsz/sz+1;    // And 10 points along each of these lines


Line Loop(1) = {5,-17,24,16};
Line Loop(2) = {18,7,8,-19};
Line Loop(3) = {20,10,11,-21};
Line Loop(4) = {22,13,14,-23};
Line Loop(5) = {17,6,-18,-1};
Line Loop(6) = {19,9,-20,-2};
Line Loop(7) = {21,12,-22,-3};
Line Loop(8) = {23,15,-24,-4};



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
Plane Surface(4) = {4};
Plane Surface(5) = {5};
Plane Surface(6) = {6};
Plane Surface(7) = {7};
Plane Surface(8) = {8};

//Plane Surface(1) = {1}; // Outer unstructured region
//Plane Surface(1) = {2}; // RH inner structured region
//Plane Surface(2) = {3}; // LH inner structured region
//Plane Surface(3) = {4}; // RH inner structured region
//Plane Surface(4) = {5}; // LH inner structured region

// Mesh these surfaces in a structured manner
Transfinite Surface{1,2,3,4,5,6,7,8};

// Turn into quads (optional, but Transfinite Surface looks best with quads)
Recombine Surface {1,2,3,4,5,6,7,8};
// Turn outer region into unstructured quads (optional)
//Recombine Surface {1};

// Change layer to increase z subdivision
Extrude {0, 0, extr} { Surface{1,2,3,4,5,6,7,8}; Layers{1}; Recombine;}


Physical Surface("wall") = {199,133,155,177};
Physical Surface("inflow") = {107, 191, 45};
Physical Surface("top") = {103,169,85};
Physical Surface(“bot”) = {33,125,59};
Physical Surface("outflow") = {81,147,63};
Physical Surface("periodic_0_r") = {1,2,3,4,5,6,7,8};
Physical Surface("periodic_0_l") = {112,46,200,134,68,156,90,178};
Physical Volume("fluid") = {1, 2, 3, 4, 5, 6, 7, 8};
