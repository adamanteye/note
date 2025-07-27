#import "../../../note_zh.typ": *
#show: conf.with(
  title: "Linux笔记",
  author: "adamanteye",
)
= 发行版选择
以下评述基于我或朋友们的看法,其中我只尝试过`Arch`, `Gentoo`, `Debian`三种发行版.
== Arch
兜兜转转最喜欢的发行版,因为`pacman`好用,软件包丰富,文档最完善,脚本`PKGBUILD`很好写, AUR对用户很友好.

缺点是打包比较粗,这方面Debian, OpenSUSE或许算是打包细致的范例.
== Alpine
目前只在`docker`中用过,听说Alpine Edge也可以被拿来当桌面发行版.
== eweOS
跟Arch的哲学很像,但是`musl`,现在还处于开发中.
== Debian
自己的服务器上都在跑Debian,因为它自由稳定,不喜欢Ubuntu正因为其是大公司的推广.
== Gentoo
拿来在服务器上跑也会比较合适,不过源码分发比较折磨人.

`emerge`以及一众工具好细碎,另外好慢.
== Fedora
软件包更新甚至比Gentoo激进.
== OpenSUSE
被称为最适合`KDE`的发行版,大概都是德国人开发的吧.
== Talos
为Kubernetes准备的发行版.
= 多用户管理
== 权限和密码
在非TTY环境中修改密码:
```sh
echo "root:debian" | chpasswd
```
== SSH
#link("https://github.com/jbeverly/pam_ssh_agent_auth")[pam_ssh_agent_auth]允许登入的用户通过ssh-agent获得权限,在服务器上的配置参考`pam_ssh_agent_auth(8)`.
例如:
```
# /etc/pam.d/sudo
auth sufficient pam_ssh_agent_auth.so file=~/.ssh/authorized_keys
# /etc/sudoers:
Defaults:%sudo env_keep += "SSH_AUTH_SOCK"
```
由于`SSH_AUTH_SOCK`被保留,鉴权会通过`pam-ssh-agent-auth`进行.但还是需要设置密码,否则可物理接触到机器的人能够直接通过用户名登录.

此外,`.ssh`文件夹的权限应为755,`.ssh/authorized_keys`的权限应为644.
== sudo
用`env_keep`可以保留一些有用的环境变量:
```
# /etc/sudoers

# 保留编辑器设置
Defaults:%wheel env_keep += "SUDO_EDITOR EDITOR VISUAL"
# 可以用 sudo 执行 rsync, scp
Defaults:%wheel env_keep += "SSH_AGENT_PID SSH_AUTH_SOCK"
# 保留 HTTPS 与 HTTP 代理
Defaults:%wheel env_keep += "all_proxy"
```
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
查看最近登入的用户:
```sh
last
```
= 网络管理
== 地址与路由
访问#link("https://4.ipw.cn")[4.ipw.cn]与#link("https://6.ipw.cn")[6.ipw.cn]可以看到出口IP地址.可以利用它配合`ddclient`更新DNS记录,例如配置`/etc/ddclient.conf`如下:
```
# /etc/ddclient.conf

daemon=360
protocol=cloudflare
usev4=cmdv4, cmdv4=get-ipv4
usev6=cmdv6, cmdv6=get-ipv6
login=token
password='your-api-token'
zone=adamanteye.cc
heloise.adamanteye.cc
```
其中的`/usr/local/bin/get-ipv4`命令为:
```
#!/bin/bash
curl 4.ipw.cn
```
快速`ping`所有主机:
```sh
nmap -sn 192.168.1.0/24
```
或者
```sh
for i in {1..254}; do sudo ping -c 1 -W 1 192.168.1.$i | grep "bytes from" && echo "192.168.1.$i is alive"; done
```
== 端口
查看当前监听的端口以及进程:
```sh
sudo netstat -tunlp
```
`ss`命令由`iproute2`提供,功能与`netstat`类似,但信息更全.
```sh
ss -tlpn
```
== ifupdown
这是Debian上的传统方法.例如启用所有以`auto`定义的接口:
```sh
sudo ifup -a
```

