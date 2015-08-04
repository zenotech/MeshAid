

// Gmsh allows variables; these will be used to set desired
// element sizes at various Points
cl1 = 0.125;
cl2 = 0.125*0.25; // Bump refinement
cl3 = 0.125;

sz = 0.5;
sy = 0.125;
sdz = 0.05; // Bump height

Point(1) = {0, 0, 0, cl1};
Point(2) = {1, 0, sdz, cl1};
Point(3) = {1, sy, sdz, cl1};
Point(4) = {0, sy, 0, cl1};
Point(5) = {0, 0, sz, cl1};
Point(6) = {1, 0, sz, cl1};
Point(7) = {1, sy, sz, cl1};
Point(8) = {0, sy, sz, cl1};
Point(9) = {0.4, 0, 0, cl2};
Point(10) = {0.4, sy, 0, cl2};
Point(11) = {0.6, 0, sdz, cl2};
Point(12) = {0.6, sy, sdz, cl2};


Line(1) = {1, 9};
Line(13) = {9, 11};
Line(14) = {11, 2};
Line(2) = {2, 3};
Line(3) = {3, 12};
Line(15) = {12, 10};
Line(16) = {10, 4};
Line(4) = {4, 1};
Line(5) = {5, 6};
Line(6) = {6, 7};
Line(7) = {7, 8};
Line(8) = {8, 5};
Line(9) = {1, 5};
Line(10) = {2, 6};
Line(11) = {3, 7};
Line(12) = {4, 8};
Line(17) = {9,10};
Line(18) = {11,12};

Line Loop(1) = {1,17,16,4};
Line Loop(7) = {13,18,15,-17};
Line Loop(8) = {14,2,3,-18};
Line Loop(2) = {5,6,7,8};
Line Loop(3) = {1,13,14,10,-5,-9};
Line Loop(4) = {2,11,-6,-10};
Line Loop(5) = {-3,-15,-16,11,7,-12};
Line Loop(6) = {4,9,-8,-12};

Plane Surface(1) = {1};
Plane Surface(2) = {2};
Plane Surface(3) = {3};
Plane Surface(4) = {4};
Plane Surface(5) = {5};
Plane Surface(6) = {6};
Plane Surface(7) = {7};
Plane Surface(8) = {8};

Surface Loop(1) = {1,2,3,4,5,6,7,8};
Volume(1) = {1};

Physical Surface("wall") = {1,7,8};
Physical Surface("inflow") = {6};
Physical Surface("top") = {2};
Physical Surface("outflow") = {4};
Physical Surface("ymin") = {3};
Physical Surface("ymax") = {5};
Physical Volume("fluid") = {1, 2, 3, 4, 5, 6, 7, 8};
