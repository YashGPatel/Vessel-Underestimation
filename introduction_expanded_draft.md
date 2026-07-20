# Expanded Introduction — draft for review

Drafted in your voice (British spelling, mechanistic phrasing) following your own outline:
*why diameter matters → OCTA intro → quantification difficulty → artefacts & underestimation →
proposed solution + flicker test scenario.* `\cite{}` keys are paste-ready. Keys that are **new**
or that need **copying from your Zotero master library** into `Vessel_Underestimation.bib` are listed
at the bottom, along with the two spots that still need a reference chosen.

---

## Draft prose

Optical coherence tomography (OCT) is a non-invasive optical imaging method which uses interferometry to measure the transit time of light backscattered from a sample, producing depth-resolved images of tissue at micrometre-scale resolution~\cite{huangOpticalCoherenceTomography1991}. Since its introduction it has become a mainstay of clinical ophthalmology, providing cross-sectional views of the retina in routine practice. Optical coherence tomography angiography (OCTA) extends this capability to the vasculature by using the motion of red blood cells (RBCs) between repeated OCT acquisitions as an intrinsic source of contrast, allowing vascular networks to be visualised without an exogenous dye~\cite{jiaSplitspectrumAmplitudedecorrelationAngiography2012,decarloReviewOpticalCoherence2015}. Over the past decade, OCTA has seen widespread acceptance and use for the clinical evaluation of vascular features in relation to disease~\cite{javedOpticalCoherenceTomography2023}.

A range of quantitative metrics can be extracted from OCTA data. At the scale of vascular layers, perfusion can be summarised by vessel density~\cite{mirescuLocalGlobalBinarization2026,untrachtTowardsStandardisingRetinal2024} or by the extent of non-perfusion zones~\cite{TODO_nonperfusion}, whereas at the level of individual vessels, quantities such as vessel diameter~\cite{weiAutomatedVesselDiameter2020,fondiMeasurementRetinalVascular2016} and tortuosity~\cite{sarafFamilialRetinalArteriolar2019} can be measured. Of these, vessel diameter is of particular physiological importance. Together with flow velocity, the vessel cross-section determines the volumetric blood flow it can carry, so even small errors in diameter propagate into large errors in any derived flow estimate. Diameter is also a dynamic quantity: retinal arterioles and venules dilate in response to flickering light, a well-characterised expression of neurovascular coupling in which increased neural activity drives a local increase in blood supply~\cite{formazDiffuseLuminanceFlicker1997,garhoferDiffuseLuminanceFlicker2004,nagelFlickerObservationLight2004,raiEffectsFlickeringLight2025}. The magnitude of this flicker-evoked vasodilation is typically only a few percent of the resting diameter~\cite{polakInfluenceFlickerFrequency2002,aschingerEffectofDiffuse2017}, and is increasingly used as a functional readout of retinal and neuronal health~\cite{sharifizadFactorsDeterminingFlickerinduced2016}. Resolving such small changes places stringent demands on the accuracy and repeatability of the underlying diameter measurement.

Extracting these metrics from an OCTA dataset typically involves several processing steps, each of which can influence the final result. The three-dimensional vascular volume is first compressed into a two-dimensional en face image, most commonly by a maximum intensity projection~\cite{hormelMaximumValueProjection2018}, and the resulting angiogram is then binarised so that vascular metrics can be computed from the binary mask. Many binarisation strategies exist, and the choice of method can significantly affect the reported metrics~\cite{sampsonTowardsStandardizingRetinal2022,untrachtTowardsStandardisingRetinal2024,mirescuLocalGlobalBinarization2026}. With a simple global threshold, for example, local intensity fluctuations within the angiogram can push low-signal vessel edges below the threshold, leading to an underestimation of vessel calibre~\cite{mirescuLocalGlobalBinarization2026}. Dynamically or locally thresholded algorithms attempt to compensate for such intensity variations, but they do not necessarily solve the problem and may homogenise the angiogram in the process. Vessel-enhancement filters such as the Frangi vesselness filter~\cite{frangiMultiscaleVesselEnhancement1998} can likewise be applied to emphasise vessel-like structures before quantification, but these filters risk over- or under-compensating the signal and thereby altering the apparent size of the vessels they are meant to highlight. Because of these dependencies, it remains difficult to obtain vessel diameter measurements that are consistent across thresholds, projection choices, and imaging sessions~\cite{zhuCanOCTAngiography2017}.

