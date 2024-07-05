#set text(
  font: ("Linux Libertine", "Source Han Serif"),
  lang: "en",
  region: "us",
)
#show link: it => underline(text(fill: rgb("#8c0000"), it))
#let subft = it => text(10pt)[#it]
#let title = "Radiation Spectroscopy of Gamma-Rays"
#let author = "杨哲涵"
#set document(title: title, author: author)
#set page("a4", numbering: "1", margin: (x: 1.2cm, y: 1.2cm))

#set math.equation(numbering: "(1)", supplement: [Eq.], number-align: bottom + right)

#set heading(numbering: "1.")

#import "@preview/physica:0.9.3": *

#set page(columns: 2)
#align(center, text(17pt)[
  *#title*
])

#align(center, text(13pt)[
  工物22 #author _2022011105_
])

My reference is the book #link(
  "https://indico-tdli.sjtu.edu.cn/event/171/contributions/2123/attachments/982/1592/Knoll4thEdition.pdf",
)[_Radiation detection and measurement, 4th ed_] by Glenn F. Knoll. And in this
arctile I will follow the structure of Chapter 10 in the book and discuss the
critical mechanisms of gamma-ray spectroscopy with scintillators.

= Introduction

X-ray or gamma-ray photons are uncharged and therefore primarily invisible to
the detector. The key of detecting them is to first convert incident photons
into fast electrons and then collect these electrons.

Since the stopping power of gases is low, e.g. 1 MeV electron in STP gases can
penetrate for several meters and most gamma-ray incuded pulses from a gas-filled
counter actually arise from the solid counter wall and have lost varialbe energy
in the wall, gas-filled detectors are not suitable for gamma-ray spectroscopy.

The thallium-activated sodium iodine scintillation detector arose in the 1950s
have proven the effectiveness of scintillation detectors in gamma-ray
spectroscopy.

= Review on Gamma-Ray Interactions

In Chapter 2 we have studied the three interaction mechnisms of significance in
gamma-ray spectroscopy. The dominant parameters in these three interactions are $h nu$,
the photon's energy and $Z$, the atomic number of the absorbing material.

#figure(
  image("3compare.png"),
  caption: [Relative importance of three main gamma-ray interactions],
)

== Photoelectric Absorption

Photoelectric absorption is an interaction that absorbs the photon and emits a
photoelectron of the energy:
$ E_(e^-)=h nu-E_b $
Where $E_b$ is the binding energy and is in the form of a characteristic X-ray
or Auger electron#footnote[Auger electrons have extremly short range because of their low energy].
Most possibly, photoelectron emerges from the K shell, whose typcial binding
energy ranges from few keV ($isotope(z: 11, "Na")$, 1keV) to hundred keV($isotope(z: 88, "Ra")$,
100keV).

== Compton Sacttering

The result of Compton scattering is a scattered photon and a recoil electron.
$ h nu'&=(h nu)/((1+(h nu)\/ m_0 c^2)(1-cos theta))\ E_(e^-)&=h nu - h nu' $
The angular distribution of scattered gamma rays is predicted by the
Klein-Nishina formula and is ploted polarly in @comptonscatter.

$ dv(sigma, Omega)=Z r_0^2 (1/(1+alpha(1-cos theta)))^2((1+cos^2theta)/2)\ (1+(alpha^2(1-cos theta^2))/((1+cos^2theta)(1+alpha(1-cos theta))))\ alpha=h nu \/ m_0 c^2, r_0 ="classical electron radius" $

#figure(grid(
  columns: 2,
  row-gutter: 2mm,
  image("compton-edge.png"),
  image("klein.png"),
  subft("Compton edge"),
  subft("Klein-Nishina formula"),
), caption: [Compton sacttering]) <comptonscatter>

And generally the shape of the electron energy distribution has a so-called
Compton edge.

== Pair Production

