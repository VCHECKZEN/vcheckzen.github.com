---
title: "REPO OF M3NOTE"
date: 2018-05-21
draft: false
categories:
- PHONE/M3NOTE
description: Repository of Meizu M3Note
---
<!-- more -->

# Voice of Experience

无法得到 `root 授权`是解锁失败的常见原因；而线刷失败多半归咎于以下情况：

1. 未禁用签名，驱动无法安装
2. USB 接口损坏，无法连机
3. 字库损坏，无法写入数据

# Unlock Bootloader

1. 刷入 [912 daily](https://download.meizu.com/Firmware/Flyme/m3_note/6.7.9.12/cn_daily/20170912000320/3d65e1ba/update.zip) 固件
2. 开启官方系统 `root`
3. 解压解锁文件到 `sdcard` 根目录
4. 安装并打开 [终端模拟器](https://dl.pconline.com.cn/download/365229.html)
5. 输入 `su` 回车，系统将弹出 `root 授权`提示，选择`允许`
6. 复制 `sh /sdcard/run.sh`，粘贴回车，注意 `sh` 后空格
7. 出现形如 `in out` 结果，即为执行成功，否则
8. 进入 `root` 设置，将`终端管理器`权限设为`询问`，重复 `5-7` 步
8. 成功后，搜索群文件 `FBTOOLS（需解压）` 解锁

``` Bash
m3note:/ $ su
enter main
start command :am start -a android.intent.action.MAIN -n com
.android.settings/com.meizu.settings.root.FlymeRootRequestAc
tivity --ei uid 10105 --ei pid 6239 > /dev/null
m3note:/ # sh /sccard/run.sh
2048+0 records in
2048+0 records out
1048576 bytes transferred in 0.065 secs (16131938 bytes/sec)
m3note:/ #
```

# Save the Brick

## Firmware for SP Flash Tool

- [5.1.6.0A - 线刷包（含工具教程）](http://rom.url88.cn/201812283566986/%E9%AD%85%E6%97%8F_%E9%AD%85%E8%93%9DNote3_6.0._Flyme5.1.6.0A%E5%85%AC%E5%BC%80%E7%89%88.SHB_%E5%94%AE%E5%90%8E%E4%BA%B2%E6%B5%8B%E6%95%91%E7%A0%96%E8%A7%A3%E9%94%81%E5%8C%85QQ%E7%BE%A4341578614.zip)

## Specific Driver

- [禁用驱动程序签名 - Windows 7](https://jingyan.baidu.com/article/acf728fd495b9ff8e410a377.html?qq-pf-to=pcqq.temporaryc2c)
- [禁用驱动程序签名 - Windows 8/10](https://jingyan.baidu.com/article/624e74594dbc8d34e8ba5aa6.html)
- [下载专用驱动并安装](https://www.lanzous.com/i3d6v1e)

# TWRP Operations

## Two-Partitions Wipe

一般刷 ROM 前`双清`即可，有问题再`四清` + `格式化 data`，`双清`等同于`恢复出厂`。双清的步骤为：
依次进入`清除`- `高级清除菜单`，选择 `System`、`data` 两个分区后，滑动确认（与`格式化 data` 中的 `data` 不是同一分区）

## Four-Partitions Wipe

`四清`刷 ROM 一般不会有问题。其步骤为：依次进入`清除` - `高级清除菜单`，选择图中四个分区，滑动确认

<img src="https://s2.ax1x.com/2019/04/24/EVCtl4.jpg" width="380px"/>

<!-- <img src="https://wx1.sinaimg.cn/large/bd44a80bgy1g0x3uerk8dj20k00zkmxh.jpg" width="380px"/> -->

## Format Data Partition

`TWRP` 连电脑无法读取`内置存储`或刷 ROM `无限重启`，可尝试`格式化 data` 分区解决，此操作将删除手机中的`所有文件`。其步骤为：

<img src="https://s2.ax1x.com/2019/04/24/EVC8YT.jpg" width="380px"/>

<img src="https://s2.ax1x.com/2019/04/24/EVCN6J.jpg" width="380px"/>

<img src="https://s2.ax1x.com/2019/04/24/EVCdmR.jpg" width="380px"/>

<!-- <img src="https://wx1.sinaimg.cn/large/bd44a80bgy1g0x3uer7ecj20k00zkmxd.jpg" width="380px"/>

<img src="https://wx1.sinaimg.cn/large/bd44a80bgy1g0x3ueqkqtj20k00zkmxm.jpg" width="380px"/>

<img src="https://wx1.sinaimg.cn/large/bd44a80bgy1g0x3uetmt6j20k00zkgm7.jpg" width="380px"/> -->

# Firmwares for Recovery

## Daily Version

- [7.8.7.2 daily](https://download.meizu.com/Firmware/Flyme/m3_note/7.8.7.2/cn_daily/20180702112607/fadacf1d/update.zip)
- [7.8.6.5 daily](https://firmware.meizu.com/Firmware/Flyme/m3_note/7.8.6.5/cn_beta/20180601111905/237d03aa/update.zip)
- [7.8.5.31 daily](http://download.meizu.com/Firmware/Flyme/m3_note/7.8.5.31/cn_daily/20180531095240/aa971e9c/update.zip)
- [7.8.5.18 daily](http://download.meizu.com/Firmware/Flyme/m3_note/7.8.5.18/cn_daily/20180518003416/adfd0b39/update.zip)
- [7.8.5.10 daily](http://download.meizu.com/Firmware/Flyme/m3_note/7.8.5.10/cn_daily/20180510003428/d57c8898/update.zip)
- [7.8.5.8 daily](https://download.meizu.com/Firmware/Flyme/m3_note/7.8.5.8/cn_daily/20180508003411/6e8f8b71/update.zip)
- [7.8.5.4 daily](https://download.meizu.com/Firmware/Flyme/m3_note/7.8.5.4/cn_daily/20180504003427/d0e0b2d4/update.zip)
- [7.8.4.27 daily](https://download.meizu.com/Firmware/Flyme/m3_note/7.8.4.27/cn_daily/20180427003424/01a88c1e/update.zip)
- [7.8.4.22 daily](https://download.meizu.com/Firmware/Flyme/m3_note/7.8.4.22/cn_daily/20180420144410/b3211e37/update.zip)
- [6.8.1.25 daily](https://download.meizu.com/Firmware/Flyme/m3_note/6.8.1.25/cn_daily/20180125001513/19d72a92/update.zip)
- [6.8.1.22 daily](https://download.meizu.com/Firmware/Flyme/m3_note/6.8.1.22/cn_daily/20180122001527/0a2269bd/update.zip)
- [6.8.1.18 daily](https://download.meizu.com/Firmware/Flyme/m3_note/6.8.1.18/cn_daily/20180118001527/1dd8fcc1/update.zip)
- [6.8.1.15 daily](https://download.meizu.com/Firmware/Flyme/m3_note/6.8.1.15/cn_daily/20180115001512/f40cfc98/update.zip)
- [6.8.1.11 daily](https://download.meizu.com/Firmware/Flyme/m3_note/6.8.1.11/cn_daily/20180111001515/59273b71/update.zip)
- [6.8.1.8 daily](https://download.meizu.com/Firmware/Flyme/m3_note/6.8.1.8/cn_daily/20180108001511/c4daa9fd/update.zip)
- [6.8.1.4 daily](https://download.meizu.com/Firmware/Flyme/m3_note/6.8.1.4/cn_daily/20180104001509/aee7ee1e/update.zip)
- [6.8.1.2 daily](https://download.meizu.com/Firmware/Flyme/m3_note/6.8.1.2/cn_daily/20180102001520/fde5f356/update.zip)
- [6.7.12.28 daily](https://download.meizu.com/Firmware/Flyme/m3_note/6.7.12.28/cn_daily/20171228001525/feaab2fa/update.zip)
- [6.7.12.22 daily](http://download.meizu.com/Firmware/Flyme/m3_note/6.7.12.22/cn_daily/20171222001514/2493340e/update.zip)
- [6.7.12.21 daily](http://download.meizu.com/Firmware/Flyme/m3_note/6.7.12.21/cn_daily/20171221001534/0e8e3677/update.zip)
- [6.7.12.18 daily](https://download.meizu.com/Firmware/Flyme/m3_note/6.7.12.18/cn_daily/20171218100954/02f361dc/update.zip)
- [6.7.12.14 daily](https://download.meizu.com/Firmware/Flyme/m3_note/6.7.12.14/cn_daily/20171214001510/b7ca24c6/update.zip)
- [6.7.12.12 daily](https://download.meizu.com/Firmware/Flyme/m3_note/6.7.12.12/cn_daily/20171212001513/05edfbb6/update.zip)
- [6.7.12.11 daily](https://download.meizu.com/Firmware/Flyme/m3_note/6.7.12.11/cn_daily/20171211001512/8b8e9835/update.zip)
- [6.7.12.07 daily](https://download.meizu.com/Firmware/Flyme/m3_note/6.7.12.7/cn_daily/20171207001508/bae517e9/update.zip)
- [6.7.12.04 daily](https://download.meizu.com/Firmware/Flyme/m3_note/6.7.12.4/cn_daily/20171204001509/b99aae52/update.zip)
- [6.7.11.30 daily](https://download.meizu.com/Firmware/Flyme/m3_note/6.7.11.30/cn_daily/20171130100018/cbab2ca7/update.zip)
- [6.7.11.20 daily](https://download.meizu.com/Firmware/Flyme/m3_note/6.7.11.20/cn_daily/20171120125911/137bfe72/update.zip)
- [6.7.11.16 daily](https://download.meizu.com/Firmware/Flyme/m3_note/6.7.11.16/cn_daily/20171116001517/c2ae9b0f/update.zip)
- [6.7.9.29 daily](https://download.meizu.com/Firmware/Flyme/m3_note/6.7.9.29/cndaily/2017092900309/55e547fc/update.zip)
- [6.7.9.21 daily](https://download.meizu.com/Firmware/Flyme/m3_note/6.7.9.21/cn_daily/20170920194452/056f7f2a/update.zip)
- [6.7.9.19 daily](https://download.meizu.com/Firmware/Flyme/m3_note/6.7.9.19/cn_daily/20170919000311/7d962d0e/update.zip)
- [6.7.9.16 daily](https://download.meizu.com/Firmware/Flyme/m3_note/6.7.9.16/cn_daily/20170916000315/29304d50/update.zip)
- [6.7.9.15 daily](https://download.meizu.com/Firmware/Flyme/m3_note/6.7.9.15/cn_daily/20170915000327/c0be9e54/update.zip)
- [6.7.9.14 daily](https://download.meizu.com/Firmware/Flyme/m3_note/6.7.9.14/cn_daily/20170914000320/34853ae8/update.zip)
- [6.7.9.13 daily](https://download.meizu.com/Firmware/Flyme/m3_note/6.7.9.13/cn_daily/20170913000317/f372bb75/update.zip)
- [6.7.9.12 daily](https://download.meizu.com/Firmware/Flyme/m3_note/6.7.9.12/cn_daily/20170912000320/3d65e1ba/update.zip)
- [6.7.9.11 daily](https://download.meizu.com/Firmware/Flyme/m3_note/6.7.9.11/cn_daily/20170911000325/8299a3cd/update.zip)
- [6.7.9.8 daily](https://download.meizu.com/Firmware/Flyme/m3_note/6.7.9.8/cn_daily/20170908000324/d2464b14/update.zip)
- [6.7.9.7 daily](https://download.meizu.com/Firmware/Flyme/m3_note/6.7.9.7/cn_daily/20170907164339/3431c1b6/update.zip)
- [6.7.9.5 daily](https://download.meizu.com/Firmware/Flyme/m3_note/6.7.9.5/cn_daily/20170905114728/8e45e2b0/update.zip)
- [6.7.9.4 daily](https://download.meizu.com/Firmware/Flyme/m3_note/6.7.9.4/cn_daily/20170904000317/2e2cbe8b/update.zip)
- [6.7.9.1 daily](https://download.meizu.com/Firmware/Flyme/m3_note/6.7.9.1/cn_daily/20170901000312/7d867f3f/update.zip)
- [6.7.8.31 daily](https://download.meizu.com/Firmware/Flyme/m3_note/6.7.8.31/cn_daily/20170831000327/0812969b/update.zip)
- [6.7.8.29 daily](https://download.meizu.com/Firmware/Flyme/m3_note/6.7.8.29/cn_daily/20170829000311/5d2161e7/update.zip)
- [6.7.8.28 daily](https://download.meizu.com/Firmware/Flyme/m3_note/6.7.8.28/cn_daily/20170828000314/8b7c2e86/update.zip)
- [6.7.8.25 daily](https://download.meizu.com/Firmware/Flyme/m3_note/6.7.8.25/cn_daily/20170825000312/ee5e7944/update.zip)
- [6.7.8.23 daily](https://download.meizu.com/Firmware/Flyme/m3_note/6.7.8.23/cn_daily/20170823000318/e8697910/update.zip)
- [6.7.8.19 daily](https://download.meizu.com/Firmware/Flyme/m3_note/6.7.8.19/cn_daily/20170819161046/77f1f0f7/update.zip)
- [6.7.8.18 daily](https://download.meizu.com/Firmware/Flyme/m3_note/6.7.8.18/cn_daily/20170818000319/0079f4e2/update.zip)
- [6.7.8.16 daily](https://download.meizu.com/Firmware/Flyme/m3_note/6.7.8.16/cn_daily/20170816165151/2f0672d8/update.zip)
- [6.7.6.23 daily](http://download.meizu.com/Firmware/Flyme/m3_note/6.7.6.23/cn_daily/20170623000942/99612b46/update.zip)
- [6.7.6.22 daily](http://download.meizu.com/Firmware/Flyme/m3_note/6.7.6.22/cn_daily/20170622000924/10c3eab1/update.zip)
- [6.7.4.18 daily](http://download.meizu.com/Firmware/Flyme/m3_note/6.7.4.18/cn_daily/20170418000934/61710a6b/update.zip)
- [6.7.4.7 daily](http://download.meizu.com/Firmware/Flyme/m3_note/6.7.4.7/cn_daily/20170407000931/eaefe558/update.zip)

## Beta Version

- [7.8.6.25 beta](https://firmware.meizu.com/Firmware/Flyme/m3_note/7.8.6.25/cn_beta/20180623011431/929e1be2/update.zip)
- [7.8.6.5 beta](https://firmware.meizu.com/Firmware/Flyme/m3_note/7.8.6.5/cn_beta/20180601111905/237d03aa/update.zip)
- [7.8.5.22 beta](https://firmware.meizu.com/Firmware/Flyme/m3_note/7.8.5.22/cn_beta/20180521141857/54f06db8/update.zip)
- [7.8.5.8 beta](https://firmware.meizu.com/Firmware/Flyme/m3_note/7.8.5.8/cn_beta/20180507205605/f38d0b49/update.zip)
- [7.8.4.22 beta](https://firmware.meizu.com/Firmware/Flyme/m3_note/7.8.4.22/cn_beta/20180420144440/61af655c/update.zip)
- [6.8.1.16 beta](https://firmware.meizu.com/Firmware/Flyme/m3_note/6.8.1.16/cn_beta/20180114221710/f00a42b4/update.zip)
- [6.7.12.26 beta](https://firmware.meizu.com/Firmware/Flyme/m3_note/6.7.12.26/cn_beta/20171223190450/0c9b616b/update.zip)
- [6.7.12.20 beta](https://firmware.meizu.com/Firmware/Flyme/m3_note/6.7.12.20/cn_beta/20171219111607/38065d0c/update.zip)
- [6.7.12.12 beta](https://firmware.meizu.com/Firmware/Flyme/m3_note/6.7.12.12/cn_beta/20171206202938/cf5ee827/update.zip)
- [6.7.11.28 beta `公开稳定`](https://firmware.meizu.com/Firmware/Flyme/m3_note/6.7.11.28/cn_beta/20171129161124/8271441d/update.zip)
- [6.7.11.28 beta `灰度测试`](https://firmware.meizu.com/Firmware/Flyme/m3_note/6.7.11.28/cn_beta/20171127211704/0ddceadf/update.zip)
- [6.7.10.31 beta](https://download.meizu.com/Firmware/Flyme/m3_note/6.7.10.31/cn_beta/20171028012150/6af31268/update.zip)
- [6.7.6.13 beta](http://firmware.meizu.com/Firmware/Flyme/m3_note/6.7.6.13/cn_beta/20170609191719/cffd9391/update.zip)

## Stable Version

- [6.3.0.2A  `公开稳定`](https://firmware.meizu.com/Firmware/Flyme/m3_note/6.3.0.2/cn/20180308164831/c03de58a/update.zip)
- [6.3.0.2A  `灰度测试`](https://firmware.meizu.com/Firmware/Flyme/m3_note/6.3.0.2/cn/20180305182149/0c877513/update.zip)
- [6.3.0.0A `新春稳定`](https://download.meizu.com/Firmware/Flyme/m3_note/6.3.0.0/cn/20180129000016/cf3b29b5/update.zip)
- [6.3.0.0A `灰度测试`](https://download.meizu.com/Firmware/Flyme/m3_note/6.3.0.0//20180124104825/d7f8410a/update.zip)
- [6.2.5.0A](https://firmware.meizu.com/Firmware/Flyme/m3_note/6.2.5.0/cn/20171225125630/e85d40d7/update.zip)
- [6.2.0.2A](https://firmware.meizu.com/Firmware/Flyme/m3_note/6.2.0.2/cn/20171113100726/5b7952b3/update.zip)
- [6.2.0.1A](https://firmware.meizu.com/Firmware/Flyme/m3_note/6.2.0.1/cn/20170927175647/a2656e51/update.zip)
- [6.2.0.0A](https://firmware.meizu.com/Firmware/Flyme/m3_note/6.2.0.0/cn/20170922063046/a2e0d8f4/update.zip)
- [6.1.0.0A](http://firmware.meizu.com/Firmware/Flyme/m3_note/6.1.0.0/cn/20170527183502/7a4d3142/update.zip)
- [6.0.2.0A](http://firmware.meizu.com/Firmware/Flyme/m3_note/6.0.2.0/cn/20170306111623/9d3c2690/update.zip)
- [6.0.1.1A](http://firmware.meizu.com/Firmware/Flyme/m3_note/6.0.1.1/cn/20170118201935/295b773a/update.zip)
- [6.0.1.0A](http://firmware.meizu.com/Firmware/Flyme/m3_note/6.0.1.0/cn/20170116161312/d1081643/update.zip)
- [6.0.0.0A](http://firmware.meizu.com/Firmware/Flyme/m3_note/6.0.0.0/cn/20161229210920/613cdc59/update.zip)
- [5.1.11.1A](http://firmware.meizu.com/Firmware/Flyme/m3_note/5.1.11.1A/cn_stable/20161115023254/89a1b506/update.zip)
- [5.1.11.0A](http://firmware.meizu.com/Firmware/Flyme/m3_note/5.1.11.0A/cn_stable/20161028014627/bf5fb6b2/update.zip)
- [5.1.6.2A](http://download.meizu.com/Firmware/Flyme/m3_note/5.1.6.2/cn/20161108050231/c5700c95/update.zip)
- [5.1.6.0A](http://download.meizu.com/Firmware/Flyme/m3_note/5.1.6.0/cn/20160818042254/9946630e/update.zip)
- [5.1.3.6A](http://firmware.meizu.com/Firmware/Flyme/m3_note/5.1.3.6/cn/20160728152814/aa382bc4/update.zip)
- [5.1.3.5A](http://download.meizu.com/Firmware/Flyme/m3_note/5.1.3.5/cn/20160718172442/25395a61/update.zip)
- [5.1.3.4A](http://download.meizu.com/Firmware/Flyme/m3_note/5.1.3.4/cn/20160618025849/99fa9fef/update.zip)
- [5.1.3.3A](https://pan.baidu.com/s/1kWhs1an)
- [5.1.3.2A](http://download.meizu.com/Firmware/Flyme/m3_note/5.1.3.2/cn/20160513233644/7033d108/update.zip)
- [5.1.3.1A](http://download.meizu.com/Firmware/Flyme/m3_note/5.1.3.1/cn/20160422222402/14e71829/update.zip)
- [5.1.3.0A](http://download.meizu.com/Firmware/Flyme/m3_note/5.1.3.0/cn/20160331214607/467d5bee/update.zip)

## International Version

- [6.3.0.0G](http://dl-res.flymeos.com/Firmware/Flyme/m3_note/6.3.0.0/intl/20180412034817/73829ed3/update.zip)
- [6.2.0.1G](http://www.flymeitalia.it/risorse/Firmware/6.2.0.1G/M3Note/update.zip)
- [6.2.0.0G](http://dl-res.flymeos.com/Firmware/Flyme/m3_note/6.2.0.0/intl/20171222100018/57006aa4/update.zip)
- [6.1.0.0G](http://dl-res.flymeos.com/Firmware/Flyme/m3l_note/6.1.0.0/intl/20170620111044/7caccc20/update.zip)
- [5.1.12.0G](http://dl-res.flymeos.com/Firmware/Flyme/m3l_note/5.1.12.0/intl/20161220171238/4b4cb853/update.zip)
- [5.1.3.4G](http://dl-res.flymeos.com/Firmware/Flyme/m3l_note/5.1.3.4/intl/20160831100411/12eedbef/update.zip)