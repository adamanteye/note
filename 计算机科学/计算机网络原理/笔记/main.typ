#import "../../../note_zh.typ": *
#show: conf.with(
  title: "计算机网络原理笔记",
  author: "adamanteye",
)
= 防火墙
#link("https://wiki.archlinux.org/title/Nftables")[nftables]是用户态配置Linux内核Netfilter的工具集,代替了IPv4/v6防火墙的`iptables`与`ip6tables`,处理二层的`ebtables`以及处理ARP协议的`arptables`.

其中,操作的五条链是`input`, `forward`, `output`, `prerouting`, `postrouting`.

= DNS解析
全球有13个根域名服务(实际的服务器不止13个),由12家独立组织维护,例如`a.root-servers.net`.

根域名服务器管理顶级域名服务器(Top Level Domain),例如`.com`.

= 网络编程
== 网络套接字
互联网套接字API源于伯克利套接字标准,套接字地址是发送方和接收方的IP地址与端口以及协议组成的五元组.
= 协议
== 传输层
=== QUIC
QUIC是基于UDP的协议,规定在RFC 9000中.

选择UDP是因为足够简单,并且可以兼容旧有的中间件,避免被丢弃.如同TLS 1.3将自己标识为TLS 1.2.

QUIC宣称自己是0-RTT或1-RTT,实践中因为Token的问题往往还是2-RTT.
= 网络优化
== NAT Loopback
NAT Loopback也称为NAT Hairpinning,是指LAN中的客户端尝试通过公网IP地址访问同一LAN中的服务器.

同样地,在LAN中部署通过端口映射暴露给公网的服务时,也有可能造成NAT Loopback.

解决办法一般是在LAN中搭建独立的DNS服务器,使得LAN中解析域名为LAN中的地址,而在WAN中则解析为公网的地址,称为Split-Horizon DNS.