配置DHCP:
```
# /etc/network/interfaces
auto eno1
iface eno1 inet dhcp
iface eno1 inet6 dhcp
```
注意变更配置前,首先应当`ifdown`,因为`ifup`与`ifdown`始终根据当前的`interfaces`文件使用`ip`命令配置网络.
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
== 设备管理
`rfkill`可以启用/禁用WIFI,蓝牙在内的无线设备.例如:
```sh
rfkill # list wireless devices
rfkill unblock bluetooth
```
== 网络攻击
=== namp
```sh
nmap -T4 -A -v -Pn 192.168.0.1
#最常用的一种扫描
```
- `-T4`: 设置时序,越高扫描越快
- `-A`: 启用操作系统检测,版本检测,脚本扫描和跟踪路由
- `-v`: 增加详细级别(使用`-vv`或更高级别以获得更好的效果)
- `-Pn`: 无ping扫描
=== 密码爆破
Kail提供了`rockyou.txt`,是常见密码的集合.

针对开启ssh密码登陆的主机,可以用`hydra`:
```sh
hydra -l root -s 22 -P passwords.txt 154.12.60.17 ssh
```
=== DDoS
==== 传输层
耗尽目标服务器的网络带宽或连接资源.

/ 常见形式:
- SYN Flood
- UDP Flood
- ICMP Flood
==== 应用层
模拟合法用户请求,耗尽服务器的CPU,内存等资源.

/ 常见形式:
- HTTP FLood
- Slowloris

防护需要WAF.
== 网络测绘
=== 代理
代理使用者会有相当多可供探测的#link("https://proxy.incolumitas.com/proxy_detect.html")[特征]#footnote[参见#link("https://github.com/net4people/bbs/issues/445")[Avoiding Live `VPN/Proxy Detection` · Issue #445 · net4people/bbs]].
=== 参考
- #link("https://aajax.top/2025/04/27/ToMapNetwork/")[进行网络测绘的方法与挑战 | Ajax's Blog].
== 证书
#link("https://github.com/acmesh-official/acme.sh")[acmesh-official/acme.sh]可以自动签发与更新证书.

将证书安装到指定位置:
```sh
./acme.sh --install-cert -d 'adamanteye.cc' \
  --fullchain-file /srv/cert/all.adamanteye.cc.fullchain \
  --key-file /srv/cert/all.adamanteye.cc.key
```
= 启动引导
== GRUB
从grub命令行中引导系统.

