#import "../../note_zh.typ": *
#show: conf.with(
  title: "硬件知识库",
  author: "adamanteye",
)
= 存储设备
== HDD
== SSD
== SD
安全数码卡,全称Secure Digital Memory Card.
/ 容量标识:
  - SD (0GB-2GB)
  - SDHC (4GB-32GB)
  - SDXC (64GB-2TB)
  - SDUC (2TB-128TB)
/ 总线速度:
  以下列出的速度是半双工场景下的,全双工场景需要折半.
  - UHS-I 104 MB/s
  - UHS-II 312 MB/s
  - UHS-III 624 MB/s
=== microSD
microSD基于由闪迪制造的TransFlash卡格式所创立,是一种小型闪存卡,专为移动设备和嵌入式系统设计,广泛用于扩展存储或作为启动介质.
/ 物理规格: 11mm × 15mm × 1mm
= 接口
== mSATA
针对小型设备设计的SATA接口规范.

受带宽限制被M.2取代.
== M.2
旧称Next Generation Form Factor (NGFF),替代了mSATA, mPCIe标准,是针对内置计算机扩展卡及其相关连接器的规范(简称M.2来自于Mini SATA 2).

M.2物理规格灵活,允许不同的长度和宽度,广泛用在笔记本电脑中.

/ 协议支持:
  - PCIe x4
  - SATA 3.0
  - USB 3.0
= 网络
== SPF+
