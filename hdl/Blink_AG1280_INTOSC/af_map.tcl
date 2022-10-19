map -import

if { [info exists DESIGN] && ! [info exists TOP_MODULE] } {
  set TOP_MODULE "$DESIGN"
}
if { ! [info exists DESIGN] } {
  set DESIGN "Blink_AG1280"
}
if { ! [info exists TOP_MODULE] } {
  set TOP_MODULE "Blink_AG1280"
}

set verilogs { .\\Blink_AG1280.v }
if { [ llength $verilogs ] == 0 } {
  set verilogs "./${DESIGN}.v"
}
foreach verilog $verilogs {
  read_verilog "$verilog"
}

  read_verilog -sv -lib +/agm/rodina/cells_sim.v
  read_verilog -sv -lib +/agm/common/m9k_bb.v
  read_verilog -sv -lib +/agm/common/altpll_bb.v
  hierarchy -check -top ${TOP_MODULE}

  synth -run coarse -top ${DESIGN}

  map proc
  opt_expr
  opt_clean
  check
  opt

  wreduce
  alumacc
  share
  opt
  fsm
  opt -fast
  memory -nomap
  opt_clean

  memory_bram -rules +/agm/common/brams.txt
  techmap -map +/agm/common/brams_map.v

  opt -fast -mux_undef -undriven -fine -full
  memory_map
  opt -undriven -fine

  techmap -autoproc -map +/techmap.v -map +/agm/rodina/arith_map.v
  dffsr2dff
  dff2dffe -direct-match \$_DFF_*
  opt -full

  techmap -map +/agm/rodina/cells_map.v
  agm_dffeas
  opt -full

  clean -purge
  setundef -undriven -zero
  abc -markgroups -dff
  opt_expr -mux_undef -undriven -full
  opt_merge
  opt_rmdff
  opt_clean

  abc -lut 4
  clean

  techmap -map +/agm/rodina/cells_map.v
  dffinit -ff dffeas Q INIT
  clean -purge

  hierarchy -check
  check -noinit

  write_verilog -bitblasted -attr2comment -defparam -decimal -renameprefix syn_ ${DESIGN}.vqm
# exec sed -i "/\\\\\\\$paramod/s/\[$=\\]/_/g" ${DESIGN}.vqm