`/`分区为btrfs的例子:
```sh
grub> ls
grub> set root=(hd0,gpt2)
grub> linux /@rootfs/boot/vmlinuz-6.1.0-30-amd64 root=/dev/sda2 rw rootflags=subvol=@rootfs
grub> initrd /@rootfs/boot/initrd.img-6.1.0-30-amd64
grub> boot
```
`/`分区为ext4的例子:
```sh
grub> ls
grub> set root=(hd0,gpt2)
grub> linux /boot/vmlinuz-6.1.0-30-amd64 root=/dev/sda2
grub> initrd /boot/initrd.img-6.1.0-30-amd64
grub> boot
```
== systemd-boot
```
# /boot/loader/loader.conf

default arch.conf
timeout 4
console-mode max
editor no
```
```
# /boot/loader/entries/arch.conf

title Arch
linux /vmlinuz-linux
initrd /intel-ucode.img
initrd /initramfs-linux.img
options root=UUID=1a514b60-fdd7-4b19-a53b-3ce10b157faa rw
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
`namcap`可以方便地检查`PKGBUILD`和打好的包当中出现的错误,以及所依赖的动态库.
== Debian 打包
参考:
- #link("https://www.debian.org/doc/debian-policy/policy.pdf")[Debian Policy Manual]
- #link("https://www.debian.org/doc/manuals/debmake-doc/debmake-doc.zh-cn.pdf")[Debian维护者指南]
- #link("https://www.debian.org/doc/manuals/packaging-tutorial/packaging-tutorial.zh_CN.pdf")[Debian打包教程]

Debian打包体系随时间演化,在#link("https://trends.debian.net/#build-systems")[Debian Trends]可以看到不同源码格式,打包工具的使用比例.

我构建了一个debian的docker环境,#link("https://github.com/adamanteye/images/tree/debian-builder")[adamanteye/images/debian-builder],用来完成在干净系统下的打包.

从上游开始的打包流程:
```sh
tar xaf example-0.1.0.tar.gz
cd example-0.1.0
debmake -b':sh' -x1   # 选一个模板
vim debian/control    # 以及其他文件
rm -rf debian/patches # 以及其他用不到的文件
debuild
```

依托源码包做出修改:
```sh
apt source sqlite3
patch debian/rules < ~/enable-icu.patch
debuild
```
== 证书
在Arch的打包中,需要为`license`变量指定对应的SPDX标识符#footnote[#link("https://spdx.org/licenses/")[SPDX License List | Software Package Data Exchange (SPDX)]],常见许可证的文本存储于`/usr/share/licenses/spdx/`.
= 规范
== 时间日期
查看`strftime(3)`了解可用的格式化选项,例如`2025 03 05`对应`%Y %m %d`.
== 文件编码
在Windows上保存的文件在Linux中打开以及用版本管理系统进行管理时,存在兼容性问题.
=== UTF-8-BOM
BOM(byte-order mark)是用来指示编码方案以及端序的,常见的是`EF BB BF`,表示接下来的内容以UTF-8编码.

然而例如在PHP中,由于`<?php`(这是文件开头)之前不得有其他字符,如果有BOM,可能会造成PHP在设置headers之前就返回内容.

Windows下保存的`h5`文件在MacOS或Linux下打开也有可能出现列名包含非可显示字符的错误,以至于明明索引了正确的列名但无法取到相应的数组,这也是因为BOM引起的.
=== CRLF
打字机时代,换行包含两个动作,移到第一列,移到下一行, Windows遵循了这种惯例.

在Unix中换行只是`\n`,因此在版本控制系统中需要注意两者的转换,可以在Git中设置遵循其中一种格式:
```
# .gitconfig
[core]
	eol = lf
```
在`git checkout`等场景下,文本文件的换行符会被设置为`\n`.
== readline 键位
- `Ctrl A`跳到行首
- `Ctrl E`跳到行尾
- `Ctrl U`删除光标位置到行首的所有内容
- `Ctrl K`删除光标位置到行尾的所有内容
- `Ctrl W`删除光标位置前一个单词
- `Ctrl Y`粘贴最后一次删除的内容
- `Ctrl L`清屏
- `Ctrl F`向前移动一个字符
- `Ctrl B`向后移动一个字符
- `Alt F`向前移动一个单词
- `Alt B`向后移动一个单词
- `Ctrl R`启动反向搜索历史命令
- `Ctrl S`启动正向搜索历史命令
- `Ctrl G`取消搜索
常见shell和emacs都支持这些键位.
= 系统技巧
== 彩色输出
以下是一些可启用彩色输出的命令:
```sh
alias ls='ls --color=auto'
alias ip='ip --color=auto'
alias grep='grep --color=auto'
```
使用#link("https://github.com/lsd-rs/lsd")[lsd]代替`ls`,可以提供彩色输出.

此外`lsd`可以代替`tree`.
```sh
lsd --tree
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
== SSH
配置SSH转发,可以在服务器上使用本地的私钥:
```
Host foo
  ForwardAgent yes
```

如果端口被阻断,需要配置网络代理以通过代理服务器访问SSH服务器:
```
Host github.com
  Hostname ssh.github.com
  Port 443
  ProxyCommand nc -X connect -x [::1]:10801 %h %p
```
Arch Linux的#link("https://archlinux.org/packages/extra/x86_64/openbsd-netcat/")[openbsd-netcat]提供了`nc`命令.

