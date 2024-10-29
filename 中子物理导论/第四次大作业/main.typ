#import "@preview/touying:0.5.3": *
#import themes.university: *
#import "@preview/unify:0.6.0": *
#import "@preview/physica:0.9.3": *

#let pm=$plus.minus$
#set text(font: ("Libertinus Serif", "Source Han Serif"), lang: "zh", region: "cn")
#show heading.where(level: 1): set heading(numbering: "1.")
#show: university-theme.with(
  aspect-ratio: "16-9",
  config-info(
    title: [$isotope("Pu", a:239)(n,f)$瞬发裂变中子谱预平衡不对称],
    subtitle: [中子物理导论第四次大作业],
    authors: ("杨哲涵", "司书屹"),
    date: datetime(year: 2024, month: 10, day: 29),
    institution: [工程物理系],
    logo: none,
  ),
  config-colors(
    primary: rgb(106,8,116),
    secondary: rgb("#6908749c"),
    tertiary: rgb("#7DB9DE"),
    neutral-lightest: rgb("#ffffff"),
    neutral-darkest: rgb("#434343"),
  ),
  config-methods(
    cover: utils.semi-transparent-cover
  ),
  footer-a: self => self.info.subtitle,
)
#set text(size: 20pt)
#show link: it => underline(text(fill: rgb("#8c0000"), it))
#show figure.caption: set text(size: 0.9em)
#title-slide()
== 目录 <touying:hidden>
#align(horizon, components.adaptive-columns(outline(title: none, indent: 1em, depth: 1)))
= 引言
== 预平衡预裂变中子谱的特征
#grid(columns: 2, column-gutter: 1em, [
/ 瞬发中子: 核裂变时,大部分的裂变中子均是一裂变就立即释出,称为瞬发中子(*prompt fission neutron*).
#pause
实验中,测得的瞬发中子谱(*prompt fission neutron spectrum, PFNS*)包括了后裂变中子谱与预平衡中子谱.前者对应前三个反应道,后者对应最后一个反应道.

#pause
根据理论,预平衡预裂变谱具有两个特征:
- 预平衡预裂变中子的角分布在入射中子动量的前向方向得到增强
- 预平衡预裂变中子的角分布与裂变轴(*fission axis*)无关
],figure(image("img/1.png", height: 80%), caption: [入射中子能量与反应道的关系]))
== 预裂变中子谱与能量和角度的关系
以往的实验测量了$isotope("Th",a:232),isotope("U",a:235),isotope("U",a:238)$的中子诱导裂变(*neutron induced fission*),证实了预裂变预平衡中子的存在.

#pause
然而没有人做过连续双微分测量(*continuous double-differential*),即同时以入射中子能量,出射中子能量,测量角度作为变量测量预平衡预裂变中子的角分布.

#pause
本实验@kelly_preequilibrium_2019 首次完成这个工作,并利用FKK模型和K-M拟合方法对实验数据进行了分析.

#pause
#grid(columns: 2, column-gutter: 2em, figure(image("img/2.png", height: 55%)),figure(image("img/3.png", height: 55%)))
= 实验
== 实验装置
#grid(columns: 2, column-gutter: 1em,
[Chi-Nu实验在洛斯阿拉莫斯中子科学中心(Los Alamos Neutron Science Center at Los Alamos National Laboratory)长期运行.

Chi-Nu实验持续多年,旨在测量中子诱发裂变中释放的中子的能量谱,完成了对主要锕系元素同位素最详细的测量和误差分析.

#pause
$isotope("Pu", a:239)(n,f)$实验通过一组分布在半球面上的54个液体闪烁体探测器测量中子能谱.靶为含有锕系元素的平行板雪崩计数器.此外,所有中子都来自于标记了裂变事例的中子.
],
grid(row-gutter: 1em, rows: 2, figure(image("img/6.png", height: 55%)),figure(image("img/7.png", height: 40%))))
== 实验设置
实验测量出射中子的能谱,对于入射中子能量和测量角度,选取了如下数据:
#grid(columns: 2, column-gutter: 5em,
figure(table(columns:2, stroke: none,table.hline(), table.header([$expval(E^"inc"_n)$], [范围]),table.hline(),[12.5MeV],[12-13MeV],[13.6MeV],[13-14MeV],[14.5MeV],[14-15MeV],[16.3MeV],[15-17.5MeV],[18.9MeV],[17.5-20MeV],table.hline())),
figure(table(columns:1, stroke: none,table.hline(), table.header([出射角度]),table.hline(),[37.5$unit("d")$],[67.5$unit("d")$],[97.5$unit("d")$],[135$unit("d")$],table.hline())))
#pause
根据理论,预平衡预裂变中子的出现与入射中子能量有关.

- 入射中子能量低于12MeV,出射中子为后裂变中子,不存在预平衡预裂变中子.
- 入射中子能量高于12MeV,预平衡预裂变中子开始产生,而且随着入射中子能量的增加,能谱的硬化将更加显著.

