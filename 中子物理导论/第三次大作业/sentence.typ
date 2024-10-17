// #set heading(numbering: none)
#set text(font: ("Linux Libertine","Noto Serif CJK SC"), lang: "zh", region: "cn")
#set enum(numbering: "(1)")
#let neq = $eq.not$

= Spin Dependence of the u235 Low-Energy Neutron Cross Section
== Introduction
- Although the low-energy neutron cross section of u235 has been the subject of intensive study, no completely satisfactory analysis of it in terms of resonance theory has been possible. The difficulty originates:
    + fission is a few channel process
    + the fission widths of the levels are comparable to their spacings
  Thus there is appreciable interference between resonances in the same spin state and as a consequence the simple Breit-Wigner single-level formula is inadequate for the resonance analysis.`proceedings of the international conference on the peaceful uses of atomic energy`
- We need a more general approach such as the Wigner-Eisenbud formalism `Resonance Reactions
Eugene P. Wigner
Phys. Rev. 70, 606 – Published 1 November 1946`&`Higher Angular Momenta and Long Range Interaction in Resonance Reactions
E. P. Wigner and L. Eisenbud
Phys. Rev. 72, 29 – Published 1 July 1947`
- In principle, the resulting multilevel analysis should provide the basis for a complete description of the cross section; however, in practive, there is no systematic way to apply it to U235. 
- *The problem is that* the levels which interfere have to be specified in order to get a unique set of parameters from the analysis. There is no objective procedure, bases on the cross-section data alone, for grouping the resonances according to spin
- The large thermal cross section of U235 is *also difficult to explain*.
- According to the difficulty to explain the large thermal cross section of u235, like "negative energy" resonances disturbing, *the interpretation of the cross section cannot avoid being indeterminate to some degree*, and the derived resonoance parameters will depend on the initial assumptions.
  + Shore and Sailor `Slow Neutron Resonances in U235
F. J. Shore and V. L. Sailor Phys. Rev. 112, 191 – Published 1 October 1958` assumed that the lowest observable resonances at 0.28 and 1.14 eV interfere with each other but not with the negative level. Vogt and Gordeev also made the same assumption.
  + Kirpichnikov`Measurement of ν and partial cross sections of 235U and 239Pu for neutrons of resonance energies☆Author links open overlay panel K.G. Ignavev, I.V. Kirpichnikov, S.I. Sukhoruchkin` concluded that the cross section was better fitted if the 0.28- and 1.14-eV resonances were assumed to be in opposite spin states while the 1.14-eV resonance interfered with a level below the neutron binding energy. This assignment is supported by Dabbs, Walter, and Parker's study of the directional distribution of fission fragments from aligned nuclei.
