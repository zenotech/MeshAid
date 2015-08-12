dx = 1.0;
dy = 0.5;
cl1 = 0.025;

prX = 1.1;
prY = 1.15;
prX1 = 1.15;

Point(1) = {-0.5*dx, 0.0, 0.0, cl1};
Point(2) = {0.0, 0.0, 0.0, cl1};
Point(3) = {0.5*dx, 0.0, 0.0, cl1};
Point(4) = {dx, 0.0, 0.0, cl1};
Point(5) = {1.5*dx, 0.0, 0.0, cl1};
Point(6) = {-0.5*dx, dy, 0.0, cl1};
Point(7) = {0.0, dy, 0.0, cl1};
Point(8) = {0.5*dx, dy, 0.0, cl1};
Point(9) = {dx, dy, 0.0, cl1};
Point(10) = {1.5*dx, dy, 0.0, cl1};


Line(1) = {2,1};
Line(2) = {2,3};
Line(3) = {4,3};
Line(4) = {4,5};
Line(5) = {1,6};
Line(6) = {2,7};
Line(7) = {3,8};
Line(8) = {4,9};
Line(9) = {5,10};
Line(10) = {7,6};
Line(11) = {7,8};
Line(12) = {9,8};
Line(13) = {9,10};




Transfinite Line{1} = 33 Using Progression prX1;
Transfinite Line{2} = 40 Using Progression prX;
Transfinite Line{3} = 40 Using Progression prX;
Transfinite Line{4} = 33 Using Progression prX1;
Transfinite Line{5} = 30 Using Progression prY;
Transfinite Line{6} = 30 Using Progression prY;
Transfinite Line{7} = 30 Using Progression prY;
Transfinite Line{8} = 30 Using Progression prY;
Transfinite Line{9} = 30 Using Progression prY;
Transfinite Line{10} = 33 Using Progression prX1;
Transfinite Line{11} = 40 Using Progression prX;
Transfinite Line{12} = 40 Using Progression prX;
Transfinite Line{13} = 33 Using Progression prX1;



Line Loop(1) = {-1,6,10,-5};
Line Loop(2) = {2,7,-11,-6};
Line Loop(3) = {-3,8,12,-7};
Line Loop(4) = {4,9,-13,-8};
Plane Surface(1) = {1};
Transfinite Surface {1};
Recombine Surface {1};
Plane Surface(2) = {2};
Transfinite Surface {2};
Recombine Surface {2};
Plane Surface(3) = {3};
Transfinite Surface {3};
Recombine Surface {3};
Plane Surface(4) = {4};
Transfinite Surface {4};
Recombine Surface {4};

Extrude {0, 0, 0.05} { Surface{1,2,3,4}; Layers{1}; Recombine;}


Physical Surface("wall") = {44,66};
Physical Surface("zmin") = {1,2,3,4};
Physical Surface("zmax") = {35,57,79,101};
Physical Surface("in") = {34};
Physical Surface("out") = {92};
Physical Surface("top") = {30,52,74,96};
Physical Surface("ymina") = {22};
Physical Surface("yminb") = {88};
Physical Volume("fluid") = {1,2,3,4};
