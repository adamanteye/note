#import "../note_zh.typ": *
#show: conf.with(
  title: "核仪器原理笔记",
  author: "adamanteye",
)
= 前言
== 核仪器测量的主要物理量
#figure(
  table(
    columns: 4, table.hline(),
    table.header([物理量], [国际标准单位], [常用单位], [换算]), table.hline(),
    [照射量$X=dv(Q,m)$], [$unit("C/kg")$], [$unit("R")$], [$qty("1","R")=qty("2.58e-4","C/kg")$],
    [辐射(吸收)剂量$D=dv(epsilon,m)$], [$unit("Gy")=unit("J/kg")$], [$unit("Rad")$], [$qty("1","Rad")=qty("0.01","Gy")$],
  ),
)
== 常见核仪器
/ 堆用核仪器: 主要用于核电厂的辐射监测,堆芯功率监测,控制和保护.大部分为核级仪器,直接参与反应堆的控制与保护,对反应堆的安全运行起着至关重要的作用.
  / 辐射监测仪表: 主要监测核电站$beta$和$gamma$放射性水平
  / 堆芯测量仪表: 位于反应堆堆芯内,分布于堆芯轴向和径向,用于测 量反应堆堆芯内部中子注量率分布.
  / 堆外核探测器: 位于反应堆堆芯外,用于测量反应堆堆芯泄露中子注 量率大小及其变化速率,通常使用气体探测器.
/ 工业常用核仪器: 利用射线测量物料的物理特性.
  / $X$射线测厚仪: 分为荧光型$X$射线测厚仪和透射型$X$射线测厚仪.$ I=I_0 e^(-mu_x d) $
/ 核测井: 通过测量岩石和介质的核物理参数,按照相关地质模型转换为地质参数,用以研究和探测地质剖面,油气藏等矿产资源,矿井等工程的地球物理方法.
/ 核医学仪器: 其诞生是从应用核医学仪器测量放射线开始的,测量的射线是与人体相关的$gamma$射线.
/ 安检防控仪器: 主要采用特征射线成分检测和成像检测两种方法.
/ 核安全与辐射安全: 正常情况下的常规监测和事故情况下的应急监测.
/ 放射治疗核仪器: 使用放射线治疗肿瘤的一门特殊的医工交叉学科,其基础是放射物理学,放射生物学,还涉及肿瘤学,病理学,医学影像学以及其他临床医学.
/ 核辐射加工设备:
== 核仪器分析方法基础
=== 系统模型及系统分类
==== 几种典型分类
/ 因果系统: 系统在$t_0$时刻的响应只与$t<=0$时刻的输入有关.
/ 非因果系统: 激励作用前,响应就已经出现了.
/ 线性系统: 同时满足均匀性和叠加性.
/ 非线性系统: 不满足线性系统的要求.
/ 稳定系统: 任何有界的输入将引起有界的输出.
/ 时不变系统: 系统的输出响应与输入激励的关系不随输入激励作用于系统的时间起点而改变,即$Psi(e(t-t_0))=r(t-t_0)$.
/ 时变系统: 不满足时不变系统的要求.
