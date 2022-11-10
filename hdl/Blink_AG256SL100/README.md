#使用方法

AG256SL100芯片P2P兼容EPM245T100芯片，本工程需要配合[Blink_EPM240T100](../Blink_EPM240T100)工程使用。请按以下步骤操作：

1. 在Quartus中编译通过[Blink_EPM240T100](../Blink_EPM240T100)工程，做好管脚锁定等各种约束
2. 在Supra中使用菜单`File->Project->Open Project`打开本目录下的`Blink_AG256SL100.proj`文件
3. 打开菜单`Tools->Migrate`，检查各个选项，无误后点击`Next`按钮，此时如果没有在Quartus中编译`Blink_EPM240T100`工程会报错
4. 按照Supra软件的提示，使用Quartus打开**本目录下**的`Blink_EPM240T100.qpf`工程，并运行`af_quartus.tcl`脚本
   这一步会综合工程，并生成`simulation\modelsim`目录下的网表文件供Supra后续布局布线用，因此不用关心Quartus中的器件类型
5. Supra中点击`Next`，点击`Finish`开始布局布线，等待结束即可

整个设计过程由前端的Quartus和后端的Supra共同完成，Quartus用来生成`simulation\modelsim`目录下的网表文件，Supra使用网表文件完成布局布线。


