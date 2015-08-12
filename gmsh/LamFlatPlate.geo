dx = 1.0;
dy = 0.5;
cl1 = 0.025;

pr = 1.15;


Point(1) = {0.0, 0.0, 0.0, cl1};
Point(2) = {dx, 0.0, 0.0, cl1};
Point(3) = {dx, dy, 0.0, cl1};
Point(4) = {0.0, dy, 0.0, cl1};

Line(1) = {1,2};
Line(2) = {2,3};
Line(3) = {3,4};
Line(4) = {1,4};

Transfinite Line{1} = 20;
Transfinite Line{2} = 30 Using Progression pr;
Transfinite Line{3} = 20;
Transfinite Line{4} = 30 Using Progression pr;

Line Loop(1) = {1,2,3,-4};
Plane Surface(1) = {1};
Transfinite Surface {1};
Recombine Surface {1};

Extrude {0, 0, 0.05} { Surface{1}; Layers{1}; Recombine;}


Physical Surface("wall") = {13};
Physical Surface("zmin") = {1};
Physical Surface("zmax") = {26};
Physical Surface("in") = {25};
Physical Surface("out") = {17};
Physical Surface("top") = {21};
Physical Volume("fluid") = {1};