The process occurs in the intense electric field near the protons in the nuclei
of the absorbing material and corresponds to the creation of an
electron-positron pair at the point of complete disappearance of the incident
gamma-ray photon.
$ E_(e^-)+E_(e^+)=h nu-2m_0 c^2 $
Once the kinetic energy of the positron is lost, it will annihilate with or
combine with a normal electron in the absorbing medium, which will make the
spectroscopy analysis more complicated as we shall see later.

= Predicted Response Function

We have discussed the three main mechanisms of gamma-ray interactions. Their
simplest energy spectrum of their own is presented in @3simpleinteractons.

#figure(grid(
  columns: 3,
  row-gutter: 2mm,
  image("photoelectric.png"),
  image("compton-edge.png"),
  image("pairproduction.png"),
), caption: [Three main mechanisms in gamma-ray interactions]) <3simpleinteractons>

== Ideal Case of Intermediate Detectors

As for practical detectors, the actual response is much more complicated. All
these interactions take place and the properties of the detector material and
the geometry of the detector will affect the response function as well as the
cirumstances.

#figure(grid(
  columns: 2,
  row-gutter: 2mm,
  image("smalldetector.png"),
  image("largedetector.png"),
  image("smalldetectorre.png"),
  image("largedetectorre.png"),
), caption: [Small detector VS extreme large detector]) <detectorsize>

As stated in @detectorsize, the spectrum depends on whether all primary and
Secondary interactions happen within the active volume of the detector or not.

The real detectors are all of medium size and we can never achieve the ideal
case of all interactions happening within the active volume since there are
always interactions near the entrance surface.

#figure(grid(
  columns: (55%, 45%),
  image("middetector.png"),
  image("middetectorre.png"),
), caption: [Real detector]) <realdetector>

It's worth mentioning that there is #quote[Multiple Compton events]. The
multiple Compton events arise from the escape of the final scattered photons,
which can thus partially fill in the gap between the Compton edge and the
photopeak.

== Complications in the Real Response

There are several more complicated cases than those shown in @realdetector.

=== Secondary Electron Escape

Especially for high energy gamma-rays, the Secondary electrons may escape the
active volume since their range is larger than the size of the detector. This
effect will alter the shape of the Compton continuum and lower the photofraction
due to envents loss from the photopeak.

=== Bremsstrahlung Escape

Radiative processes for charged particles due to coulomb interactions are
Bremsstrahlung, where energy converts into electromagnetic radiation. The linear
specific energy loss is:
$ -(dv(E, x))_r=(N E Z (Z+1)e^4)/(137 m_0^2 c^4)(4 ln (2E)/(m_0c^2)-4/3) $

Again for high energy (few MeV and above) gamma-rays and high atomic number
absorber case, the Bremsstrahlung loss is of importance.

=== Characteristic X-ray Escape

#figure(image("xrayescape.png", width: 80%), caption: [X-ray escape mechanism]) <xrayescape>

Normally characteristic X-ray emission is reabsorbed near where it is produced.
But if the photoelectric absorption occurs near a surface of the detector, the
X-ray may escape and so does its energy. This gives rise to a new peak below the
full energy photopeak. Usually we can only distinguish the K-shell X-ray escape
peak from the photopeak.

=== Secondary Radiations Created Near the Source

==== Annihilation Peak

If the gamma-ray source happens to emit positrons, a peak of 0.511 MeV will rise
since the positron will annihilate when stopped in the surrounding covering.
Sometimes if the detector can detect both annihliation photons simutaneously, a
peak of 1.022 MeV will appear.

==== Bremsstrahlung

Most commonly available gamma-ray sources are $beta^-$ emitters at the same
time. And Bremsstrahlung photons (low energy most possibly) will contribute to
the spectrum due to absorption of $beta^-$ decays in the encapsulation. So use
of low atomic number absorbers will help minimize the generationn of
Bremsstrahlung.

=== Effects of Surrounding Materials

==== Backscatterd Gamma-Rays

