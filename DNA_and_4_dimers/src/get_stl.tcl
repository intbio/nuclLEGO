
proc lexpr {a op b} {
     set res {}
     set la [llength $a]
     set lb [llength $b]
     if {$la == 1 && $lb == 1} {
         set res [expr $a $op $b]
     } elseif {$la==1} {
         foreach j $b {lappend res [lexpr $a $op $j]}
     } elseif {$lb==1} {
         foreach i $a {lappend res [lexpr $i $op $b]}
     } elseif {$la == $lb} {
         foreach i $a j $b {lappend res [lexpr $i $op $j]}
     } else {error "list length mismatch $la/$lb"}
     set res
 }

source input_param.tcl




###


 mol load pdb only_nucl_aligned.pdb
 mol ssrecalc top

set molid [ molinfo top ]
 
display rendermode GLSL
mol delrep 0 top

set a [atomselect top nucleic]
$a set radius [lexpr [$a get radius] * 0.85]


set b [atomselect top protein]
$b set radius [lexpr [$b get radius] * 0.96]

#  H3 H3 Dimer representation
mol representation MSMS 0.8 5.5
mol color Segname
mol selection {segname CHA and resid > 44}
mol material AOShiny
mol addrep top
mol selupdate 0 top 0
mol colupdate 0 top 0

mol representation MSMS 0.8 5.5
mol color Segname
mol selection {segname CHE and resid > 44}
mol material AOShiny
mol addrep top
mol selupdate 0 top 0
mol colupdate 0 top 0

# H4 H4 Dimer representation
mol representation MSMS 0.8 5.5
mol color Segname
mol selection {segname CHB and resid > 23}
mol material AOShiny
mol addrep top
mol selupdate 1 top 0
mol colupdate 1 top 0

mol representation MSMS 0.8 5.5
mol color Segname
mol selection {segname CHF and resid > 23}
mol material AOShiny
mol addrep top
mol selupdate 1 top 0
mol colupdate 1 top 0

# H2a H2a Dimer representation
mol representation MSMS 0.8 5.5
mol color Segname
mol selection {segname CHC and resid > 14}
mol material AOShiny
mol addrep top
mol selupdate 2 top 0
mol colupdate 2 top 0


mol representation MSMS 0.8 5.5
mol color Segname
mol selection {segname CHG and resid > 14}
mol material AOShiny
mol addrep top
mol selupdate 2 top 0
mol colupdate 2 top 0

# H2b H2b Dimer representation
mol representation MSMS 0.8 5.5
mol color Segname
mol selection {segname CHD and resid > 29}
mol material AOShiny
mol addrep top
mol selupdate 3 top 0
mol colupdate 3 top 0

mol representation MSMS 0.8 5.5
mol color Segname
mol selection {segname CHH and resid > 29}
mol material AOShiny
mol addrep top
mol selupdate 3 top 0
mol colupdate 3 top 0

# Dna representation
mol representation MSMS 1.3 5.5
mol color ColorID 6
mol selection {nucleic}
mol material AOEdgy
mol addrep top
mol selupdate 4 top 0
mol colupdate 4 top 0

#Key argininges
# mol representation VDW
# mol color Orange
# mol selection {(segname CHA CHE and resid 83 63 49) or (segname CHB CHF and resid 45) or (segname CHC CHG and resid 42 77) or (segname CHD CHH and resid 30)}
# mol material AOShiny
# mol addrep top
# mol selupdate 7 top 0
# mol colupdate 7 top 0


color Segname CHA blue3
color Segname CHB green
color Segname CHC yellow2
color Segname CHD red3
color Segname CHE blue3
color Segname CHF green
color Segname CHG yellow2
color Segname CHH red3

color Highlight Nonback 6
color Highlight Nucback 2
color Display Background white
color scale method RWB
color change rgb  0 0.1 0.2 0.7 ;# blue
color change rgb  1 0.7 0.2 0.1 ;# red
color change rgb  3 0.7 0.4 0.0 ;# orange
color change rgb  4 0.8 0.7 0.1 ;# yellow
color change rgb  7 0.1 0.7 0.2 ;# green
color change rgb 10 0.1 0.7 0.8 ;# cyan
color change rgb 11 0.6 0.1 0.6 ;# purple
color change rgb 23 0.550000011920929 0.7099999785423279 0.9800000190734863


# #prepare scene
 scale by $scale
 translate by $transx $transy $transz
 
 display update ui

axes location off

# render STL full_nucl.stl

mol showrep top 0 off
mol showrep top 1 off
mol showrep top 2 off
mol showrep top 3 off
mol showrep top 4 off
mol showrep top 5 off
mol showrep top 6 off
mol showrep top 7 off
mol showrep top 8 off

mol showrep top 0 on
mol showrep top 2 on
render STL H3_H4_1.stl
mol showrep top 2 off
render STL H3_1.stl
mol showrep top 2 on
mol showrep top 0 off
render STL H4_1.stl



mol showrep top 0 off
mol showrep top 2 off
mol showrep top 1 on
mol showrep top 3 on
render STL H3_H4_2.stl


mol showrep top 1 off
mol showrep top 3 off

mol showrep top 4 on
mol showrep top 6 on
render STL H2A_H2B_1.stl

mol showrep top 4 off
mol showrep top 6 off
mol showrep top 5 on
mol showrep top 7 on
render STL H2A_H2B_2.stl

mol showrep top 5 off
mol showrep top 7 off
mol showrep top 8 on
render STL Dna.stl

mol showrep top 8 off

mol showrep top 0 on
mol showrep top 2 on
mol showrep top 1 on
mol showrep top 3 on
mol showrep top 4 on
mol showrep top 5 on
mol showrep top 6 on
mol showrep top 7 on
# render STL octamer.stl

