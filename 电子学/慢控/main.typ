#import "../../note-zh.typ": *
#show: conf.with(
  title: "慢控学习笔记",
  author: "adamanteye",
)
#show: rest => columns(2, rest)
= 背景
RENO实验的慢控制系统(RENO Slow Control System):
- PMT高压
  - 设定并读取PMT电压值
  - 监测高压异常
- 环境条件
  - 温度
  - 湿度
  - 二氧化碳浓度
  - 氧气浓度
- 远程操作功能

Detector Control System
- digital interface
  - commercial equipment
  - industrial standard
- analog interface