- Also other difficulties with interpretation of the cross sections of the fissile nuclei. Using the formulas of multilevel theory, Lynn `cite 8` has shown that when level widths are comparable to level spacings, the shape of the cross section becomes so distorted that a single peak can frequently be associated with several closely spaced levels. *And* this situation very probably occurs in all the common fissile nuclei. Evidence from `cite 9/10`. Lynn suggests that the discrepancy occurs because not all of thelevels are correctly identified and accounted for in the analyses. Michaudon `cite 11` has also reached this same conclusion from a statistical analysis of the observed resonance structure of the cross section.
- it is difficult to decide at this stage ho serious an bostacle undetected resonances will ultimately be to an improved resonance analysis, nevertheless *it is obvious that an experimantal determination of the spin dependence of the cross serction will eliminate at least one of the major sources of difficulty(motivation for this work)*
- Aside from the resonance analysis, there is also interest in the more basic question of a possible correlation between the spins of the resonances and their fission widths. A contradiction is derived from collective model analysis`cite 10`.
== Theory of the Measurement
=== Cross Section
- The detail of the method used to determine the spin dependence of the cross section is described in `cite 12-14` `Spin Assignments of Low-Energy Resonances Using Polarized Neutrons and Polarized Sm149 Nuclei H. Marshak, Hans Postma, V. L. Sailor, F. J. Shore, and C. A. Reynolds Phys. Rev. 128, 1287 – Published 1 November 1962`&`Absolute determination of spins of neutron resonances in terbium-159 by a weighting factor method using polarized neutrons and a polarized Tb-target☆Author links open overlay panel H. Postma †), F.J. Shore ††), C.A. Reynolds ∗∗)`&`Spins of Neutron Resonances and the Hyperfine Coupling Constant in Gadolinium Metal F. J. Shore, C. A. Reynolds, V. L. Sailor, and G. Brunhart Phys. Rev. 138, B1361 – Published 21 June 1965`Briefly review: The cross section in the interaction of polarized neutrons with polarized nuclei is given by $ sigma=I/(2I+1)(1-f_N f_n)sigma_-+(I+1)/(2I+1)(1+I/(I+1)f_N f_n)sigma_+ $ where $f_n,f_N$ are the nrutron and nuclear polarizations, while $sigma_-,sigma_+$ are the cross sections for interaction in the states $J=I-1/2$ and $J=I+1/2$, respectively. We can also separate this expression into polarization-independent and polarization-dependent parts: $ sigma=sigma_0+f_N f_n sigma_p $ $ sigma_0=(I+1)/(2I+1)sigma_++I/(2I+1)sigma_-=sigma_(I+1/2)+sigma_(I-1/2) $ $ sigma_p=I/(2I+1)(sigma_+-sigma_-)=I/(I+1)sigma_(I+1/2)-sigma_(I-1/2) $
=== Transmission Effect
The transmission $T_P$ through the target when the neutron beam is polarized parallel to the applied magnetic field H will be different from the transmission $T_A$ when it is antiparallel to H. This is conveniently expressed by the _transmission effect_ $ cal(E)=(T_P-T_A)/(T_P+T_A) $ 

$ cal(E)approx -1/2 (1+phi)f_n tanh[(sigma_P/sigma_0)f_N N sigma_0 t] $
Since the latter part is usually $<< 1$, good approximation: $ cal(E)approx -1/2 (1+phi)f_n (sigma_p/sigma_0) f_N N sigma_0 t $
If the resonances are well enough separated so that there are energy regions where te cross section is essentially all in one or the other spin state, the quantity of cross section fraction can be fixed on at most two alternatives. And it is possible to make absolute spin assignments without knowing the sign of $f_N$`cite 13/14`. This can be done by taking advantage of the fact that the differences in the magnitude of $sigma_p/sigma_0$ will be reflected in the relative magnitude of the transmission effect observed at individual resonances. Unfortunately, this procedure is *impossible* in u235 in the thermal region where the resonance structure is very poorly defined. It therefore becomes necessary to know the magniture and sign of the nuclear polarization $f_N$ to determine the magnitude and sign of the cross section fraction.
== Description of the Experiment
=== Polarized Neutron Spectrometer and Associated Cryogenics
The apparatus:
- a polarized neutron crystal spectrometer with a target cryostat mounted on the spectrometer arm. Designed to produce polarization by static methods and contains a two-stage adiabatic demagnetization refrigerator which will maintain targets in a magnetic field of up to 15kOe('Oe' is magnetic filed strength unit, A/m) at temperatures below 0.1K for times in excess of 8h
- Iron ammonium alum. Used for both refrigerating salts.
- Superconducting Pb switches. Make thermal contact both between the upper salt and the 0.95K kuqyud0helium bath, and between the two salts.
- copper conductor connected to the lower paramagnetic salt. Cool the target.
=== Polarized $U^235$ Targets
Static methods have been widely used on a variety of nuclei to produce significant nuclear polarization, but *u235 presents a number of problems*, making it a difficult material for a polarized target
+ the nuclear moment of u235 is small and the spin is large, consequently a given field gives a comparatively small polarization
+ speciments of u235 are hard to cool to low temperatures because of heating from $alpha$ decay`cite 16` #block(fill:rgb("D3D3D3"), width: 100%, inset: 5pt, radius: 5pt)[the major part of $alpha$ activity normally associated with u235 specimens is actually due to u234 contamination.if containing less than 0.1% u234, the $alpha$ heating due to u234 is only about twice that of u235]
+ the magnetic properties of most uranium compounds have not yet been completely investigated, making the choice of a suitable chemical compound for the target very difficult.

