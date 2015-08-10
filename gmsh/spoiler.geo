

// Gmsh allows variables; these will be used to set desired
// element sizes at various Points
cl1 = 0.125;
cl2 = 0.125*0.25; // Bump refinement
cl3 = 0.125;

sz = 0.5;
sy = 0.125;
sdz = 0.05; // Bump height

Point(1) = {-0.5, 0, 0, 0.75*cl1};
Point(2) = {0.3, 0.0, 0, 0.125*cl1};
Point(3) = {0.4, 0.0, 0, 0.125*cl1};
Point(4) = {2.0, 0, 0, 0.25*cl1};
Point(5) = {-0.5, 0.3, 0, 0.75*cl1};
Point(6) = {0.3, 0.3, 0, 0.125*cl1};
Point(7) = {0.4, 0.3, 0, 0.125*cl1};
Point(8) = {2.0, 0.3, 0, 0.25*cl1};
Point(9) = {-0.5, 1, 0, 0.75*cl1};
Point(10) = {0.2, 1, 0, 0.75*cl1};
Point(11) = {0.5, 1, 0, 0.75*cl1};
Point(12) = {2.0, 1, 0, 0.75*cl1};


Line(1) = {1, 2};
Line(2) = {2, 6};
Line(3) = {6, 5};
Line(4) = {5, 1};
Line(5) = {3, 4};
Line(6) = {4, 8};
Line(7) = {8, 7};
Line(8) = {7, 3};
Line(9) = {6, 10};
Line(10) = {10, 9};
Line(11) = {9, 5};
Line(12) = {6, 7};
Line(13) = {7, 11};
Line(14) = {11, 10};
Line(15) = {8, 12};
Line(16) = {12, 11};


Line Loop(1) = {1,2,3,4};
Line Loop(2) = {5,6,7,8};
Line Loop(3) = {-3,9,10,11};
Line Loop(4) = {-7,15,16,-13};
Line Loop(5) = {12,13,14,-9};



Plane Surface(1) = {1};
Plane Surface(2) = {2};
Plane Surface(3) = {3};
Plane Surface(4) = {4};
Plane Surface(5) = {5};

Recombine Surface {1};
Recombine Surface {2};
Recombine Surface {3};
Recombine Surface {4};
Recombine Surface {5};

Extrude {0, 0, 0.125*cl1} { Surface{1, 2, 3, 4, 5}; Layers{1}; Recombine;}

Physical Surface("wall") = {25,47,29,113,59};
Physical Surface("sym1") = {1,2,3,4,5};
Physical Surface("sym2") = {38,60,82,104,126};
Physical Surface("in") = {81,37};
Physical Surface("out") = {95,51};
Physical Surface("top") = {77,121,99};
Physical Volume("fluid") = {1,2,3,4,5};
