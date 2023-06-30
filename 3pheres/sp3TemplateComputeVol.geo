
//Merge "sp3_ld_1.01_hr_2.0_3d.msh";
Plugin(NewView).Run;
Plugin(ModifyComponents).Expression0 = "1";
Plugin(ModifyComponents).Run;
Plugin(Integrate).Dimension = 3;
Plugin(Integrate).Run;