多跳连接:
```sh
ssh -J kaiser elisabeth -D 1080 -N
```
首先跳到kaiser,其次到elisabeth.
== 临时文件
创建临时文件或临时文件夹:
```sh
mktemp example.XXXXXXXX
```
== 文本处理
`grep`, `sed`, `awk`是最常使用的文本处理程序.

```sh
cat /usr/share/fortune/chinese | sed 's/\x1B\[[0-9:;<=>?]*[!-/\x20]*[@-~]//g' > chinese-without-color
# 删去所有 ANSI CSI
```
= 实用程序
== Git
=== 打包
```sh
git archive -o foo.tar.gz HEAD
```
=== 通过邮件提交补丁
参考#link("https://peter.eisentraut.org/blog/2023/05/09/how-to-submit-a-patch-by-email-2023-edition")[How to submit a patch by email | Peter Eisentraut],首先撰写commit.之后使用
```sh
git format-path [ <since> | <revision-range> ]
```
生成补丁.
=== Hooks
/ `commit-msg`: 在提交信息编辑完成后,最终提交前执行.可以验证或修改最终的提交信息.
/ `prepare-commit-msg`: 在生成提交信息后,打开编辑器前执行.在提交时增加额外信息.
== 桌面环境
之前用`hyprland`,发现#link("https://github.com/hyprwm/Hyprland/issues/8850")[依赖太重],于是切换到`niri`.此外`niri`的标签页交互很舒适.

`niri`没有内置的Xwayland,文档推荐使用`xwayland-satellite`.

列出所有的显示器:
```sh
niri msg outputs
```

此外之前也用过很久的`KDE`,同样因为太笨重而切换了平铺式桌面管理器.
== 编辑器
#link("https://github.com/helix-editor/helix")[helix-editor/helix]在绝大多数发行版都已经得到了支持,但是debian尚且没有打包.
== 终端与Shell
`foot`是轻量的Wayland终端,支持`img2sixel`.

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
经过测试,这对#link("https://theinitium.com/opinion/20250204-culture-barbie-hsu-and-big-s-taiwan-actress")[端传媒]有效.可以为google bot UA#footnote[查看其他浏览器UA: #link("https://explore.whatismybrowser.com/useragents/explore/")[List of User Agents]]配置与日常使用隔离的profile.

查看当前的浏览器指纹: #link("https://www.whatismybrowser.com/")[What browser?]
== 文件管理器
#link("https://github.com/sxyazi/yazi")[sxyazi/yazi]是使用Rust编写的命令行文件管理器.
== 文档手册
#link("https://github.com/tealdeer-rs/tealdeer")[tealdeer]提供了相当好的`tldr`体验,可以查看大部分命令的简短文档.
== 归档与压缩
=== tar
```sh
tar cvzf archive.tar.gz <sources>
tar xvf archive.tar.gz
```
== 输入法
#link("https://aur.archlinux.org/packages/fcitx5-pinyin-sougou-dict-git")[aur/fcitx5-pinyin-sougou-dict-git]提供了搜狗词库.
== 邮件客户端
`thunderbird`几乎开箱即用.不过一些高级用户会选择#link("https://neomutt.org/guide/index")[neomutt]/`mutt`,两者配置基本兼容.

对于`mutt`,既可以用自带的IMAP协议,也可以使用外部收取程序,如#link("https://wiki.archlinux.org/title/OfflineIMAP")[offlineimap]以及#link("https://wiki.archlinux.org/title/Msmtp")[msmtp].

