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
== 彩色输出
以下是一些可启用彩色输出的命令:
```
alias ls='ls --color=auto'
alias ip='ip --color=auto'
alias grep='grep --color=auto'
```
使用`bat`来代替`cat`和`less`,可以无感知实现大多数语言的语法高亮.
```sh
alias cat='bat --style=plain --paging=never'
alias less='bat  --style=plain'
```
不过, `bat`作为`MANPAGER`后会丢失下划线格式:
```sh
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
```
作为对比,查看#link("https://www.reddit.com/r/NixOS/comments/1d174ds/how_can_i_get_colorful_man_pages/")[依靠`less`的彩色化输出]:
```sh
export MANPAGER="less -M -R -i --use-color -Dd+R -Du+B -DHkC -j5"
```
== 实时输出
许多命令提供`-f/--follow`选项,例如:
```sh
sudo tail -f /var/log/xray/access.log
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
== 别名
在`.gitconfig`中设置`git`别名:
```sh
[alias]
    ss = status
    kmt = commit
    chk = checkout
    br = branch
    ps = push
```
随后可以用`git kmt`代替`git commit`.
