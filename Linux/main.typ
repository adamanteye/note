#import "../note_zh.typ": *
#show: conf.with(
  title: "Linux 使用笔记",
  author: "杨哲涵",
)
#show: rest => columns(2, rest)
= 多用户管理
== 登入用户信息
`who`与`w`命令可以查询当前登入的用户,不过在gentoo prefix下运行不会查到任何用户.
```sh
w
```
```txt
 23:18:07 up  2:43,  1 user,  load average: 2.12, 3.14, 3.20
USER     TTY       LOGIN@   IDLE   JCPU   PCPU  WHAT
adamante tty1      20:34    2:43m  6:51m   ?    footclient
```
```sh
who
```
```txt
adamanteye tty1         2025-01-25 20:34
```
= 网络设置
== NetworkManager
/ 自动切换有线,无线连接: 编写dispatcher,详见#link("https://neilzone.co.uk/2023/04/networkmanager-automatically-switch-between-ethernet-and-wi-fi/")[NetworkManager: automatically switch between Ethernet and Wi-Fi].
= 软件分发
== 手册页
#link("https://git.sr.ht/~sircmpwn/scdoc")[scdoc]自定义了与Markdown相近的语法,可以用来生成man手册页:
```sh
scdoc < foot.1.scd > foot.1
gzip foot.1
man ./foot.1.gz
```
== shell补全
=== fish
`fish_update_completions`可以从系统man pages生成补全.
== Arch Linux 打包
`namcap`可以方便地检查`PKGBUILD`和打好的包当中出现的错误.
= shell技巧
== 实时输出
许多命令提供`-f/--follow`选项,例如:
```sh
tail -f
```
```sh
docker compose logs -f
```
```sh
dmesg -w
```
此外,可以利用`watch`以固定间隔更新输出.
```sh
watch -n 3 "ps aux | grep node"
```