Beyond these processing choices, OCT is subject to physical artefacts that specifically affect the appearance of the vasculature~\cite{bernucciInvestigationArtifactsRetinal2018,maltsevSuspendedScatteringParticles9000}. When large vessels are viewed in cross-section, they often display a characteristic hourglass appearance, with stronger backscattering from the centre of the lumen than from its edges (Fig.~1A). This pattern arises from the orientation of RBCs under laminar flow: the cells align with the vessel walls, so that their scattering cross-section is reduced at the sides of the vessel where they lie parallel to the beam~\cite{cimallaShearFlowinducedOptical2011}. The suppressed edge signal causes the vessel to appear narrower than it truly is when projected into an en face view, and we hypothesise that this effect is an important and, as yet, unquantified source of diameter underestimation in OCTA. The artefact can be mitigated with highly scattering contrast agents such as Intralipid, which fill the vascular lumen and restore intravascular signal in the regions where RBC scattering is diminished~\cite{merkleHighresolutionDepthresolvedVascular2021,panUltrasensitiveDetection3D2014,cimallaShearFlowinducedOptical2011}, providing a means of recovering the true vessel diameter for comparison.

An alternative to binarisation is to measure diameter directly from the shape of the vessel's intensity profile. Profile- and model-fitting approaches have been used to estimate vessel width from fundus images and from OCT phase data~\cite{lowellMeasurementRetinalVessel2004,fondiMeasurementRetinalVascular2016}, and gradient- or model-based methods have more recently been applied to OCTA to quantify diameter down to the capillary scale~\cite{weiAutomatedVesselDiameter2020}. By describing the vessel with a continuous function rather than a binary decision at a fixed intensity, such methods are in principle less sensitive to the absolute angiogram signal, and therefore to the intensity-dependent artefacts described above. To our knowledge, however, the degree to which en face OCTA underestimates vessel diameter has not been quantified against a ground truth, nor has it been established how reliably this underestimation can be corrected.

Here we examine several methods for measuring vessel diameter from in vivo OCT scans of the mouse retina, and we use an intravascular contrast agent to obtain ground-truth diameters for comparison. Alongside a traditional binarisation-based approach, we evaluate model-based methods that fit a parametric function to the projected intensity profile. Using this framework we measure how much diameter is underestimated from en face projections, and we assess how reliably this underestimation can be compensated through calibration. Finally, having identified the best-performing methods, we evaluate them in a functional test scenario, using flicker stimulation to induce a measurable change in vessel diameter, and ask which methods are able to recover this physiological response reliably.

---

## Citation notes

**New — not in any of your libraries (need adding to `Vessel_Underestimation.bib`):**

- `huangOpticalCoherenceTomography1991` — Huang et al., *Science* 254:1178 (1991). The foundational OCT paper. DOI: 10.1126/science.1957169
- `weiAutomatedVesselDiameter2020` — Wei et al., "Automated vessel diameter quantification and vessel tracing for OCT angiography," *J Biophotonics* 13:e202000248. Phantom-validated diameter method; also covers tortuosity. DOI: 10.1002/jbio.202000248
- `sarafFamilialRetinalArteriolar2019` — Saraf et al., tortuosity quantification with SS-OCTA, *Am J Ophthalmol Case Rep* 14:74. DOI: 10.1016/j.ajoc.2019.03.001

**Already in your Zotero master library — copy the entry into the paper `.bib`:**

- `jiaSplitspectrumAmplitudedecorrelationAngiography2012` — SSADA, foundational OCTA method
- `decarloReviewOpticalCoherence2015` — OCTA review
- `mirescuLocalGlobalBinarization2026` — local vs global binarisation, vessel density (does a lot of work here — density, threshold sensitivity, underestimation)
- `zhuCanOCTAngiography2017` — "Can OCTA be made a quantitative tool?"
- `lowellMeasurementRetinalVessel2004` — 2-D model-based vessel width
- `fondiMeasurementRetinalVascular2016` — vascular calibre from OCT phase
- `maltsevSuspendedScatteringParticles9000` — SSPiM artefact (optional, supports the artefact sentence)

**Already in `Vessel_Underestimation.bib` (no action):** javed, untracht, sampson, hormel, frangi, bernucci, cimalla, merkleHighresolution, pan, formaz, garhofer, nagel, rai, polak, aschinger, sharifizad.

**Still needs a reference chosen** (marked `\cite{TODO_nonperfusion}` in the draft): a non-perfusion / foveal-avascular-zone OCTA reference — you may already have a preferred diabetic-retinopathy one, or I can pull a solid candidate.

**Optional additions if you want to say more about "why diameter matters":** the neurovascular-coupling angle could be extended toward disease (e.g. altered flicker response in diabetes/glaucoma), which would need one disease-specific citation you're happy with.

*Attribution: the three new references were verified via PubMed.*
