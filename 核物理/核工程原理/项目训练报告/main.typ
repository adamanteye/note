#import "../../../note-zh.typ": *
#show: conf.with(
  title: "混合蒙特卡罗在反应堆分析中的应用调研",
  author: "adamanteye",
  numbered-equation: true,
)
#import "@preview/lovelace:0.3.0": *
= 介绍
粒子输运理论是研究微观粒子在介质中的迁移统计规律的数学理论,求解粒子输运过程即求解Boltzman方程,也称为粒子守恒方程,这一方程由Boltzman于1872年推导出.
$
  pdv((phi\/nu(E)), t)+va(Omega) dprod &grad phi + Sigma_t (va(r),E) phi=\ &integral_0^infinity [integral_(Omega') Sigma_s (va(r),E') f(va(r),E'->E,va(Omega')->va(Omega))phi (va(r),E',va(Omega'),t)dd(va(Omega'))] dd(E')\ &+ chi(E) / (4pi) integral_0^infinity [integral_(va(Omega'))Sigma_f (va(r),E')phi(va(r), E', va(Omega'), t)dd(va(Omega'))]dd(E')+S(va(r),E,va(Omega),t)
$ <boltzman>
20世纪初, Hilbert论证了Boltzman方程解的存在性与唯一性,由此奠定了粒子输运理论的数学基础.粒子输运方程描述的分布函数包含3个空间变量,2个方向角度变量,1个能量和1个时间变量,共7个独立变量,一般只能通过数值方法求解.

计算机诞生后, Ulam与von Neumann提出通过计算机模拟中子链式反应过程,他们通过分析大量中子的统计行为,用统计平均值作为估计的物理量, 1944年Neumann等人将研制的第一个随机模拟中子链式反应的程序称为蒙特卡罗(Monte Carlo)方法.

粒子输运方程可以用确定性方法求解,也可以用蒙特卡罗方法(也称非确定性方法)求解.确定性方法求解粒子输运方程时,需要对方程进行离散化,转化为线性方程组求解(例如离散纵坐标法,特征线法(MOC)@gaston_method_2021),但对于复杂的三维几何结构求解困难.蒙特卡罗方法则追踪每个粒子与介质的相互作用直至逃逸或吸收,通过大量粒子的统计平均值来估计物理量,适用于复杂几何结构,非均匀材料的求解.

文献中的*HMC*(hybrid Monte Carlo,混合蒙特卡罗)算法实际上有狭义和广义之分,狭义的HMC专指从晶格场论的计算需求催生的算法@duane_hybrid_1987 @beskos_hybrid_2011,应用领域包括统计物理,计算化学,地理信息以及神经网络@mongwe_hybrid_nodate@beskos_optimal_2013. 而在核物理领域,使用的主要是广义HMC方法,即在蒙特卡罗模拟中引入确定性方法提高计算效率与精度@becker_hybrid_2007.
= 狭义HMC算法
HMC与哈密顿力学有关,对于$Q in RR^N$,希望采样的概率密度函数为$ Pi(Q)=exp(-cal(V)(Q)) $其中$cal(V):RR^N->RR$是势能函数.

如何从系统的哈密顿方程出发,得到一系列采样呢? 可以通过引入动量$P~N(0,cal(M))$来辅助采样,其中$cal(M)$是对称正定的质量矩阵.

采样的推导如下@beskos_optimal_2013,考虑不含时的哈密顿量$ cal(H)(Q,P)=1 / 2 iprod(P, M^(-1)P)+cal(V)(Q) $这给出了动力学方程
$ dv(Q, t)=M^(-1)P,dv(P, t)=-grad cal(V)(Q) $
如果用$Phi_t$表示时间演化的作用,即$ Phi_t (Q(0),P(0))=(Q(t),P(t)) $
那么$Phi_t$有这些性质
+ 能量守恒: $cal(H) compose Phi_t=cal(H)$
+ 体积守恒: $dd(cal(P))dd(cal(Q))$在$Phi_t$下保持不变
+ 反演性: 记$S(Q,P)=(Q,-P)$,那么$S compose (Phi_t)^(-1) compose S=Phi_t$
可以推导得到,如果初始状态$(Q(0),P(0))$服从以下分布
$ Pi(Q, P)=exp(-cal(H)(Q,P))=exp(-1 / 2 iprod(P, M^(-1)P))exp(-cal(V)(Q)) $
那么对于后续演化$t>0$,可以证明$Q(t)$的边缘概率密度分布保持不变$exp(-cal(V)(Q(t)))=exp(-cal(V)(Q(0)))$.

因此,如果能够高效地得到$Q(t_1),Q(t_2),dots,Q(t_n)$,那么可以得到一系列服从$Pi(Q)=exp(-cal(V)(Q))$的样本.

以上是HMC的基本思想,实际应用中的算法为
#line(start: (0% + 0em, 0% + 0em), end: (0% + 38em, 0% + 0em))
#pseudocode-list[
  + 采样$P~N(0,cal(M))$
  + 以概率$alpha$接受$Q'$,其中$(Q',P')=Psi_h^(T)(Q,P)$$ alpha((Q',P'), (Q,P))=min{1,exp(cal(H)(Q,P)-cal(H)(Q',P'))} $
]
#line(start: (0% + 0em, 0% + 0em), end: (0% + 38em, 0% + 0em))
上面定义了一个时间步长的哈密顿动力学演化$Psi_h^(T)$,这个演化通常用Störmer-Verlet(leapfrog)显式方法@noauthor_leapfrog_2024 完成#footnote[一般情况下比欧拉法稳定],即对于步长$h$,定义$Psi_h^(T):(Q_0,P_0)|->(Q_h,P_h)$为
$
  P_(h\/2) & =P_0-h / 2 grad cal(V)(Q_0) \
       Q_h & =Q_0+h cal(M)^(-1)P_(h\/2) \
       P_h & =P_(h\/2)-h / 2 grad cal(V)(Q_0)
$
$T$时刻的$Q(T)$可以通过迭代$floor.l T / h floor.r$次得到,即$Phi_h^((T)):=Phi_h^(floor.l T / h floor.r)$

使用HMC算法采样时, 动量$P$是辅助变量. $h,T,cal(M)$由使用者决定,@gupta_tuning_1988@mackenze_improved_1989@beskos_optimal_2013 介绍了调整这些参数以提高采样效率的方法.

狭义HMC算法在反应堆分析中尚未有应用,因为HMC算法适合方便写出系统势能函数的情况,常用于微观的动力学计算.而反应堆分析中的输运方程是复杂的微分积分方程,涉及散射,吸收及裂变等复杂过程,不存在合适的势函数.
= 广义HMC方法
== MC算法 <mc-algorithm>
首先考察一般的MC算法是如何对粒子输运过程进行模拟的@lux_monte_2018 @madonghui_2024.
#line(start: (0% + 0em, 0% + 0em), end: (0% + 38em, 0% + 0em))
#pseudocode-list[
  + 源分布采样

    粒子的初始状态可以表示为$S_0=(va(r_0),E_0,va(Omega_0),t_0)$,给定粒子源的分布后,可以采样初始粒子.
  + 碰撞距离采样

    粒子发生下一次碰撞的距离服从指数分布,即$p(l)dd(l)=Sigma_t e^(-Sigma_t l)dd(l)$,从而可以采样下一次碰撞的距离.
  + 确定反应类型

    粒子在碰撞后会发生散射,吸收或裂变.这些反应的截面从核数据库中获取,并依靠随机采样确定发生的反应类型.
  + 更新下一代粒子

    根据碰撞距离和反应类型,更新粒子的状态.粒子有可能因为能量低于阈值,被吸收等原因消失,也可能因为碰撞,裂变产生新一代模拟粒子以重复上述过程.
]
#line(start: (0% + 0em, 0% + 0em), end: (0% + 38em, 0% + 0em))
美国LANL实验室首先研制了大型多功能多粒子MC输运程序MCNP,采用Fortran语言编写,用于模拟中子,光子,电子等粒子的耦合输运以及特征值问题. MIT主导社区开发了OpenMC开源程序. CERN开发了Geant4开源程序.国内则开发有MCMG, RMC等程序.此外还有很多用于反应堆的蒙特卡罗程序,在此不一一列举@song_2014.

在使用MC进行反应堆分析时,由于MC模拟过程中的粒子模拟天然地适于并行,因此在分布式计算集群上运行MC程序是容易的.然而,由于随机性,MC方法的计算效率较低,裂变源迭代收敛速度慢,大量时间用于对统计结果无贡献的非活跃代@song_2014,为此,常用各种减方差法加快收敛速度,如权重窗口方法@zhao_2024.
== 不同的HMC方法
MC算法精度较高,但计算效率较低,甚至所需要的计算资源是难以实现的.确定性算法(例如MOC)计算效率高,但精度较低,在若干场合由于离散化甚至可能出现不符合物理的解@wagner_review_2011.

研究者提出了各种混合方法,以期加速MC的计算,或完成MC原本所不能完成的任务.
=== MC-MOC混合
*MOC*(method of characteristics,特征线法)是一种对粒子输运方程进行求解的确定性算法,对@boltzman 在能量和空间上积分后,有
$
  dv(phi_(m,i)^g, s_m)+Sigma_(t,i)^g phi_(m,i)^g=&Q_(m,i)^g \ &Q_(m,i)^g=1 / (4pi) (sum_(g')Sigma_(s,i)^(g'->g)phi_i^(g')+chi^g / k sum_(g')nu sigma_f^(g')phi_i^(g'))
$ <moc>
其中各参数的含义详见@lee_hybrid_2015.

假设每个网格内的源与材料均匀,可以将@moc 沿着中子运动路径$s_m$从$0$积分到$i$.最终网格内的平均通量可以用以下成分展开
$
  phi.alt_i^g=4pi sum_m overline(phi)_(m,i)^g omega_m \ overline(phi)_(m,i)^g (s_m)=1 / s_m integral_0^(s_m) phi_(m,i)^g (s') dd(s')
$
在所有网格的所有方向上积分后,可以得到整个几何体的通量分布.幂迭代可用于更新原项和特征值,直到裂变源收敛@lee_hybrid_2015.

对于MC方法,将其数学上形式化地写为@brown2005fundamentals
$
  Psi(va(r), E, va(Omega))=integral &T(va(r')->va(r),E,va(Omega)) \ &[integral integral Psi(va(r'), E', va(Omega')) C (va(r'),E'->E,va(Omega')->va(Omega))dd(E')dd(Omega'+Q(va(r'),E,va(Omega)))]dd(va(r'))
$
其中
- $Psi(va(r), E, va(Omega))$是粒子碰撞概率
- $C (va(r'),E'->E,va(Omega')->va(Omega))$是碰撞核
- $Q(va(r'),E,va(Omega))$是源项
- $T(va(r')->va(r),E,va(Omega))$是传输核
如@mc-algorithm 所述,传输核与碰撞核基于核数据库随机采样,有
$ phi.alt_i^("MC",g)=1 / (W V) sum_("collisions" in i,g) w_j / (sum_(t,j) (E)) $

研究者提出将两者混合,如@mc-moc,在共振能量区采用MC方法,在高能区和低能区采用MOC方法.
#figure(image("1.png", width: 90%), caption: [MC及MOC方法的能区]) <mc-moc>
MC模拟使用MOC在快速能量范围内计算的散射源和裂变源作为输入;反过来,MC在共振区的结果被用来更新热能量范围内MOC的源项.
#grid(
  columns: 2,
  column-gutter: 1em,
  [#figure(image("3.png"), caption: [针型单元几何模型]) <mc-moc-test>],
  [这种混合方法的创新点在于解决了如何将两种算法的结果有效耦合的问题.为了测试HMC的效率,研究者设计了一个包含燃料,包壳,冷却剂的测试问题(@mc-moc-test),并进行了中子输运模拟.通过将混合方法的特征值与纯MC模拟的特征值进行比较来衡量准确性.],
)
#figure(image("2.png"), caption: [MC,MOC及HMC的比较(连续能量,包含非弹性散射)]) <mc-moc-fom>
作者定义了性能指标FOM(Figure of Merit),用以衡量不同方法的好坏$ "FOM"=1 / ((sigma_(k_"eff")\/ k_"eff")^2T) $其中$T$是计算时间, $sigma_(k_"eff")$是$k_"eff"$的标准差.如@mc-moc-fom 所示,混合方法可以比传统的MOC方法提供高出10倍的更准确解,并且比传统的MC方法具有高出90倍的计算效率@lee_hybrid_2015.
=== CADIS与FW-CADIS方法
橡树岭国家实验室的研究人员回顾了*CADIS*(一致性伴随驱动重要性采样)和*FW-CADIS*(前向加权一致性伴随驱动重要性采样)方法@wagner_review_2011.

这两种方法是用于提高MC模拟的计算效率的重要方法,它们都是一种减方差(variance reduction)方法,思想来源于@haghighat_monte_2003.

CADIS与FW-CADIS在橡树岭国家实验室的MCNP5程序中得到了实现和测试@wagner_hybrid_2011,此外也有研究者利用Geant4(@cadis-framework)实现了这两种方法@wang_hybrid_2022.

CADIS重点处理局部探测器(计数区域).它利用伴随函数来确定不同位置的粒子重要性,从而帮助对源项和传输参数进行偏置,减少MC模拟中的方差.具体而言,该方法利用基于快速运行的确定性计算(使用Denovo代码)得到的伴随通量,生成偏置源分布和权重窗口.

#figure(image("4.png", width: 70%), caption: [(FW-)CADIS在Geant4上的实现]) <cadis-framework>

FW-CADIS是CADIS的扩展,用于处理多个局部探测器,它利用前向和伴随解来创建一个重要性图,以此来加权伴随源.从而可以同时减少多个探测器的方差.

#figure(image("5.png", width: 80%), caption: [FW-CADIS在2D PWR上的计算流程]) <fw-cadis-2d-pwr>

@fw-cadis-2d-pwr 展示了HMC(FW-CADIS)在实际2-D四分之一PWR堆芯的计算流程,结合@ru-comp, @ru-dist 表现出了FW-CADIS在反应堆高保真分析上的优势.

#grid(
  columns: 2,
  column-gutter: 1em,
  figure(
    image("7.png", width: 80%),
    caption: [Relative uncertainties in energy bin 5 (0.15 to 0.275 eV) computed using MCNP5 with (bottom) and without (top) FW-CADIS method],
  ),
  [#figure(
      image("6.png", width: 80%),
      caption: [Number of space-energy flux tally cells by relative uncertainty (RU) interval using MCNP5 with and without the FW-CADIS method],
    ) <ru-comp>
    如@fw-cadis-2d-pwr 所示,橡树岭国家实验室在2011年利用FW-CADIS有效地进行了全堆分析@wagner_hybrid_2011,在计算资源有限的情况下,FW-CADIS展示了其在反应堆高保真分析上的应用.
    #figure(
      image("8.png", width: 90%),
      caption: [Relative uncertainty distribution for tallied fluxes using MCNP5 with and without the FW-CADIS method],
    ) <ru-dist>
  ],
)

CADIS和FW-CADIS特别适用于深穿透问题(探测器获得计数的概率非常小@wang_hybrid_2022),如核反应堆的屏蔽分析,核测井等.这种方法能确保更多的粒子路径被采样到探测器附近,从而提高探测器响应的统计精度.而FW-CADIS相比CADIS优化了多个探测器的情况,适合需要得到全局或多区域响应的问题.
= 结论
随着目前网络通信能力的提升,计算资源的丰富与现代编译器的向量化,并行化技巧的发展.人们逐渐能负担得起一些过去认为不现实的蒙特卡罗计算,但是通过改进算法,提高蒙特卡罗方法的计算效率,仍然是研究者们追逐的目标.

本文讨论了狭义HMC与广义HMC的区别,介绍了用于求解粒子输运方程的确定性算法(MOC)与不确定性算法(MC),调研了3种HMC方法,发现其可以应用于以下课题:
/ 反应堆分析: 通过MC-MOC混合方法,能够精确且高效地处理反应堆中热谱的共振自屏蔽效应,提高了中子输运模拟的准确性和计算效率
/ 全堆高保真分析: 在求解反应堆核心中子注量率分布的特征值问题中,MC-MOC混合, CADIS和FW-CADIS方法都展现了优异的性能,实现了在复杂几何条件下的高保真模拟
/ 屏蔽与剂量测定: CADIS和FW-CADIS方法在计算核设施中的辐射剂量率和反应率等关键参数时表现出色,特别是在深穿透问题中,这些方法能显著减少方差,提高探测器响应的统计精度,帮助评估安全性和优化设计

除了以上在反应堆分析中的用途之外,HMC作为一种优化粒子输运方程求解的思想,在反应堆分析之外的核物理领域也有多种形式的应用
- 托卡马克装置停堆剂量率的高效估计@lu_hybrid_2018
- 加速聚变堆的计算@nie_2018
- 核测井提高模拟速度@wang_hybrid_2022

#set text(lang: "en", region: "us")
#bibliography("main.bib", style: "ieee", title: "参考文献")
