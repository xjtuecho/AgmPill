#!/bin/sh

echo "setup envirenment variable..."
. supra_vars.sh

if [ $# -eq 1 ]; then
	case $1 in
	sram)
	echo "Program SRAM of AG1280Q48"
	af.exe -B -X "set blaster_id 0" -X "source -progress 1000 Blink_AG1280_sram.prg"
	;;
	flash)
	echo "Program FLASH of AG1280Q48"
	af.exe -B -X "set blaster_id 0" -X "source -progress 1000 Blink_AG1280_hybrid.prg"
	;;
	erase)
	echo "Erase FLASH of AG1280Q48"
	af.exe -B -X "set blaster_id 0" -X "set bitgen_usb_speed 3000" -X "exit [catch {erase_flash}]"
	;;
	esac
else
	echo "Usage $0 [sram|flash|erase]"
fi



