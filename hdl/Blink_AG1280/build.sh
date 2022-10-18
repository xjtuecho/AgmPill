#!/bin/sh

echo "setup envirenment variable..."
#export PATH="/d/EE/FPGA/AGM/Supra-2022.06.b0-454528eb-win64-all/bin:$PATH"
. supra_vars.sh

af.exe -B --batch --mode QUARTUS -X "set QUARTUS_SDC true" -X "set FITTING timing_more" -X "set FITTER hybrid" -X "set EFFORT highest" -X "set HOLDX default" -X "set SKEW basic"

