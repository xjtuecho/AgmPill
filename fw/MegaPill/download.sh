#!/bin/sh

echo "setup envirenment variable..."
. supra_vars.sh

if [ $# -eq 1 ]; then
	case $1 in
	sram)
	echo "Program SRAM of AG10KL144"
	af.exe -B -X "set blaster_id 0" -X "source -progress 1000 mc8051_sram.prg"
	;;
	flash)
	echo "Program FLASH of AG10KL144"
	af.exe -B -X "set blaster_id 0" -X "source -progress 1000 mc8051_master.prg"
	;;
	boot)
	echo "Program FPGA bit_stream add MCU firmware to SPI FLASH"
	af.exe -B -X "set blaster_id 0" -X "source -progress 1000 mc8051_boot.prg"
	;;
	esac
else
	echo "Usage $0 [sram|flash|boot]"
fi



