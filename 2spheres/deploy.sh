#!/bin/bash

touch outpol.csv
for LD in 1.05 1.1 1.15 1.2 1.25 1.3 1.35 1.4 1.45 1.5 1.55 1.6 1.65 1.7 1.75 1.8 1.85 1.9 1.95
do
cp sp2Template.geo sp2_ld_${LD}.geo # copy the geo file for specific LD ratio
sed -i "2i\ld=${LD};\\" sp2_ld_${LD}.geo # Adding the desired value of LD at line 2
gmsh -clscale 0.5 -2 sp2_ld_${LD}.geo -format msh2 -2 -o sp2_ld_${LD}.msh # make mesh; clscale parameter controls mesh fineness
cp Template.scuffgeo sp2_ld_${LD}.scuffgeo
sed -i "6i\    MESHFILE sp2_ld_${LD}.msh\\" sp2_ld_${LD}.scuffgeo # Adding the meshfile at line 6
scuff-static --Geometry sp2_ld_${LD}.scuffgeo --PolFile sp2_ld_${LD}.pol
echo "${LD},$( tail -n 1 sp2_ld_${LD}.pol)" >> outpol.csv
done

for LD in  1.0 2.0
do
#cp sp2Template.geo sp2_ld_${LD}.geo # copy the geo file for specific LD ratio
#sed -i "2i\ld=${LD};\\" sp2_ld_${LD}.geo # Adding the desired value of LD at line 2
gmsh -clscale 0.5 -2 sp2_ld_${LD}.geo -format msh2 -2 -o sp2_ld_${LD}.msh # make mesh; clscale parameter controls mesh fineness
cp Template.scuffgeo sp2_ld_${LD}.scuffgeo
sed -i "6i\    MESHFILE sp2_ld_${LD}.msh\\" sp2_ld_${LD}.scuffgeo # Adding the meshfile at line 6
scuff-static --Geometry sp2_ld_${LD}.scuffgeo --PolFile sp2_ld_${LD}.pol
echo "${LD},$( tail -n 1 sp2_ld_${LD}.pol)" >> outpol.csv
done

sed -e 's/\s\+/,/g' outpol.csv >> outpolfinal.csv