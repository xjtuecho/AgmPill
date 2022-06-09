#AgmPillFAQ

## 使用什么开发工具

综合使用QuartusII，各个版本都可以，推荐使用13.0sp1版本，老器件支持比较好。布局布线使用Supra，请详细阅读[该文档](./MANUAL_Supra_6.2.pdf)。

## 使用什么工具下载？

USB-Blaster，与Altera下载工具完全通用，可以使用自己的USB-Blaster，也可以购买我们的USB-Blaster。

## USB-Blaster为何无法连上？

原因很多。

- 检查USB-Blaster连线，2x5插头是否插反了？
- 检查AgmPill是否供电，合格的USB-Blaster不能给目标板供电，那个电源管脚是用来做电平检测的。可以使用我们提供的[测试固件和下载脚本](../fw/TB_AG1280)先测试。
- 市面上有些USB-Blaster不具备AS下载功能，因为下载到FLASH要使用到DATAOUT这个信号，这些USB-Blaster无法烧写AgmPill的FLASH，使用我们的USB-Blaster没有这个问题。

## 芯片是否有可能锁死？

有这种可能性，如果JTAG接口损坏，或者被占用，那么用户看到的结果就是“锁死了”，如果用户设计文件有未约束的管脚，
Supra布局布线的时候有可能会将这些引脚分配到JTAG接口上，导致芯片“锁死”，解决方法参考[这篇文章](https://zhuanlan.zhihu.com/p/520269868)
建议设计中不要保留未约束的管脚。
