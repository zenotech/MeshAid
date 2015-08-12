dx = 1.0;
dy = 0.5;
cl1 = 0.025;

prX = 1.1;
prY = 1.15;


Point(1) = {-0.5*dx, 0.0, 0.0, cl1};
Point(2) = {0.0, 0.0, 0.0, cl1};
Point(3) = {dx, 0.0, 0.0, cl1};
Point(4) = {dx, dy, 0.0, cl1};
Point(5) = {0.0, dy, 0.0, cl1};
Point(6) = {-0.5*dx, dy, 0.0, cl1};

Line(1) = {2,1};
Line(2) = {2,3};
Line(3) = {1,6};
Line(4) = {2,5};
Line(5) = {3,4};
Line(6) = {5,6};
Line(7) = {5,4};

Transfinite Line{1} = 33 Using Progression prX;
Transfinite Line{2} = 40 Using Progression prX;
Transfinite Line{3} = 30 Using Progression prY;
Transfinite Line{4} = 30 Using Progression prY;
Transfinite Line{5} = 30 Using Progression prY;
Transfinite Line{6} = 33 Using Progression prX;
Transfinite Line{7} = 40 Using Progression prX;

Line Loop(1) = {-1,4,6,-3};
Line Loop(2) = {2,5,-7,-4};
Plane Surface(1) = {1};
Transfinite Surface {1};
Recombine Surface {1};
Plane Surface(2) = {2};
Transfinite Surface {2};
Recombine Surface {2};

Extrude {0, 0, 0.05} { Surface{1,2}; Layers{1}; Recombine;}


Physical Surface("wall") = {38};
Physical Surface("zmin") = {1,2};
Physical Surface("zmax") = {29,51};
Physical Surface("in") = {28};
Physical Surface("out") = {42};
Physical Surface("top") = {24,46};
Physical Surface("ymin") = {16};
Physical Volume("fluid") = {1,2};
