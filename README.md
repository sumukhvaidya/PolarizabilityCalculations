# PolarizabilityCalculations
Calculate dielectric polarizability of various geometries.

This follows the basic tutorials of opensource tools gmsh and and Scuff-em.

https://gmsh.info/

http://homerreid.github.io/scuff-em-documentation/

The Background:
gmsh is a popular open-source scriptable meshing tool used for simulations. You can use the gui as well,
but I need to run a lot of designs through it, so I used bash scripting.

Scuff-em is another open-source tool for performing various kinds of electromagnetics-related simulations of matter.
I want to calculate the polarizability of specific solid geometries in order to compare experimental results in my lab.

I set up a script to define geometry of two or three intersecting spheres made out of Silica, and vary parameters such as the inter-sphere distance and their radii.
This is then fed to Scuff-em for calculating the polarizability tensor. It can then be plotted and we use it for validating experimental results in levitating and rapidly rotating silica nanodumbbells. 

Basic prerequisites:
1. Working version of BASH.
   WSL works, I have written and tested this in WSL.
2. HDF5
3. libGDSII
4. Scuff-em
5. gmesh

I have uploaded a bash script (written by someone else) that lets you download and install most prerequisites for this.
You mostly need to follow the instructions on how to run it.

![sp3_ld_1 6_hr_1 6_3d](https://github.com/sumukhvaidya/PolarizabilityCalculations/assets/19013392/5d8a1664-6707-40f6-a804-97dad9339b93)