参考配置教程:
- #link("https://fancyseeker.github.io/2015/08/19/mutt/")[Mutt: 阅读邮件列表 | FancySeeker]
- #link("https://mirrors.tuna.tsinghua.edu.cn/tuna/tunight/2020-11-21-mutt/slides.pdf")[Mutt配置: 一种实践的部署方式]
- #link("https://www.offlineimap.org/doc/conf_examples.html")[OfflineIMAP examples]
== tmux
- 左右布局: `Ctrl B, %`
- 向左切换布局: `Ctrl B, 方向左`
== 桌面通知
`libnotify`提供了以下命令:
```sh
notify-send -t 5000 "Your Title or App Name" "a message that will be displayed for 5000ms"
```
如果还想播放声音,可以使用`libpulse`提供的`paplay`:
```sh
paplay /usr/share/sounds/freedesktop/stereo/message.oga
```
注意音频由`sound-theme-freedesktop`提供.
== RSS订阅
如果熟悉`mutt`,对#link("https://wiki.archlinux.org/title/Newsboat")[newsboat]应当同样很有好感.
== 排版软件
#link("https://github.com/typst/typst")[typst]可以替代LaTeX.
=== 字体
OpenType字体有一系列feature可以启用,参考#link("https://typst.app/docs/reference/text/text/#parameters-features")[Text Function - Typst Documentation]以及#link("https://learn.microsoft.com/en-us/typography/opentype/spec/featurelist")[Registered features (OpenType 1.9.1) - Typography | Microsoft Learn].
例如:
```typ
#let smcp(it) = {
  set text(features: ("smcp",))
  it
}
```
/ woff2: #link("https://www.w3.org/TR/WOFF2/")[WOFF File Format 2.0]
=== 配色
- #link("https://catppuccin.com/palette")[猫布奇诺调色盘]
- #link("https://oklch.com/")[OKLCH Color Picker & Converter]
=== 排版原则
- #link("https://practicaltypography.com/")[Butterick's Practical Typography]
== 配置管理
GNU `stow`利用软链接集中地管理配置文件,可以配合`git`进行版本控制和备份.

我自己的配置文件管理在#link("https://github.com/adamanteye/dotfiles")[adamanteye/dotfiles].
== 待办管理
我使用#link("https://taskwarrior.org/")[TaskWarrior]以及其TUI界面#link("https://github.com/kdheepak/taskwarrior-tui")[taskwarrior-tui].

TaskWarrior更新到3.0版本后改变了远程同步的方式,可以自己托管远程同步服务.

TaskWarrior创建循环任务:
```sh
task recur:2d due:eod add 吃山楂片
```
== 密码管理
#link("https://www.passwordstore.org/")[pass]基于`gpg`,在本地管理密码,并且支持用`git`进行版本控制,可以一同配置GitHub远程仓库来备份.
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
== PDF
`poppler`包提供了`pdfseparate`以及`pdfunite`两个包,可拆分合并指定页范围的PDF文件.
== 远程文件系统
#link("https://wiki.archlinux.org/title/SSHFS")[sshfs]可以通过`ssh`连接挂载远程文件系统.
== 逆向
Hash推荐我用`binaryninja-free`.
= 资源监控
== 硬盘
完整磁盘诊断:
```sh
sudo smartctl -x /dev/sda
```
== 文件系统
`ncdu`是采用`ncurses`界面的磁盘占用统计工具,比`du`命令更好用,带有彩色模式:
```
# /etc/ncdu.conf
--color dark-bg
```

使用`fio`测试顺序读写,随机读写等情景下的性能:
```sh
fio -filename=/home/adamanteye/test -direct=1 -iodepth 1 -thread -rw=randrw -bs=4k -size=2G -numjobs=5 -runtime=10 -group_reporting -name=mytest | tee randrw.log
```
== CPU
```sh
cat /proc/cpuinfo # 或者
lscpu
```
== 温度监控
读取硬盘温度,使用`smartctl`:
```sh
sudo smartctl --all /dev/sda
```

读取CPU温度,使用`lm-sensors`:
```sh
sudo sensors-detect  # 初次配置 lm-sensors
sensors              # 按照配置读取温度
```
== 风扇控制
参考#link("https://gist.github.com/jhatler/855abc7fb8663bcc2c97fec77b10ea03")[jhatler/ipmi-fanctrl-dell_r630.sh]:

```sh
sudo ipmitool raw 0x30 0x30 0x01 0x00       # enable manual fan control
sudo ipmitool raw 0x30 0x30 0x02 0xff 0x14  # set fan speed to 20%
```
== 功率监控
```sh
ipmitool dcmi power reading
```
= 包管理
体验过`pacman`, `apt`, `emerge`,其中还是`pacman`的体验最好(毕竟是功能最简陋的).