As discussed before, the energy of backscattered photon is: $ eval(h nu')_(theta=pi)=(h nu)/(1+2h nu\/ m_0c^2)\ $
And in the limit of $h nu >> m_0c^2$, the energy reduces to $m_0c^2\/ 2$. The
backscatter peak always occurs at 0.255 MeV or less.

#figure(grid(
  columns: 2,
  column-gutter: 2em,
  image("backscattered.png"),
  image("backscatteredre.png"),
), caption: [Backscatterd gamma-rays])

==== Other Secondary Radiations

Other interaction of the primary gamma-rays in the surrounding materials, for
example, characteristic X-rays, will reach the detector and produce noticeable
peaks. One method to reduce the effect is to use graded shields consisting of
high-Z bulk and low-Z inner layers. The inner layers will absorb the strong
characteristic X-rays from the bulk and only emit weak X-rays on their own.

Another effect of high energy primary gamma-rays is the enhanced pair production
process within high-Z surrounding materials.

// === Summation Effects

// Sum coincidence peak is the result of two (or more) gamma-ray photons being
// detected simutaneously (or short compared to the resolving time of the
// detector).

// Let $epsilon$ be the intrinsic peak effeiency of the detector, $Omega$ the
// fractional solid angle subtended by the detector. The full

=== Coincidence Methods in Gamma-Ray Spectrometers

To achieve ideal delta response function, some steps are taken at the price of
added complexity. For the case of sodium iodide spectrometers, the most common
methods involve the use of an annular detector surrounding the primary crystal
for Compton suppression by anticoincidence.

And here is an example from germanium detectors in @comptonsuppress, coincidence
detection of the escaping photons in a surrounding annular detector(BGO and
NaI(Tl)#footnote[BGO has the strong advantage that its high density and atomic number allow a
  more compact configuration compared with a sodium iodide detector of the same
  detection efficiency.])

#figure(
  grid(
    columns: 2,
    column-gutter: 2em,
    image("geanticompton.png"),
    image("geanticomptonef.png"),
    subft[BGO and NaI(Tl) scintillators combined Compton suppression system],
    subft[#grid(
        columns: 1,
        row-gutter: 1em,
        align: left,
        [(a):unsupressed],
        [(b): suppressed],
      )],
  ),
  caption: [Anticoincidence Compton Suppression],
) <comptonsuppress>

= Properties of Scintillation Gamma-Ray Spectrometer

== Response Function

Sodium iodide (NaI) gained popularity due to the high atomic number ($Z = 53$)
of its iodine component, which enhances photoelectric absorption, resulting in
high intrinsic detection efficiency and a large photofraction. This combination
has led to the success of NaI scintillation spectrometers. Despite newer
scintillators like LaBr3(Ce) offering higher light yield and better energy
resolution, NaI(Tl) remains widely used due to its balance of low cost,
availability, and adequate performance. Detailed studies and extensive
experimental data on NaI(Tl) have further solidified its reliability and
predictability in gamma-ray spectroscopy. NaI(Tl) also shows significantly
better energy resolution compared to materials like BGO (see to @naivsbgo).

#figure(
  image("naivsbgo.png"),
  caption: [Comparative pulse height spectra measured for BGO and NaI],
) <naivsbgo>

Due to the challenges in experimentally measuring the gamma-ray response
function across all energies, calculations using the Monte Carlo method (see
@montecarlodeconvolution) are essential, as they effectively model complex
interactions within detectors. Additionally, for organic scintillators, which
have low photoelectric interaction probabilities, deconvolution techniques can
enhance gamma-ray spectra analysis (see @montecarlodeconvolution). These
methodologies underscore the critical role of advanced computational and
analytical techniques in gamma-ray spectroscopy.

#figure(grid(
  columns: (40%, 60%),
  column-gutter: 2em,
  image("montecarlo.png"),
  image("deconvolution.png"),
  subft[#grid(
      columns: 1,
      row-gutter: 1em,
      align: left,
      [points: measured],
      [line: Monte Carlo],
    )],
  subft[example of the application of deconvolution methods],
), caption: [Anticoincidence Compton Suppression]) <montecarlodeconvolution>

== Energy Resolution