#pause
由于更高能量入射中子的高能尾部超过了仪器的动态范围,出射中子能量最多测到13MeV.
= 实验结论
== 预裂变不平衡与入射中子能量的关系
#grid(column-gutter: 1em, columns: 2, figure(image("img/2.png",height: 80%),caption: [$isotope("Pu", a:239)(n,f)$中子的能量依赖性]),[
#pause
- 入射中子能量越高,裂变能谱的峰所对应的出射中子的能量就越高
#pause
- 裂变能谱峰值比入射中子能量低大约6MeV,这是裂变结合能的大小
])
== 预裂变不平衡与测量角度的关系
#grid(column-gutter: 1em, columns: 2, figure(image("img/3.png",height: 80%),caption: [$isotope("Pu", a:239)(n,f)$中子的角分布依赖性]),[
#pause
- ENDF/B-VIII.0 的数据与角度无关,认为是所有角度平均的结果,且不同的测量角度的计数经过了缩放,让它们在3-5MeV的能量范围内重合.
#pause
- 出射角度越接近入射中子动量的前向方向,高能部分计数越高
])
== 预裂变不平衡的各向异性验证
#grid(column-gutter: 1em, columns: 2, figure(image("img/4.png",height: 60%),caption: [$isotope("Pu", a:239)(n,f)$出射方向30$unit("d")\/$150$unit("d")$计数]),[
- 1-3MeV的出射中子主要是后裂变中子,具有高度的各向同性
#pause
- 验证了预平衡预裂变中子的各向异性,即在30$unit("d")$和150$unit("d")$方向上的计数差异
#pause
- 1-12MeV的出射中子含有预平衡预裂变中子,在$E^"inc"_n$超过16-17MeV后,高能尾部计数不再增长,这是因为超过了仪器的动态范围])
== FKK模型
本文依赖的理论模型是FKK模型(The model of Feshbach, Kerman, and Koonin)

对预裂变中子,FKK模型的MSD(multiple step direct)-MSC(multiple step compound)可以用来描述不同能量和不同角度的裂变截面@kawano_effect_2001
#pause
$ (pdv(sigma,Omega,E))^"MSC"=1/(4pi)pi/k^2 sum_J (2J+1)2pi expval(Gamma_(1 J))/expval(D_(1 J)) sum_N sum_(nu j)expval(Gamma_N^(arrow.t nu j)rho^nu (U))/expval(Gamma_(N J))product_(M=1)^(N-1)expval(Gamma_(M J)^arrow.b)/expval(Gamma_(M J)) $
#pause
$ (pdv(sigma,Omega,E))^"MSD" =sum_lambda (2lambda+1)/(2s_a +1) (mu_a mu_b)/(2pi hbar^2)^2 k_b/k_a sum_(m m_b m_a) abs(T_lambda^(m m_b m_a) (theta))^2 omega(p,h,E_x) R_n (lambda) $
其中各参数的含义详见@kawano_effect_2001,这里使用的FKK模型在后面给出了理论预测
== K-M拟合
K-M(Kalbach-Mann)拟合方法是一种用于描述MSD和MSC拟合的方法@kalbach_phenomenology_1981,描述公式为
#pause
$ (pdv(sigma,Omega,E))=&sigma_"MSD" sum_(l=0)^(l_max) b_l P_l (cos theta)\ + & sigma_"MSC" sum_(l=0, Delta l=2)^(l_max) b_l P_l (cos theta) $
由于测量预平衡中子,所以本实验中认为$sigma_"MSC"=0$,有
#pause
$ (pdv(sigma,Omega,E))=sigma_"MSD" sum_(l=0)^(l_max) b_l P_l (cos theta) $
由于拟合得到的$sigma_"MSD"$包括真实的MSD截面和实验参数,所以本文没有提交$sigma_"MSD"$的数值,而是只给出了拟合曲线
== 结果
#figure(image("img/5.png",height: 70%), caption: [$isotope("Pu", a:239)(n,f)$的角分布实验数据与拟合分析]) <fig5>
在PFNS谱中将预平衡预裂变中子从后裂变中子本底中分离出来之后,利用MCNP6对中子探测效率和环境散射进行了修正,得到@fig5 展示的结果
== 讨论
#grid(column-gutter: 1em, columns: (1.5fr,1fr), figure(image("img/5.png",width: 100%),caption: [$isotope("Pu", a:239)(n,f)$的角分布实验数据与拟合分析]),[
- K-M方法能够很好地拟合据的角分布特性,适合描述预裂变预平衡中子的角分布
- FKK模型的估计值在这里没有给出绝对截面,因此给出的曲线是缩放过的.FKK模型与实验结果符合得很好,证实了预平衡预裂变中子与裂变轴(*fission axis*)无关
/ 贡献: 准确测了预裂变中子的角分布,未来的裂变模型需要符合这一实验结果
])
= 总结
#slide[
- 为了建立更全面完整的中子诱发核裂变模型，需要严谨地测量出射中子的能谱和角分布等性质并细化区分
- 针对出射中子束流的角分布,以往的理论模型预测不能令人满意.例如
  - 激子模型(*exciton model*)仅适用于预测能量分布,对角分布无能为力
  - FKK模型采用了简化假设,其实用性有待进一步验证
- 因此，基于双微分测量方法给出具体的角分布数据,对于理论模型的验证和完善具有重要意义
- 本实验通过调节入射中子束流的能量和测量角度,测量瞬发中子谱并进行中子计数,从多个角度验证了预平衡预裂变中子的性质,尤其关注
  - 角分布的各向异性:分布在入射中子动量的前向方向得到增强,且与裂变轴无关
  - 能量分布的"硬化(*harder*)":随着入射中子能量的增加,预平衡预裂变中子的平均能量有所上升
- 此外,本实验结合了FKK模型和K-M拟合方法,对实验数据进行了分析,为理论模型的验证提供了重要的数据支持
]
#show: appendix
#set text(lang: "en", region: "us")
#bibliography("main.bib", style: "american-physics-society", title: "参考文献")
