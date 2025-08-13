#import "../../../note_zh.typ": *
#show: conf.with(
  title: "计算机网络原理笔记",
  author: "adamanteye",
)
= RFC
IETF described how to create and maintain Internet Standards in #link("https://datatracker.ietf.org/doc/html/rfc2026")[RFC 2026].

Roughly, there are two (#link("https://datatracker.ietf.org/doc/html/rfc6410")[previously three]) maturity levels for Internet Standards:
/ Proposed Standard: A Proposed Standard specification is generally stable,
  has resolved known design choices,
  is believed to be well-understood,
  has received significant community review,
  and appears to enjoy enough community interest to be considered valuable.
  However, further experience might result in a change or even retraction
  of the specification before it advances.
/ Internet Standard: An Internet Standard is characterized by a high degree of
  technical maturity and by a generally held belief that the
  specified protocol or service provides significant benefit to the
  Internet community.
And there are other non-standards tracks:
*Informational*, *Experimental* and *Historic*.
= 网络层
== Iptables & Nftables
#link("https://wiki.archlinux.org/title/Nftables")[nftables]是用户态配置Linux内核Netfilter的工具集,代替了IPv4/v6防火墙的`iptables`与`ip6tables`,处理二层的`ebtables`以及处理ARP协议的`arptables`.

其中,操作的五条链是`input`, `forward`, `output`, `prerouting`, `postrouting`.
/ DNAT: 即Destination network address translation,即将目标IP替换掉,并且针对回复做逆映射.
= 应用层
== DNS解析
全球有13个根域名服务(实际的服务器不止13个),由12家独立组织维护,例如`a.root-servers.net`.

根域名服务器管理顶级域名服务器(Top Level Domain),例如`.com`.

域名需要为`[a-z]([-a-z0-9]*[a-z0-9])?`的形式,即满足#link("https://datatracker.ietf.org/doc/html/rfc1035")[RFC 1035]的规定.

参考:
- #link(
    "https://datatracker.ietf.org/doc/html/rfc1876",
  )[RFC 1876 - A Means for Expressing Location Information in the Domain Name System]
- #link(
    "https://shkspr.mobi/blog/2025/07/get-the-location-of-the-iss-using-dns/",
  )[Get the location of the ISS using DNS – Terence Eden’s Blog]
DNS的解析遵循最长前缀匹配,假设请求同时命中两条解析:
```
foo.example.com  10.0.0.1
*.example.com    10.0.0.2
```
那么应当返回`10.0.0.1`.

= 网络编程
== 网络套接字
互联网套接字API源于伯克利套接字标准,套接字地址是发送方和接收方的IP地址与端口以及协议组成的五元组.
= 传输层
== TCP
== QUIC
*QUIC* (#link("https://datatracker.ietf.org/doc/html/rfc9000")[RFC 9000], #link("https://datatracker.ietf.org/doc/html/rfc8999")[RFC 8999], #link("https://datatracker.ietf.org/doc/rfc9001/")[RFC 9001], #link("https://datatracker.ietf.org/doc/rfc9369/")[RFC 9369]) is a UDP based transport protocol that provides reliable (or unreliable, #link("https://datatracker.ietf.org/doc/rfc9221/")[RFC 9221]) and encrypted delivery of data between applications.
= 网络优化
== NAT Loopback
NAT Loopback也称为NAT Hairpinning,是指LAN中的客户端尝试通过公网IP地址访问同一LAN中的服务器.

同样地,在LAN中部署通过端口映射暴露给公网的服务时,也有可能造成NAT Loopback.

解决办法一般是在LAN中搭建独立的DNS服务器,使得LAN中解析域名为LAN中的地址,而在WAN中则解析为公网的地址,称为Split-Horizon DNS.
= ASN
== 扫描工具
- #link(
    "https://github.com/nitefood/asn",
  )[nitefood/asn]
== 参考
- #link("https://vps123.top/china-asn-bgp-rank.html")[中国大陆地区全部ASN编号]
= Net Filters
#figure(
  image("netfilter-packet-flow.svg"),
  caption: [Netfilter Packet Flow#footnote[来自#link("https://en.wikipedia.org/wiki/Netfilter")[Netfilter - Wikipedia]]],
)
