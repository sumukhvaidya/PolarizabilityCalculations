#!/bin/bash

# touch outpol.csv
# for ld in  1.01 1.2 1.4 1.6 1.8 1.99
# do
# for hr in  1.0 1.2 1.4 1.6 1.8 2.0
# do

for ld in  1.6   
do
for hr in  1.6 
do


cp sp3Template.geo sp3_ld_${ld}_hr_${hr}.geo # copy the geo file for specific ld, hr ratio
sed -i "2i\ld=${ld};\\" sp3_ld_${ld}_hr_${hr}.geo # Adding the desired value of ld at line 2
sed -i "3i\hr=${hr};\\" sp3_ld_${ld}_hr_${hr}.geo # Adding the desired value of hr at line 2
gmsh -clscale 0.5 -2 sp3_ld_${ld}_hr_${hr}.geo -format msh2 -2 -o sp3_ld_${ld}_hr_${hr}.msh # make mesh; clscale parameter controls mesh fineness
cp Sp3Template.scuffgeo sp3_ld_${ld}_hr_${hr}.scuffgeo
sed -i "6i\    MESHFILE sp3_ld_${ld}_hr_${hr}.msh\\" sp3_ld_${ld}_hr_${hr}.scuffgeo # Adding the meshfile at line 6
scuff-static --Geometry sp3_ld_${ld}_hr_${hr}.scuffgeo --PolFile sp3_ld_${ld}_hr_${hr}.pol
echo "${ld},${hr},$( tail -n 1 sp3_ld_${ld}_hr_${hr}.pol)" >> outpol.csv

#Calculating volume of the structure
gmsh -clscale .5 -3 sp3_ld_${ld}_hr_${hr}.geo -o sp3_ld_${ld}_hr_${hr}_3d.msh # make 3d mesh instead of 2D
cp sp3TemplateComputeVol.geo sp3_vol_ld_${ld}_hr_${hr}.geo # copy the geo file for specific ld, hr ratio
sed -i "1i\Merge "\"sp3_ld_${ld}_hr_${hr}_3d.msh"\";\\" sp3_vol_ld_${ld}_hr_${hr}.geo # Adding the desired value of ld at line 2 # Write name of meshfile into volume calculation script
gmsh -3 sp3_vol_ld_${ld}_hr_${hr}.geo >> volcalc.txt #Put volume calculation output into a tempfile
#sed -n '14p' volout.csv >> # Read line containing volume calculation
echo "${ld},${hr},$( sed -n '14p' volcalc.txt)" >> outvol.csv # Store volume number
 

# Cleaning up
rm sp3_ld_${ld}_hr_${hr}.geo
rm sp3_ld_${ld}_hr_${hr}.msh
rm sp3_ld_${ld}_hr_${hr}.scuffgeo
rm sp3_ld_${ld}_hr_${hr}.pol
# rm sp3_ld_${ld}_hr_${hr}_3d.msh
rm sp3_vol_ld_${ld}_hr_${hr}.geo
rm sp3_vol_ld_${ld}_hr_${hr}.msh
rm volcalc.txt

done
done

# forld in  1.0 2.0
# do
# #cp sp2Template.geo sp2ld_$ld}.geo # copy the geo file for specificld ratio
# #sed -i "2i\ld=$ld};\\" sp2ld_$ld}.geo # Adding the desired value ofld at line 2
# gmsh -clscale 0.5 -2 sp2ld_$ld}.geo -format msh2 -2 -o sp2ld_$ld}.msh # make mesh; clscale parameter controls mesh fineness
# cp Template.scuffgeo sp2ld_$ld}.scuffgeo
# sed -i "6i\    MESHFILE sp2ld_$ld}.msh\\" sp2ld_$ld}.scuffgeo # Adding the meshfile at line 6
# scuff-static --Geometry sp2ld_$ld}.scuffgeo --PolFile sp2ld_$ld}.pol
# echo "$ld},$( tail -n 1 sp2ld_$ld}.pol)" >> outpol.csv
# done

sed -e 's/\s\+/,/g' outpol.csv >> outpolfinal.csv
sed -e 's/\s\+/,/g' outvol.csv >> outvolfinal.csv
rm outpol.csv
rm outvol.csv