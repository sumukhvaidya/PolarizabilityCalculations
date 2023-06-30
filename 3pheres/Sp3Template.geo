SetFactory("OpenCASCADE"); 
//ld=1.6;
//hr=1.3;
r1=1;
r2=1;
x = 0; y = 0; z = 0;
Sphere(1) = {x, y, z, r1};
Sphere(2) = {2*r1*(ld-1), y, z, r1};
Sphere(3) = {r1*(ld-1), r2*hr, z, r2};
combinedVol() = BooleanUnion{Volume{1}; Delete;}{Volume{2,3}; Delete;};// {Volume{3}; Delete;} ;
//combinedVol() = BooleanUnion{Volume{1}; Delete;}{Volume{2}; Delete;} {Volume{3}; Delete;} ;
//BooleanUnion(4) = { Volume{1}; Delete; }{ Volume{3}; Delete; };
//BooleanUnion(5) = { Volume{2}; Delete; }{ Volume{4}; Delete; };
//BooleanUnion(6) = { Volume{2}; Delete; }{ Volume{5}; Delete; };
//BooleanUnion(6) = { Volume{3,1}; Delete; }