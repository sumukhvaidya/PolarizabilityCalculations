SetFactory("OpenCASCADE"); 
r=1;
x = 0; y = 0; z = 0;
Sphere(1) = {x, y, z, r};
Sphere(2) = {2*r*(ld-1), y, z, r};
BooleanUnion(3) = { Volume{1}; Delete; }{ Volume{2}; Delete; };