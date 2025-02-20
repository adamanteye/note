#import "../../note_en.typ": *
#show: conf.with(
  title: "Notes on Observational Astronomy",
  author: "adamanteye",
)
#show: rest => columns(2, rest)

Our textbook is _Obeservational Astronomy_ (Birney)

= Locating
== Coordinates
/ Hour angle: the angle between the meridian and the object
== Perform real observations
- Site's info (*latitude*)
- Target's info (*RA*, *DEC*)
- When to observe your star (*hour angle*)
== Correction
/ precession:
/ proper motion: an example of correcting proper motion
```py
from astropy import units as u
from astropy.coordinates import Angle

year = 2023
# See https://simbad.harvard.edu/simbad/sim-basic?Ident=55+cnc
pm_ra = -485.681e-3
pm_dec = -233.517e-3
ra = 3600 * 8 + 52 * 60 + 35.8111044043
ra *= 15
dec = 3600 * 28 + 19 * 60 + 50.954994470

dra = (year - 2000) * pm_ra
ddec = (year - 2000) * pm_dec

dec = Angle((dec + ddec) / 3600, unit=u.deg)
ra = Angle((ra + dra) / 3600, unit=u.deg)
print(
    "55 Cnc",
    ra.to_string(unit=u.hour),
    dec.to_string(unit=u.deg),
    "Year",
    year,
    "proper motion corrected",
)
```

= Light
== Convention
#figure(
  table(
    stroke: none,
    columns: 2,
    table.hline(),
    table.header([*Regoin of spectrum*], [*Units*]),
    table.hline(),
    [gamma rays],
    [MeV, GeV],
    [x-ray],
    [KeV],
    [Ultraviolet],
    [$angstrom$],
    [infrared(near-IR, IR, far-IR)],
    [$unit("micro meter")$],
    [microwave],
    [$unit("mm")$],
    [radio],
    [$unit("cm")$,$unit("m")$,$unit("MHz")$,$unit("GHz")$],
    table.hline(),
  ),
  caption: [The language of light],
)
== Magnitude
/ pogson equation: relationship between magnitude and flux (apparent brightness)
$ m_1-m_2=-2.5log(F_1/F_2) \ m=-2.5 log(F)+C $
$ Delta m=-1.086 (Delta F) / F approx -(Delta F) / F $
/ monochromatic version of Pogson equation: applying to a range of wavelengths
$ m_lambda=-2.5 log(F_lambda)+C_lambda $
/ bolometeric magnitude: all the electromagnetic radiation is included
/ bolometeric correction: difference between the bolometeric magnitude and the magnitude in some passband
$ "BC"_"band"=m_"bol"-m_"band" $
/ absolute magnitude: the apparent magnitude of an object if it were 10 parsecs away
/ distance modulus: the difference between the apparent and absolute magnitude
$ m-M=5log(d/10)=5log(d)-5 $
/ apparent distance modulus: $A_lambda$ is the absorption in magnitudes at wavelength $lambda$ or in a
  passband
$ (m-M)_lambda=(m-M)_0 +A_lambda $
/ absolute bolometeric magnitude: the luminosity of a source in terms of Sun's luminosity
$ M_"bol"=4.74-2.5 log(L/L_"sun") $
/ surface brightness: the total magnitude corresponding to the average flux in one $upright("arcsec"^2)$
$ mu=m+2.5log(Omega) $
where $m$ is the magnitude and $Omega$ is the solid angle of the source in units
of $upright("arcsec"^2)$.
/ color index: the difference between the magnitudes of an object in two passbands
/ magnitude zeros: a reference point for the magnitude scale
== Filters
#figure(
  image("filters-system.png", width: 80%),
  caption: [Photometric filters],
)
#figure(
  image("atmospheric_opacity.svg", width: 90%),
  caption: [Atmospheric electromagnetic opacity],
)
== Flux
/ energy flux: amount of light energy per unit in a given bandpass
$ F=E_"band" / (dd(A) dd(t)) "in unit of" unit("W/cm^2") $
/ monochromatic flux: energy flux in a single wavelength or frequency
$
  F_lambda&=E_lambda / (dd(A) dd(t) dd(lambda)) "in unit of" unit("erg/s/cm^2")angstrom^(-1) \ F_nu&=E_nu / (dd(A) dd(t) dd(nu)) "in unit of" unit("erg/s/cm^2/Hz") \ nu F_nu &= lambda F_lambda