The energy resolution $R$ is defined as $ R="FWHM"/H_0\ "where" H_0="mean pulse height" $

As argued in Chapter 4, the finite energy resolution of any detector may contain
contributions resulting from the effects of charge collection statistics,
electronic noise, variations in the detector response over its active volume,
and drifts in operating parameters over the course of the measurement.

Howerver, the charge collection statistics, i.e. photoelectron statistics is the
dominant factor in the energy resolution of scintillation detectors.

Therefore $ R="FWHM"/H_0=K sqrt(E)/E prop 1/sqrt(E) $

If we take logarithm of both sides, we derive $ ln R=ln K -1/2 ln E $

And a more adequate representation of measured data takes the form $ R=sqrt(alpha + beta E)/E $ where $alpha, beta$ are
constants particular to any specific scintillator-PMT combination.

#figure(
  image("rlineartoe.png", width: 80%),
  caption: [Measured $ln R$ vs $ln E$ from a NaI(Tl) detector],
)

There are still other factors that affect the energy resolution, which include:
- variations in light generation and measurement
- non proportionality of light yield
- long term drift

== Engergy Calibration

Perfect proportionality between light output and deposited energy in
scintillators would yield a linear calibration of pulse height or centroid
channel number for full-energy peaks vs gamma-ray energy.

However, due to inherent nonproportionality in scintillator responses to fast
electrons, calibrations typically exhibit some nonlinearity, resulting in curved
peak positions specific to each detector.

But normally the assumption of linearity leads to negligible error.

#figure(
  grid(
    columns: (40%, 60%),
    column-gutter: 2em,
    image("comlexenergyorigin.png"),
    image("energynonlinearity.png"),
    subft[representation of the possible origins of electrons and photons #footnote[following the photoelectric absorption of an incident X-ray or gamma ray with
        energy $E$ that is above the K-shell binding energy of 33.17 keV]],
    subft[measured light output per unit deposited energy for Nal (Tl), normalized to
      unity at 88 keV],
  ),
  caption: [Complex energy origin and non linearity response],
) <energynonlinearity>

The measured relative light output from sodium iodide over the low energy range
is presented in @energynonlinearity. There is a dip near the K-shell absorption
edge of iodine. The response of the scintillator actually depends on the energy
that is deposited by secondary electrons produced by the incident photon, and a
complex mix of photoelectrons and/or Auger electrons will result from various
types of photon interactions.

== Detection Efficiency

Common application of sodium iodide scintillators is to measure the absolute
intensity, which requires a prior knowledge of the effeiency of radiation
detector. And published data on the detection efficiency of NaI(Tl) detectors
are undoubtedly abundant.

#figure(
  image("absorptionefficiency.png"),
  caption: [Absorption efficiency of NaI of different thicknesses],
),

#set page(columns: 1)

#set heading(numbering: none)

= Appendix

== Periodic Table

#figure(image("periodictable.png"), caption: [Periodic Table]),

== Terminologies

#show: rest => columns(2, rest)

I refered to #link("https://data.gov.tw/dataset/15418")[電機工程學術名詞] for the
translation of some terms.

#figure(table(
  stroke: none,
  columns: (auto, auto, auto),
  align: horizon,
  table.hline(),
  table.header([*ABBR.*], [*Term*], [*术语*]),
  [],
  [attenuation],
  [衰减],
  [],
  [deposit],
  [沉积],
  [STP],
  [standard temperature and pressure],
  [标准状况],
  [],
  [recoil],
  [反冲],
  [],
  [photopeak],
  [光电峰],
  [],
  [photofraction],
  [峰总比],
  [],
  [encapsulation],
  [封装],
  [],
  [graded shield],
  [梯度屏蔽],
  [],
  [true coincidence],
  [真符合],
  [],
  [chance coincidence],
  [偶然符合],
  [],
  [sum peak],
  [和峰],
  [BGO],
  [bismuth germanate oxide],
  [锗酸铋],
  [],
  [scintillation efficiency],
  [闪烁效率],
  table.hline(),
), caption: "Terminologies")