To make absolute spin assignments for the u235 resonances, it is necessary to know the sign of the hyper interaction which defines the sign(direction) of the nuclear polarization $f_N$. In case the magnitude of $sigma_p/sigma_0$ is of interast, it is necessary to determine the magnitude of $f_N$, depends on target properties:
+ the size of the hyperfine interaction
+ the degree of magnetic saturation of the target
+ the temperature of the nuclear spin system

==== To make appropriate target
- they tried several materials to develop polarized u235 target, eventually only $U_x L a_(1-x) C l_3$ produced sufficient polarization to allow the measurements with good statistical accuracy.
- The metallic uranium target is in the form of a slab, sprayed with tin and soldered into a copper jacket so as to get good heat transfer at the interface. The copper jacket was soldered to a bundle of copper wires, the other ends of which were grown into the refrigerating salt. All soldered joints were located in regions of large magnetic fields to avoid superconducting interfaces.u234 content was only 0.1%
- $"UFe"_2$ intermetallic compound. 
- Uranium Trichloride. Since u la cl is a poor thermal conductor, it also was prepared as a pressed powder garget.
- the concentration of $U^(3+)$ in the trichloride targets was determined by chemical analysis, and uranium concentration was selected by the criteria that $cal(E)$ be maximized for a given thickness t. this occurs when the product $f_N N(U^235)$ is maximized. By measueing magnetization on samples of u la cl, they found that at helium temperatures in moderate magnetic fields, approximate magnetic saturration occurs for $x<approx 0.2$. And on this basis that a $20% U^235$ concentration was chosen.`cite 19` (its magnetic properties do not change over the temperature range ofthe measurements when x< 0.2)

== Experiment and Results

=== Experimental Setup
The experimental apparatus consisted of a polarized neutron crystal spectrometer with a cryogenic target mounted on the spectrometer arm. The cryostat was designed to produce polarization through static methods, with an adiabatic demagnetization refrigerator capable of maintaining the target at temperatures below 0.1 K for extended periods. The polarization of U-235 nuclei was a key challenge due to their weak magnetic moments and heat generated from alpha decay, predominantly from U-234 contamination.

Three types of targets were developed:

Uranium metal: Mounted in a copper jacket for thermal conductivity.
UFe2 intermetallic compound: Sintered with lead powder to improve heat dissipation.
Uranium trichloride $U_x L a_(1-x) C l_3$. This compound showed sufficient polarization to allow reliable measurements.
=== Results
The measurements, taken with targets of differing uranium concentrations, showed the spin dependence of the U-235 neutron cross section up to 2.04 eV. The key findings were:

The 0.275-eV and 1.14-eV resonances are in opposite spin states.
The thermal cross section is primarily in the same spin state as the 1.14-eV resonance.
The 2.08-eV resonance is probably in the same spin state as the 0.275-eV resonance.
The measurements support the assumption that U-235 has a negative magnetic moment, assigning $J=I+1=4$ to the 1.14-eV resonance and $J=I−1=3$ to the 0.275-eV resonance.

== Discussion
These results are consistent with previous studies, such as those by Dabbs et al., and contradict some earlier analyses like Kirpichnikov's, which postulated only one negative resonance. The variation in cross-section fraction at different energies suggests that the large thermal cross section involves contributions from multiple spin states.

Finally, no evidence of a hyperfine interaction was found in U-235 metal, although a negative hyperfine field was detected in UFe2.