$
== Blackbody
/ Wien's displacement law: as the temperature increases, the peak of the blackbody spectrum shifts to
  shorter wavelengths
$ lambda_"max"=2900000 / T "in units of K and nm" $
#figure(
  image("blackbody-radiation.jpg", width: 95%),
  caption: [Blackbody radiation],
)
= Stars
/ OBAFGKM: the spectral classification in descending effective temperature
#figure(
  image("stellar-classification-1.png", width: 70%),
  caption: [Stellar classification],
)
#figure(
  image("stellar-classification-2.png", width: 95%),
  caption: [Stellar spectrum],
)
= Observations
== Distance
/ parallax: the apparent shift in the position of a nearby star relative to the background $ d=1/p $
$p$ is measured in arcsec and $d$ in pc.
$ 1"pc"=3.2615637769"ly" $
#figure(image("parallax.png", width: 90%), caption: [Parallax])
== Size
$ L=cal(F)4pi r^2 $
$ L=4pi R^2 sigma T_"eff"^4 $
== Mass
/ Virial theorem: $ 2K+V=0\ 2sum_i 1 / 2 m_i v_i^2-sum (G m_i m_j) / r_(i j)=0\ (G M) / R=sigma^2 $
== Age
#figure(
  image("hr-diagram-age.png", width: 80%),
  caption: [Comparing ages of clusters],
)

= Telescope
#figure(
  image("types-of-telescopes.png", width: 80%),
  caption: [Types of telescopes],
)
#figure(image("types-of-focus.png", width: 85%), caption: [Types of focus])
== Parameters
/ mount: how the telescope is supported and pointed
- equatorial mount
  - German
  - English yoke
  - English cross-axis
  - Fork
- alt-az mount
/ image formation: 2 beams of light separated by an angular distance are focused to 2 points
$ S=F tan(theta) approx F theta $
/ plate scale: angular size of the object per unit length on the plate
$ P_s=theta / S=1 / F $
/ image scale: how much of the sky in arcsec each and every pixel can see $ (206.2648 times "pixel size"_"in µm") / F_"in mm" $
see also to #link(
  "https://www.cloudynights.com/topic/777087-please-explain-image-scalepixel-scale-to-me/",
)[explain image scale].
/ limiting magnitude: the magnitude of the faintest star an average observer is likely to see through
  the telescope
$ M_L approx 2.7+5log(d) $
where $d$ is the objective lens diameter in millimeter
/ focal ratio:
$ R=F / D "as" E prop D^2 / F^2 $
/ field of view:
$ "fov"=2arctan(w/(2 f))\ "where" w "is the sensor width" $
#figure(image("fov.png", width: 80%), caption: [Field of view])
== Resolution
/ #link("https://en.wikipedia.org/wiki/Airy_disk")[Ariy disk]: The circular aperture has a diffraction pattern described by the Bessel
  function, whose first zero is at 1.22
$ sin theta=1.22 lambda / d $
/ #link("https://en.wikipedia.org/wiki/Astronomical_seeing")[Seeing]: the degradation of the image of an astronomical object due to turbulence in the
  atmosphere of Earth that may become visible as blurring, twinkling or variable
  distortion. The strength of seeing is often characterized by the angular
  diameter (FWHM) of the long-exposure image of a star (seeing disk) in unit of
  arcsec.