#link("https://repology.org/")[Repology]列出了常见发行版上的打包情况,不过没有gentoo的.
== pacman
列出所有显式安装的包:
```sh
pacman -Qe
```
列出所有悬垂包:
```sh
pacman -Qtdq
```
更新文件数据库:
```sh
pacman -Fy
```
寻找包含指定文件名的包:
```sh
pacman -F tldr
pacman -F /usr/bin/tldr
```
== AUR
之前使用#link("https://github.com/Jguer/yay")[Juger/yay],现在我迁移到了#link("https://github.com/Morganamilo/paru")[Morganamilo/paru].
== dpkg & apt
解压`deb`包:
```sh
ar x example_0.1.0-1_all.deb
```
列出文件:
```sh
dpkg-deb -c example_0.1.0-1_all.deb
```
显示元信息:
```sh
dpkg-deb -I example_0.1.0-1_all.deb
```
== pip
以`requirements.txt`格式列出安装的包:
```sh
pip freeze
```
= init程序
`init`程序是系统启动的第一个程序(`pid`为1),它完成主引导流程.

Debian和Arch系统的`/usr/sbin/init`是指向`../lib/systemd/systemd`的符号链接.
== systemd
列出所有unit的初始化时间:
```sh
systemd-analyze blame
```
展示unit属性:
```sh
systemctl show k3s
```
== macOS
macOS所使用的守护进程管理是`launchd`,管理系统级或用户级的守护程序.

要编写`<LABEL>.plist`文件,参考#link("https://wiki.lazarus.freepascal.org/macOS_daemons_and_agents")[macOS daemons and agents]以及#link("https://developer.apple.com/library/archive/documentation/MacOSX/Conceptual/BPSystemStartup/Chapters/CreatingLaunchdJobs.html")[Creating Launch Daemons and Agents].
= 日志
== systemd
清除10天前的所有日志:
```sh
sudo journalctl --vacuum-time 10d
```

输出特定服务的日志:
```sh
sudo journalctl --unit github-actions-runner
```

注意希望使用如果非`sudo`身份查看日志,需要在`systemd-journal`用户组当中.
= 文件系统
获取用于挂载标识的UUID:
```sh
sudo blkid /dev/sda2
```
== 符号链接
路径分为逻辑路径与物理路径.如果解析符号链接到实际目录,那么是物理路径,否则是逻辑路径,`pwd`命令默认输出逻辑路径.如果要输出物理路径:
```sh
pwd -P # 物理路径
```
== ZFS
`zpool history`可以查看操作历史,包括`zpool create`, `zpool add`等的记录.前提是`pool`还在,如果已经被`zpool destroy`了,相应的历史都会删除.
```sh
zpool create -o ashift=12 oskar draid:2d \
/dev/disk/by-id/ata-TOSHIBA_MQ02ABF100_Z6NUPPCRT \
/dev/disk/by-id/scsi-35000cca02d7d75ec \
/dev/disk/by-id/scsi-35000cca02d7d78f8 \
-f  # in case they are of different sizes
```
dRAID是raidz(1-3)的封装,手册中给出的创建格式为:
```
draid[parity][:datad][:childrenc][:sparess]
...
In regards to I/O, performance is similar to raidz since, for any read, all D data disks must be accessed. Delivered random IOPS can be reasonably approximated as floor((N-S)/(D+P))*single_drive_IOPS.

A dRAID with N disks of size X, D data disks per redundancy group, P parity level, and S distributed hot spares can hold approximately (N-S)*(D/(D+P))*X bytes and can withstand P devices failing without losing data.
```
`children`是所有盘(包括热备盘)的数量, `parity`指定奇偶校验级别(1-3),默认为1.

例如`draid2:7d:10c:1s`表示10个磁盘中设置1个热备盘,剩下9个磁盘为一个`group`,含有7个数据盘以及2个校验盘.这可以承受2个磁盘的损坏,并在第一个损坏发生时立刻投入1个热备盘进行恢复(所以实际上能承受3个磁盘损坏而不丢失数据).

