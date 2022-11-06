# 固件说明

本固件适用于MegaPill核心板，核心器件为AG10KL144或者AG10KL144H，P2P兼容EP4CE10E22。

- mc8051_boot.prg，FPGA配置文件和MC8051核心固件同时写入FLASH，掉电存储。
- mc8051_master.prg，固件写入FLASH，掉电存储。
- mc8051_sram.prg固件写入SRAM，掉电丢失。

