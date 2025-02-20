#import "../note_zh.typ": *
#show: conf.with(
  title: "密码技术笔记",
  author: "adamanteye",
)
#show: rest => columns(2, rest)
= 总结
这篇笔记主要来自结城浩-图解密码技术.
= 对称密码
对称密码也称共享密钥密码,用相同的密钥进行加密和解密.
== 一次性密码本
一次性密码本由维纳(G.S.Vernam)于1917年提出, 1949年,香农从数学上证明了一次性密码本是无条件安全的,理论上无法破译.
== AES

= 非对称密码
也称公钥密码.用公钥加密,用私钥解密.
== RSA
RSA得名于三位开发者的首字母组合.

RSA可以被用于公钥与密码签名.
#figure(
  table(
    columns: 2, table.hline(),
    [公钥], [$(E,N)$],
    [私钥], [$(D,N)$],
    [加密], [$"密文"="明文"^E mod N$],
    [解密#footnote[明文需要小于$N$,假如大于$N$,取模后必定无法得到正确的明文.]], [$"明文"="密文"^D mod N$],
    table.hline(),
  ),
  caption: [RSA的加密与解密],
)
生成一对RSA公钥和私钥的过程如下:
+ 求$N$

  重复生成伪随机数,直到找到2个大素数$p,q$.
  #link("https://en.wikipedia.org/wiki/Miller%E2%80%93Rabin_primality_test")[Miller–Rabin]素性测试是常用的概率性素数检测算法.
  $ N=p q $
+ 求中间结果$L$

  $ L="lcm"(p-1,q-1) $
+ 求$E$

  要求$E$满足
  - $1<E<L$
  - $"gcd"(E,L)=1$
  重复生成伪随机数,检查是否满足最大公约数的要求
+ 求$D$

  - $1<D<L$
  - $E D equiv 1 (mod L)$

== 椭圆曲线密码(ECC)
== 安全性
=== 暴力破解
/ RSA: 没有对大整数进行质因数分解的高效算法
/ ECC: 椭圆曲线上的乘法运算的逆运算是困难的
对非对称密码可以被中间人攻击,中间人截获通信发起方的公钥,替换为自己的公钥,之后可伪装通信发起方.
= 单向散列函数
也称为消息摘要函数,哈希函数.

单向散列函数承担以下功能:
- 确认完整性

/ MD结构: 循环执行压缩函数

  MD4, MD5, SHA-1, SHA-2等传统单向散列函数算法都是基于MD结构的.
/ 海绵结构: 吸收阶段,挤出阶段

  Keccak使用的结构,一种变体是双工结构.
== SHA-3
Secure Hash Algorithm-3在2012年被确定为Keccak算法.

为了配合SHA-2的散列值长度, SHA-3中规定了4种版本:
- SHA3-224
- SHA3-256
- SHA3-384
- SHA3-512
== 攻击
/ 弱碰撞: 知道散列值,寻找另一条消息
/ 强碰撞: 知道消息,寻找另一条散列值相同的消息
= 消息认证码
消息认证码(Message Authentication Code)承担以下功能:
- 确认完整性
- 认证

消息认证码有这些缺陷:
- 无法对第三方证明
- 无法防止否认
而数字签名可以解决这些缺陷.
== HMAC
HMAC是用单向散列函数构造消息认证码的方法(RFC 2104).
== 应用例子
/ SWIFT: 环球银行金融协会(Society for Worldwide Interbank Financial Telecommunication)

  银行间通过SWIFT传递交易消息,其中使用了消息认证码.
/ IPsec: 使用消息认证码认证通信内容,校验完整性.
= 数字签名
数字签名是将非对称密码反过来用实现的.

#figure(
  table(
    columns: 3, table.hline(), table.header([], [私钥], [公钥]),
    table.hline(),
    [非对称密码], [接受者解密], [发送者加密],
    [数字签名], [签名者生成签名], [验证者验证签名],
    table.hline(),
  ),
  caption: [非对称密码对比数字签名],
)
= 证书
信任需要起点.
= 密钥
= 随机数
= SSL/TLS
SSL是1994年由网景(netscape)设计的协议,于1995年发布了3.0版本,在2014年, SSL 3.0协议被发现存在可能导致POODLE攻击的安全漏洞,不再安全.

1999年, IETF在SSL 3.0基础上设计了TLS 1.0,作为RFC 2246发布. 2006年, TLS 1.1以RFC 4346发布,加入了AES对称密码算法. TLS 1.2新增了HMAC-SHA256以及对GCM, CCM认证加密的支持,移除了IDEA和DES.