单个`group`相对于单块硬盘的吞吐量为:$ floor((c-s) / (d+p)) $
其中$c$是`children`的数量.注意这里是理论值,实际上还受内存缓存,是否开启压缩等因素影响.

单个`group`相对于单块硬盘的存储量为:$ (d(c-s)) / (d+p) $

注意奇偶校验和热备实际上是分散在所有磁盘上的,这也是为什么不能创建后再修改热备盘的数量.

为ZFS文件系统添加dataset:
```sh
sudo zfs create -o compression=zstd -o mountpoint=/home oskar/home
```
也可以改变挂载点
```sh
sudo zfs set mountpoint=/srv oskar/home
```
参考:
- `zpoolconcepts(7)`
- `zpool-create(8)`
- `zfs-create(8)`
- `zfsprops(7)`
- #link(
    "https://www.thomas-krenn.com/en/wiki/ZFS_dRAID_Basics_and_Configuration",
  )[ZFS dRAID Basics and Configuration - Thomas-Krenn-Wiki-en]
- #link("http://www.linvon.cn/posts/linux%E6%96%87%E4%BB%B6%E5%A4%A7%E5%B0%8F%E6%B5%85%E8%B0%88/")[Linux文件大小浅谈]
- #link(
    "https://github.com/openzfs/zfs/discussions/14542",
  )[What does the ZFS Metadata Special Device do? · openzfs/zfs · Discussion #14542]
- #link("https://farseerfc.me/zhs/file-size-histogram.html")[系统中的大多数文件有多大？ - Farseerfc的小窝]
- #link(
    "https://openzfs.github.io/openzfs-docs/man/master/7/zpoolconcepts.7.html",
  )[zpoolconcepts.7 — OpenZFS documentation]
- #link(
    "https://forums.truenas.com/t/openzfs-draid-a-complete-guide/2440",
  )[OpenZFS dRAID - A Complete Guide - Resources - TrueNAS Community Forums]
== Btrfs
== NFS
参考:
- #link("https://wiki.debian.org/NFSServerSetup")[NFSServerSetup - Debian Wiki]
- #link("https://help.ubuntu.com/community/NFSv4Howto")[NFSv4Howto - Community Help Wiki]
在服务端上:
```sh
apt install nfs-kernel-server
sudo -e /etc/exports
```
写入以下内容:
```
/oskar/elisabeth 192.168.0.3(rw,sync,no_root_squash,no_subtree_check)
```
在客户端上:
```sh
apt install nfs-common
mount -t nfs4 -o proto=tcp,port=2049 heloise.adamanteye.cc:/oskar/elisabeth /srv
```
或者写入`/etc/fstab`:
```
heloise.adamanteye.cc:/oskar/elisabeth	/srv/	nfs4	_netdev,auto,defaults	0	0
```
== OverlayFS
#link("https://docs.kernel.org/filesystems/overlayfs.html")[Overlay Filesystem]是upper目录树与lower目录树的融合.其中lower不需要可写,甚至也可以是另一个overlay,而upper一般来说需要可写,并且支持创建特定attributes,因此NFS不能作为upper.

特别地,如果创建只读overlay,那么upper和lower可以使用任何文件系统.

```sh
mount -t overlay overlay -olowerdir=/lower,upperdir=/upper,\
workdir=/work /merged
```
= 容器与虚拟化
== Container
容器作为应用分发的优势在于,不包括内核,仅打包需要的库.其技术基于`cgroups(1)`与OverlayFs.

Docker在2013年发布,同年年末,Google的工程师们开发了#link("https://cloudplatform.googleblog.com/2015/01/in-coming-weeks-we-will-be-publishing.html")[k8s]的原型,随后,Docker底层的镜像构建,容器运行的部分被抽出来作为#link("https://www.howtogeek.com/devops/what-is-containerd-and-how-does-it-relate-to-docker-and-kubernetes/")[containerd]发布,其遵循Open Container Initiative (OCI)标准.

