3D printed model of nucleosome core particle consisting from DNA and 4 histone dimers
========

Contents
--------
src - pdb file and TCL script for VMD used to create the initial STL files.
stl - STL files in binary format scaled up to the printing size of 12x12 cm.
doc_src - documentation source files.
manual.pdf - model description and assembly instructions.


Technical details
--------
The model STL files can be created by running the get_stl.tcl script using VMD (http://www.ks.uiuc.edu/Research/vmd/)
vmd -e get_stl.tcl
The initial files were scaled by a factor of 44.4 using Blender (http://www.blender.org).