= CCD
#figure(image("pixelofccd.png", width: 80%), caption: [Single pixel of CCD])
#figure(
  image("ccdvscmos.png", width: 90%),
  caption: [Image formation: CCD vs CMOS],
)
/ Quantum Efficiency: the fraction of photons that are converted into electrons
#figure(image("ccdqesensitivity.png", width: 80%))
/ ADU: #link("https://www.cloudynights.com/topic/417383-what-is-adu/")[What is ADU]
== Image reduction
$ "reduced"=("science"-"dark"-"bias") / ("flat"-"dark"-"bias")_"normailzed" $
== Noise
/ SNR: signal to noise ratio
#figure(
  image("long-exposure.jpg", width: 90%),
  caption: [Long exposure to boost SNR],
)
/ CCD equation:
$ S_"net"=(S+B) - B_"estimated"-D $
$ B_"estimated"=n_s / n_B B_"total" $
$ sigma_B=n_s^2 / n_B^2 B_"total" $
$ "SNR"=S_"net" / sqrt(S_"total"+sigma_B^2+N_d+n_s N_r^2) $
#table(
  stroke: none,
  columns: (auto, auto, auto),
  align: horizon,
  table.hline(),
  [$I$],
  [photon flux],
  [photons per second],
  [],
)
/ Howell, Koehn, Bowell, Hoffan equation:
= Spectroscopy
/ #link("https://en.wikipedia.org/wiki/Redshift")[Redshift]: $ z=(lambda_"obs"-lambda_"emit") / lambda_"emit" $
= Concepts and their translations
中文术语参考自#link("https://nadc.china-vo.org/astrodict/")[天文学名词]
#table(
  stroke: none,
  columns: (auto, auto, auto),
  align: horizon,
  table.hline(),
  table.header([*ABBR.*], [*Concepts*], [*术语*]),
  [],
  [barycenter],
  [质心],
  [],
  [heliocentric],
  [日心],
  [],
  [azimuth axis],
  [方位轴],
  [],
  [sidereal time],
  [恒星时],
  [LST],
  [local sidereal time],
  [本地恒星时],
  [GST],
  [greenwich sidereal time],
  [格林威治恒星时],
  [],
  [epoch],
  [历元,时期],
  [RA],
  [right ascension],
  [赤经],
  [DEC],
  [declination],
  [赤纬],
  [],
  [zenith],
  [天顶],
  [ICRS],
  [international celestial reference system],
  [国际天球参考系],
  [],
  [meridian],
  [子午圈],
  [HA],
  [hour angle],
  [时角],
  [],
  [proper motion],
  [自行],
  [],
  [color index],
  [色指数],
  [],
  [photometry],
  [光度学],
  [],
  [apparent brightness],
  [视亮度],
  [],
  [bandpass],
  [带通],
  [SED],
  [spectral energy distribution],
  [光谱能量分布],
  [],
  [atmospheric extincion],
  [大气消光],
  [],
  [limiting magnitude],
  [极限星等],
  [],
  [aberration],
  [像差],
  [],
  [field of view],
  [视场],
  [],
  [prime focus],
  [主焦点],
  [],
  [cassegrain foucs],
  [卡赛格林焦点],
  [],
  [nasmyth focus],
  [内氏焦点],
  [],
  [coude focus],
  [折轴焦点],
  [],
  [exit pupil],
  [出射光瞳],
  [],
  [achromatic lens],
  [消色差透镜],
  [coma],
  [comatic aberration],
  [彗差],
  [],
  [spherical aberration],
  [球差],
  [],
  [vignetting],
  [渐晕],
  [],
  [plate scale],
  [底片比例尺],
  [],
  [focal ratio],
  [焦比],
  [],
  [seeing],
  [视宁度],
  [],
  [kinetic temperature],
  [运动温度],
  [],
  [color temperature],
  [色温度],
  [],
  [excitation temperature],
  [激发温度],
  [],
  [ionization temperature],
  [电离温度],
  [],
  [distance ladder],
  [距离阶梯],
  [],
  [trigonometric parallax],
  [三角视差],
  [],
  [secular parallax],
  [长期视差],
  [],
  [statistical parallax],
  [统计视差],
  [],
  [peculiar motion],
  [本动速度],
  [],
  [standard candle],
  [标准烛光],
  [],
  [cepheid variable],
  [造父变星],
  [CCD],
  [charge coupled device],
  [电荷耦合器件],
  [],
  [full well capacity],
  [势阱容量],
  [],
  [front illumination],
  [前照式],
  [],
  [back illumination],
  [后照式],
  [],
  [thermal detector],
  [热探测器],
  [],
  [chopping],
  [斩波法],
  [],
  [flat],
  [平场],
  [],
  [twilight sky flat],
  [晨昏天光平场],
  [],
  [dome flat],
  [圆顶平场],
  [CV],
  [cataclysmic variable],
  [激变变星],
  [],
  [roche lobe],
  [洛希瓣],
  [TDE],
  [tidal disruption event],
  [潮汐瓦解事件],
  [],
  [accretion disc],
  [吸积盘],
  [],
  [differential photometry],
  [较差测光],
  [],
  [photoelectric photometer],
  [光电光度计],
  [],
  [photometric night],
  [测光夜],
  [],
  [instrumental magnitude],
  [仪器星等],
  [],
  [aperture photometry],
  [孔径测光],
  [],
  [spectral calibration lamp],
  [光谱定标灯],
  [],
  [telluric line],
  [大气谱线],
  [],
  [column density],
  [柱密度],
  table.hline(),
)