到现在,无论是Docker还是k8s,他们都以containred作为容器运行时.其中k8s的#link("https://kubernetes.io/blog/2016/12/container-runtime-interface-cri-in-kubernetes/")[CRI] (Container Runtime Interface)是OCI的抽象,作为不同的容器运行时的统一封装.
== KVM
Kernel Virtual Machine (#link("https://wiki.debian.org/KVM")[KVM])是Intel或AMD平台上的硬件虚拟化技术.
```sh
sudo apt install --no-install-recommends qemu-system libvirt-clients libvirt-daemon-system
```
=== ESXi
ESXib不是应用程序,而是直接安装在硬件上的虚拟化平台.
= 网络服务
== nginx
启用#link("https://en.wikipedia.org/wiki/OCSP_stapling")[OSCP Stapling]:
```
ssl_stapling on;
ssl_stapling_verify on;
```
== caddy
#link("https://github.com/mholt/caddy-webdav")[mholt/caddy-webdav]为`caddy`扩展了webdav模块.
== 压力测试
用#link("https://github.com/hatoo/oha")[hatoo/oha: Ohayou(おはよう)]产生HTTP流量.
= 内核
== Wayland图形栈
图形栈的任务是连接不同的输入设备:键盘,鼠标,触摸板,触摸屏,绘图板.将输入事件分配到不同的客户端,并且将不同客户端的输出显示在桌面上.

#link("https://wayland-book.com/")[Wayland]是类Unix系统的下一代显示服务器.

/ evdev: 内核#link("https://en.wikipedia.org/wiki/Evdev#cite_note-2")[evdev] (event device)是Linux内核以及Free BSD中的通用输入事件接口,与之对应的用户空间库称为`libevdev`.
/ libinput: Wayland下工作在`libevdev`上的另一层抽象,为合成器提供统一的处理输入事件的方式.
/ DRM: 内核#link("https://en.wikipedia.org/wiki/Direct_Rendering_Manager")[Direct Rendering Manager]是处理现代显卡的内核子系统,它检测到的显卡列在`/dev/drm`/当中.主节点(primary node)名称形如`card0`,允许特权操作.渲染节点名称形如`renderD128`,允许非特权操作(渲染或视频解码).
/ libdrm: 内核DRM的用户空间部分.
/ Mesa: Vulkan和OpenGL都是图形API. Mesa是Linux上基于Intel以及AMD GPU驱动程序对Vulkan和OpenGL的实现,是位于内核驱动程序之上的高级层.
/ xcbcommon: `libinput`通过scancode的形式传递键盘事件,而`xcbcommon`负责将其解释为有意义的通用键盘符号.
/ pixman: 高效操作像素缓冲区.
/ libwayland: Wayland协议的最常用实现,C语言编写.它提供了从XML定义文件生成C头文件以及胶水代码的工具`wayland-scanner`.
=== 协议
Wayland协议由多层抽象构成,最基本的是Wire Protocol.
==== Wire Protocol
线路协议是32字节单位的流,按照主机的端序编码.

基本类型:
/ int, uint: 32比特的有符号或无符号整数
/ fixed: 24.8比特的有符号定点数
/ object: 32比特的对象ID
/ new_object: 32比特的对象ID,且接受时会为其分配内存
/ string: 编码通常用UTF-8
/ array: 任意数据的blob

线路协议是用消息构建的,每条消息都是事件(服务器到客户端)或请求(客户端到服务器).事件作用在`object`上.
== dkms
= 其他应用
== Telegram Bot
首先阅读#link("https://core.telegram.org/bots/tutorial")[From BotFather to 'Hello World'],这里讲解了机器人开发的基础知识.
= 服务器
== Dell Power Edge R630
阵列卡是H330(小卡),可以在BIOS里面改成HBA模式,即硬盘直通.

双路E5-2680处理器,2条32GB内存,外加4个2.5英寸硬盘在开机空载时的耗电量大约为161W.仅主板通电的功率为10W左右.
