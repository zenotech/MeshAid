// Mesh controls
cl1 = 2.0;
cl2 = 0.05; // Wing refinement
cl3 = 0.01;


// Outer domain
ff = 10;
Point(1) = {-ff, 0, -ff, cl1};
Point(2) = {ff, 0, -ff, cl1};
Point(3) = {ff, ff, -ff, cl1};
Point(4) = {-ff, ff, -ff, cl1};
Point(5) = {-ff, 0, ff, cl1};
Point(6) = {ff, 0, ff, cl1};
Point(7) = {ff, ff, ff, cl1};
Point(8) = {-ff, ff, ff, cl1};
Point(15) = {-ff,0,0,cl1};
Point(16) = {ff,0,0,cl1};
Line(1) = {1, 2};
Line(2) = {2, 3};
Line(3) = {3, 4};
Line(4) = {4, 1};
Line(5) = {16, 6};
Line(6) = {2, 16};
Line(7) = {3, 7};
Line(8) = {4, 8};
Line(9) = {5, 6};
Line(10) = {6, 7};
Line(11) = {7, 8};
Line(12) = {8, 5};
Line(22) = {1,15};
Line(23) = {15,5};

//
// Delta wing
//
Point(9) = {0.0, 0.0, 0.0,cl3};
Point(10) = {0.95, 0.0, 0.0,cl2};
Point(11) = {0.95, 0.6915*0.5, 0.0,cl3};
Point(12) = {0.21824, 0.0, -0.02,cl2};
Point(13) = {0.95-0.074641, 0.0, -0.02,cl2};
Point(14) = {0.95-0.074641, 0.23917, -0.02,cl2};

Line(13) = {9,10};
Line(14) = {10,11};
Line(15) = {11,9};
Line(16) = {12,13};
Line(17) = {13,14};
Line(18) = {14,12};
Line(19) = {9,12};
Line(20) = {10,13};
Line(21) = {11,14};
Line(24) = {16,10};
Line(25) = {9,15};

// XMAX PLANE
Line Loop(1) = {7,-10,-5,-6,2};
Plane Surface(1) = {1};
Physical Surface("xmax") = {1};

// XMIN PLANE
Line Loop(2) = {8,12,-23,-22,-4};
Plane Surface(2) = {2};
Physical Surface("xmin") = {2};

// YMAX PLANE
Line Loop(3) = {-3,7,11,-8};
Plane Surface(3) = {3};
Physical Surface("ymax") = {3};

// ZMAX PLANE
Line Loop(4) = {9,10,11,12};
Plane Surface(4) = {4};
Physical Surface("zmax") = {4};

// ZMIN PLANE
Line Loop(5) = {1,2,3,4};
Plane Surface(5) = {5};
Physical Surface("zmin") = {5};

// YMIN - SYMMETRY
Line Loop(6) = {-25,13,-24,5,-9,-23};
Plane Surface(6) = {6};
Physical Surface("ymina") = {6};
Line Loop(7) = {-22,1,6,24,20,-16,-19,25};
Plane Surface(7) = {7};
Physical Surface("yminb") = {7};

// UPPER SURFACE
Line Loop(8) = {13,14,15};
Plane Surface(8) = {8};
Physical Surface("wngup") = {8};

// LOWER SURFACE
Line Loop(9) = {16,17,18};
Plane Surface(9) = {9};
Physical Surface("wnglo") = {9};

// WINDWARD SURFACE
Line Loop(10) = {19,-18,-21,15};
Plane Surface(10) = {10};
Physical Surface("wndwrd") = {10};

// LEEWARD
Line Loop(11) = {-21,-14,20,17};
Plane Surface(11) = {11};
Physical Surface("leewrd") = {11};


Surface Loop(1) = {1,2,3,4,5,6,7,8,9,10,11};
Volume(1) = {1};
Physical Volume("fluid") = {1};





