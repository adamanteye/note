#import "../note_zh.typ": *
#show: conf.with(
  title: "Linux 使用笔记",
  author: "杨哲涵",
)
#show: rest => columns(2, rest)
= 网络设置
== NetworkManager
/ 自动切换有线,无线连接: 编写dispatcher,详见#link("https://neilzone.co.uk/2023/04/networkmanager-automatically-switch-between-ethernet-and-wi-fi/")[NetworkManager: automatically switch between Ethernet and Wi-Fi].
= 软件包管理
== 构建打包
=== man
#link("https://git.sr.ht/~sircmpwn/scdoc")[scdoc]自定义了与Markdown相近的语法,可以用来生成man手册页:
```sh
scdoc < foot.1.scd > foot.1
gzip foot.1
man ./foot.1.gz
```
