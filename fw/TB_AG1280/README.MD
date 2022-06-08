# 直接使用af.exe烧录固件测试USB-Blaster

## 设置环境变量

```
. supra_vars.sh
```

## 烧录SRAM文件，一般用这个命令测试USB-Blaster烧录速度

```
af.exe -B -X "set blaster_id 0" -X "source -progress 1000 Blink_AG1280_sram.prg"
```

## 烧录hybrid文件，也就是烧录FLASH

```
af.exe -B -X "set blaster_id 0" -X "source -progress 1000 Blink_AG1280_hybrid.prg"
```

这个命令可以展开，展开以后是直接烧录：

```
af.exe -B -X "set blaster_id 0" -X "hybrid_write -device AG1280Q48 Blink_AG1280_hybrid.hyb"
```

## 擦除FLASH

```
af.exe -B -X "set blaster_id 0" -X "set bitgen_usb_speed 3000" -X "exit [catch {erase_flash}]"
```

