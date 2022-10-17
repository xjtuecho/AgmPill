set AGM_SUPRA true
set RETRY 0
set DESIGN "Blink"

if { [is_project_open] } {
  export_assignments
}

set is_compatible true
if { $is_compatible } {
  cd E:/echo/git/github/xjtuecho/AgmPill/hdl/Blink_EP4CE10
  qexec "[file join $::quartus(binpath) quartus_eda] $DESIGN --simulation --tool=modelsim --format=verilog"
} else {
  set FITTER_EFFORTS    {"STANDARD FIT" "STANDARD FIT" "FAST FIT" "FAST FIT" "FAST FIT"}
  set SEEDS             [list [expr int(rand()*100)] \
                              [expr int(rand()*100)] \
                              [expr int(rand()*100)] \
                              [expr int(rand()*100)] \
                              [expr int(rand()*100)]]
  set PLACEMENT_EFFORTS [list [expr rand()*5+0.1] \
                              [expr rand()*5+0.1] \
                              [expr rand()*5+0.1] \
                              [expr rand()*5+0.1] \
                              [expr rand()*5+0.1]]
  set    ROUTER_EFFORTS [list [expr rand()*5+0.25] \
                              [expr rand()*5+0.25] \
                              [expr rand()*5+0.25] \
                              [expr rand()*5+0.25] \
                              [expr rand()*5+0.25]]

  qexec "[file join $::quartus(binpath) quartus_sh] -t af_ip.tcl"

  load_package flow
  project_open $DESIGN

  set RETRY [expr $RETRY<[llength $FITTER_EFFORTS]?$RETRY:[llength $FITTER_EFFORTS]]
  for {set nn -1} {$nn < $RETRY} {incr nn} {
    if {$nn >= 0}  {
      set_global_assignment -name FITTER_EFFORT \"[lindex $FITTER_EFFORTS $nn]\"
      set_global_assignment -name SEED [lindex $SEEDS $nn]
      set_global_assignment -name PLACEMENT_EFFORT_MULTIPLIER [lindex $PLACEMENT_EFFORTS $nn]
      set_global_assignment -name    ROUTER_EFFORT_MULTIPLIER [lindex    $ROUTER_EFFORTS $nn]
    }

    set code [catch {execute_flow -compile} msg]
    if { $code == 0 } { break }
  }
}


