#import "../../note_zh.typ": *
#show: conf.with(
  title: "Linux 使用笔记",
  author: "adamanteye",
)
#show: rest => columns(2, rest)
= 多用户管理
== 登入用户信息
`who`与`w`命令可以查询当前登入的用户,不过在gentoo prefix下运行不会查到任何用户:
```sh
w
```
```
 23:18:07 up  2:43,  1 user,  load average: 2.12, 3.14, 3.20
USER     TTY       LOGIN@   IDLE   JCPU   PCPU  WHAT
adamante tty1      20:34    2:43m  6:51m   ?    footclient
```
```sh
who
```
```
adamanteye tty1         2025-01-25 20:34
```
= 网络管理
== 地址与路由
访问#link("https://4.ipw.cn")[4.ipw.cn]与#link("https://6.ipw.cn")[6.ipw.cn]可以看到出口IP地址.
== 端口
`ss`命令由`iproute2`提供,功能与`netstat`类似,但信息更全.
== NetworkManager
编写dispatcher可以实现自动切换有线,无线连接,详见#link("https://neilzone.co.uk/2023/04/networkmanager-automatically-switch-between-ethernet-and-wi-fi/")[NetworkManager: automatically switch between Ethernet and Wi-Fi].

`dnsmasq`可以作为`NetworkManager`的本地DNS缓存服务器.且可以为不同的域名选择不同的DNS服务器:
```
# /etc/NetworkManager/dnsmasq.d/server.conf
server=/tsinghua.edu.cn/166.111.8.28
server=/tsinghua.edu.cn/2402:f000:1:801::8:28
server=/cn/101.6.6.6
server=101.101.101.101
server=2001:de4::101
```
```
# /etc/NetworkManager/NetworkManager.conf
[main]
dns=dnsmasq
```
= 软件分发
== 手册页
#link("https://git.sr.ht/~sircmpwn/scdoc")[scdoc]自定义了与Markdown相近的语法,可以用来生成man手册页:
```sh
scdoc < foot.1.scd > foot.1
gzip foot.1
man ./foot.1.gz
```
== Shell补全
=== fish
`fish_update_completions`可以从系统man pages生成补全.
== Arch Linux 打包
`namcap`可以方便地检查`PKGBUILD`和打好的包当中出现的错误.
= Shell技巧
== 彩色输出
以下是一些可启用彩色输出的命令:
```sh
alias ls='ls --color=auto'
alias ip='ip --color=auto'
alias grep='grep --color=auto'
```
使用`bat`来代替`cat`和`less`,可以无感知实现大多数语言的语法高亮:
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
此外,可以利用`watch`以固定间隔更新输出:
```sh
watch -n 3 "ps aux | grep node"
```
== 别名
用`alias`为命令创建别名:
```sh
alias hx=helix
```
对于`git`子命令,可以设置`git`别名:
```
# ~/.gitconfig
[alias]
    ss = status
    kmt = commit
    chk = checkout
    br = branch
    ps = push
```
随后可以用`git kmt`代替`git commit`.
== 定时任务
#link("https://crontab.guru/")[crontab guru]可以在线编辑验证`crontab`语法.
== ssh
配置ssh转发可以在服务器上使用本地的私钥
```
Host foo
  ForwardAgent yes
```

如果端口被阻断,需要配置网络代理以通过代理服务器访问ssh服务器:
```
Host github.com
  Hostname ssh.github.com
  Port 443
  ProxyCommand nc -X connect -x [::1]:10801 %h %p
```
Arch Linux的#link("https://archlinux.org/packages/extra/x86_64/openbsd-netcat/")[openbsd-netcat]提供了`nc`命令.
= 实用程序
== 编辑器
#link("https://github.com/helix-editor/helix")[helix-editor/helix]在绝大多数发行版都已经得到了支持,但是debian尚且没有打包.
== 终端与Shell
`foot`是轻量的wayland终端,支持`img2sixel`.

`fish`相比`zsh`速度更快,且4.0版本已经成功用Rust重写.
== 浏览器
`firefox`与`zotero`都可以配置多个profile,从而实现插件,设置,书签等的隔离:
```sh
firefox --profile "$HOME.mozilla/firefox/crawler/"
```

通过改变浏览器UA,可以绕开相当多的#link("https://type.cyhsu.xyz/2023/02/on-paywalls-01/")[付费墙]. 例如`firefox`在`about:config`选项卡中,设置`general.useragent.override`为:
```
Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)
```
经过测试,这对#link("https://theinitium.com/opinion/20250204-culture-barbie-hsu-and-big-s-taiwan-actress")[端传媒]有效.可以为google bot UA配置与日常使用隔离的profile.
== 文档手册
#link("https://github.com/tealdeer-rs/tealdeer")[tealdeer]提供了相当好的`tldr`体验,可以查看大部分命令的简短文档.
== 输入法
#link("https://aur.archlinux.org/packages/fcitx5-pinyin-sougou-dict-git")[aur/fcitx5-pinyin-sougou-dict-git]提供了搜狗词库.
== 配置管理
GNU `stow`利用软链接集中地管理配置文件,可以配合`git`进行版本控制和备份.

我自己的配置文件管理在#link("https://github.com/adamanteye/dotfiles")[adamanteye/dotfiles].
== 待办管理
#link("https://taskwarrior.org/")[Taskwarrior]功能丰富,更新到3.0版本后改变了远程同步的方式,可以自己托管远程同步服务.

Taskwarrior创建循环任务:
```sh
task recur:2d due:eod add 吃山楂片
```
== 音视频处理
使用`ffmpeg`连接视频:
```sh
ffmpeg -f concat -i filelist.txt -c copy out.mp4
```
其中`filelist.txt`的内容为:
```
file '1.mp4'
file '2.mp4'
```

图形化剪辑软件#link("https://www.shotcut.org/")[shotcut]使用`qt6`,界面现代.
= 包管理
== pacman
列出所有显式安装的包:
```sh
pacman -Qe
```
= 网络服务
== nginx
启用#link("https://en.wikipedia.org/wiki/OCSP_stapling")[OSCP Stapling]:
```
ssl_stapling on;
ssl_stapling_verify on;
```
= 编程
== Bash
使用Bash严格模式,参考#link("http://redsymbol.net/articles/unofficial-bash-strict-mode/")[Bash Strict Mode]:
```sh
set -euo pipefail
```

Bash使用`int64`.
#link("https://askubuntu.com/questions/385528/how-to-increment-a-variable-in-bash")[how-to-increment-a-variable-in-bash]介绍了Bash当中定义整数以及迭代的办法.

`awk`可以进行浮点数计算:
```sh
awk "BEGIN {printf \"%.2f\n\", 1000 / 3600}"
```

`echo`可以输出二进制数据:
```sh
echo -e -n "\x48\x65\x6c\x6c\x6f" > hello.txt
```

`cut`可以用来提取文本中的字段:
```sh
echo "john,21" | cut -d "," -f 1
```
== Rust
#link("https://doc.rust-lang.org/std/macro.dbg.html")[dbg!]宏用于打印到`stderr`.
可以在`cargo test`下使用,也可以调试release构建下出现的问题.
= 容器部署
删除所有未使用镜像(不止dangling):
```sh
docker image prune -a
```
