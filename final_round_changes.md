# Final round (21 Aug 2026) — change list

Every change with the literal text to swap. Manuscript order, lines ascending.
**OLD** = what's there now · **NEW** = replacement · **XX** = a number you need to fill (I haven't guessed).

**❌ open · ⚠️ your call · ✅ checked, no action**

---

# abstract.tex — L6

### ❌ Opening claim is too strong
Nobody assesses diameter clinically as a biomarker.
**OLD:** `Vessel diameter is a widely used biomarker of vascular health, commonly assessed in the retina using optical coherence tomography angiography (OCTA).`
**NEW:** `Optical coherence tomography angiography (OCTA) is widely used to assess the retinal vasculature, and vessel diameter has been linked to a range of vascular diseases.`

### ❌ Split the setup sentence, pull the projections out
**OLD:** `compared binary mask based calculation against model-based profile fitting on maximum and mean intensity projections, and used flicker stimulation to evaluate the performance of each method.`
**NEW:** `compared binary-mask-based calculation against model-based profile fitting, and used flicker stimulation to evaluate the performance of each method. We additionally investigated each method on maximum and mean intensity projection data to determine the best configuration.`

### ❌ Reorder so "correctable" attaches to the linear relationship
**OLD:** `Before contrast, a generalised Gaussian fit to the maximum intensity projection retained the strongest linear relationship with ground truth of all methods tested, although it underestimated diameter by approximately 35\%, making it correctable by calibration.`
**NEW:** `Before contrast, a generalised Gaussian fit to the maximum intensity projection, although it underestimated diameter by approximately 35\%, retained the strongest linear relationship with ground truth of all methods tested, making it correctable by calibration.`

### ❌ Drop the m/R² jargon
**OLD:** `Post-contrast, the same fit applied to the mean intensity projection agreed with ground truth ($m = 1.001$, $R^2 = 0.97$).`
**NEW:** `Post-contrast, the same fit applied to the mean intensity projection was the most reliable method in our evaluation.`

### ❌ Attribute the vasoconstriction to intensity
**OLD:** `whereas binary mask based calculation instead reported vasoconstriction.`
**NEW:** `whereas binary-mask-based calculation was more affected by fluctuations in intensity and instead reported vasoconstriction.`

### ⚠️ Word count
~158 words after these edits, against a 100-word limit. He said leave it for now — fine for the co-author send.

---

# introduction.tex

### ⚠️ L3 — move the broad statement to the front
**MOVE** this sentence to the very start of the paragraph, ahead of `Vessel diameter is an important biomarker…`:
`Different diseases have been shown to preferentially affect different plexuses, with glaucoma altering the superficial vascular complex~\cite{...} while diabetic retinopathy~\cite{...} and retinal vein occlusion~\cite{...} affect the deeper plexuses more severely.`

### ⚠️ L3 — optional density→diameter bridge
The link you raised and he agreed was important. Only add if you want the paper to carry the claim. Goes straight after the moved sentence:
**ADD:** `These plexus-level findings are quantified largely through vessel density, which reflects how much vessel area is visible in the projected angiogram and therefore depends directly on the measured vessel diameter.`

### ❌ L3 — local *and systemic*
**OLD:** `regarding local vascular health.`
**NEW:** `regarding local and systemic vascular health.`

### ❌ L3 — cut vessel elasticity and ref [8]
Delete `kannenkerilRetinalVascularResistance2018`; keep Mynard [9] and Seabra [10].
**OLD:** `Combined with measurements of blood flow, diameter can also be used to investigate local blood pressure and vessel elasticity~\cite{kannenkeril...,mynard...,seabra...}.`
**NEW:** `Combined with measurements of blood flow, diameter can also be used to investigate local blood pressure~\cite{mynard...,seabra...}.`

### ✅ L3 — "In glaucoma suspects"
Still standard (AAO 2025 PPP is titled *Primary Open-Angle Glaucoma Suspect*; your ref [3] uses it in its title). **No change.**

### ❌ L5 — typo
**OLD:** `used to guage vessel size`
**NEW:** `used to gauge vessel size`

### ❌ L11 — list format + leftover note
**OLD:** `in techniques such as fluorescein angiography~\cite{...} and fundus photography~\cite{...} (based on other optical imaging methods) and OCT~\cite{...}, but we expand this by also investigating the generalized Gaussian model.`
**NEW:** `in techniques such as fluorescein angiography~\cite{...}, fundus photography~\cite{...}, and OCT~\cite{...}, but we expand this by also investigating the generalised Gaussian model.`

### ❌ L11 — en face
**OLD:** `underestimated from enface projections`
**NEW:** `underestimated from en face projections`

---

# methods_and_materials.tex

### ❌ L10 — animals, anaesthesia, 3Rs, abbreviations
The one place a whole block has to change. Both source-paper citations likely need adding to your bib.
**OLD:** the five sentences from `Three mouse models were used in this study:` through `…then MMFK (10 mL/kg body weight) was administered.`
**NEW:**
`Four mice were used in this study. In keeping with the 3Rs of animal research --- replacement, reduction and refinement --- data from two animals imaged for previously published studies were reused here: one very-low-density-lipoprotein receptor (VLDLR) knockout mouse (B6;129S7-\textit{Vldlr}\textsuperscript{tm1Her}/J, The Jackson Laboratory, Bar Harbor, USA)~\cite{YOUR_VLDLR_PAPER}, and one non-transgenic littermate from a superoxide dismutase 1 (SOD1) knockout colony (JAX stock \#002972, maintained on C57BL/6J)~\cite{AUGUSTIN_SOD1}. Anaesthesia and handling for these two animals are described in the respective publications.`

`The remaining two animals were C57BL/6J mice (The Jackson Laboratory, Bar Harbor, USA), imaged for this study. Both were induced with isoflurane at 4\% in oxygen for 4 minutes. The mouse used for the contrast-enhancement experiments was then maintained on medetomidine + midazolam + fentanyl + ketamine (MMFK, 10 mL/kg body weight). The mouse used for the functional flicker experiment received a ketamine + xylazine cocktail (100 mg/kg ketamine, 6 mg/kg xylazine; 10 mL/kg body weight), chosen over isoflurane to minimise anaesthesia-induced vasodilation~\cite{...}.`

Then **delete the now-duplicated** justification in the flicker paragraph: `For this experiment, ketamine/xylazine cocktail was chosen over isoflurane to minimise anaesthesia-induced vasodilation~\cite{...}.`

### ❌ L12 — DyC-OCT described first, volumetric second
**MOVE** the DyC-OCT sentences (`A dynamic-contrast OCT (DyC-OCT) protocol…` through `…derived from the DyC-OCT data.`) ahead of the volumetric sentences, then fix the two connectives:

**OLD:** `Additionally, a dynamic-contrast OCT (DyC-OCT) protocol~\cite{...} was employed`
**NEW:** `A dynamic-contrast OCT (DyC-OCT) protocol~\cite{...} was employed`

**OLD:** `Volumetric angiography data were acquired over a 1 mm $\times$ 1 mm field of view`
**NEW:** `Additionally, volumetric angiography data were acquired over a 1 mm $\times$ 1 mm field of view`

**OLD:** `For this study, pre- and post-injection volumetric datasets were acquired. This volumetric data was used solely for visualisation purposes.`
**NEW:** `Pre- and post-injection volumetric datasets were acquired and used solely for visualisation purposes.`

### ❌ L14 — flicker duration
**OLD:** `for the rest of the scan duration.`
**NEW:** `for the remainder of the scan, approximately 9 seconds.`

### ❌ L28 — ROI includes surrounding tissue
**ADD** after `…was selected from the DyC-OCT B-scan angiograms.`:
`The ROI was deliberately extended to include a margin of tissue surrounding the vessel, so that the profile contained a baseline on either side of the vessel for the model fits.`

### ❌ L32 — simplify skew correction
**DELETE:** `For an obliquely sectioned vessel, where the lateral diameter exceeds the axial diameter, this evaluates to $d_z/d_x$, while for a vessel perpendicular to the B-scan it reduces to unity.`
**OLD:** `reflected the true size of the vessel.`
**NEW:** `reflected the true size of the vessel, without skew.`

### ❌ L90 — BM rename, leading zeros, "range of values"
**OLD:** `To produce a binarised black and white (BW) mask,`
**NEW:** `To produce a binary mask (BM),`

**OLD:** `BW-1 = 07\%, BW-2 = 08\%, BW-3 = 09\%, BW-4 = 10\%, and BW-5 = 11\%.`
**NEW:** `BM-1 = 7\%, BM-2 = 8\%, BM-3 = 9\%, BM-4 = 10\%, and BM-5 = 11\%.`

**OLD:** `to cover the usable range of each projection.`
**NEW:** `to cover the usable range of values for each projection.`

### ❌ L94 — say what R² is for
**OLD:** `$R^2$ quantified the goodness of fit of the linear model.`
**NEW:** `$R^2$ quantified the goodness of fit of the linear model, indicating how reliably the underestimation can be corrected by calibration.`

---

# results.tex

### ❌ L59 — missing word
**OLD:** `shows OCTA MIP enface images of the superficial vascular plexus (SVP)`
**NEW:** `shows en face OCTA maximum intensity projections of the superficial vascular plexus (SVP)`

### ❌ L61 — assert the narrowing cause
**OLD:** `which could be due to lateral edge signal suppression`
**NEW:** `due to lateral edge signal suppression`

### ❌ L61 — "we think"
**OLD:** `and we think this could be due to the dynamic range`
**NEW:** `but this could be due to the dynamic range`

### ❌ L66 — R² isn't accuracy
**OLD:** `The accuracy ($m$, $R^2$) and precision (CoV) of all diameter measurement methods are summarised`
**NEW:** `The accuracy ($m$), linearity ($R^2$) and precision (CoV) of all diameter measurement methods are summarised`

### ❌ L145 — add the CoV point, drop "opposite trend"
Scoped to model-based: it fails for binary masks at BM-1/BM-2 post-contrast, where MIP is lower (0.10 vs 0.13, 0.10 vs 0.12).
**OLD:** `MeIP generally gave slopes closer to unity than MIP, but the linearity showed the opposite trend before contrast.`
**NEW:** `MeIP generally gave slopes closer to unity than MIP, and also produced lower CoV values than MIP for every model-based metric in all three contrast conditions (Table~\ref{tab:accuracy}).`

### ❌ L147 — cut the causal clause
**OLD:** `for MeIP) because MeIP overshot unity, and was also more linear`
**NEW:** `for MeIP), and was also more linear`

### ❌ L169 — reorder §3.3 and justify BM-5
**MOVE** `To assess whether angiogram intensity itself biases the diameter measurements, we examined the intensity time series alongside the diameter time series.` down to become the first sentence of the second paragraph.
**INSERT** at the start of §3.3 in its place:
`To evaluate how each method performed under a controlled induction of diameter change, flicker stimulation was used to evoke vasodilation while the same vessels were tracked over time. For the binary-mask-based measurements, BM-5 applied to the MeIP was used, as this combination gave the lowest CoV (0.09) and the joint-highest $R^2$ (0.82) of the binary-mask configurations post-contrast; its slope is further from unity, but a systematic offset of this kind is correctable by calibration.`

### ❌ L169 — note GG agreed closest
**ADD** after `…the GG model showed significant increases in four of five vessels (Table~\ref{tab:flicker}).`:
`Of the three methods, the GG model agreed most closely with the manually measured ground truth (Figs.~\ref{fig:flicker}d--f).`

### ❌ L163 — Fig. 7 caption
**OLD:** `Summary of accuracy and precision across all diameter measurement methods. (a, b) Coefficient of variation (CoV) and (c, d) coefficient of determination ($R^2$) for MIP (a, c) and MeIP (b, d), respectively.`
**NEW:** `Summary of linearity and precision across all diameter measurement methods. (a, b) Coefficient of variation (CoV), a measure of precision, and (c, d) coefficient of determination ($R^2$), a measure of linearity and hence of how reliably a measurement can be corrected, for MIP (a, c) and MeIP (b, d), respectively.`

### ❌ Fig. 8 caption — X marker and significance key
**APPEND:** `Crosses ($\times$) indicate the manually measured ground truth diameter for each vessel. Significance levels: $^{*}p < 0.05$, $^{**}p < 0.01$, $^{***}p < 0.001$.`

### ❌ Table 2 caption — significance key
**APPEND:** `Significance levels: $^{*}p < 0.05$, $^{**}p < 0.01$, $^{***}p < 0.001$.`

---

# discussion.tex

### ❌ L5 — model-based is not thresholdless
**OLD:** `it is inherently less sensitive to changes in angiogram signal and does not require a threshold at all.`
**NEW:** `it is inherently less sensitive to changes in angiogram signal, and the level at which the diameter is defined is fixed by the fitted model rather than by the absolute intensity of the image.`

### ❌ L7 — same claim again
**OLD:** `Because the model-based fit requires no threshold, it returns`
**NEW:** `Because the level at which the model-based diameter is read off is intensity-independent, it returns`

### ❌ L7 — say why MIP is singled out
**OLD:** `whereas binary mask based MIP fell from 0.81 at BW-1 to 0.48 at BW-5`
**NEW:** `whereas binary-mask-based MIP, the most commonly used combination in OCTA analysis, fell from 0.81 at BM-1 to 0.48 at BM-5`

### ❌ L13 — weaken to an observation
**OLD:** `The generalised Gaussian (GG) model will always outperform the standard Gaussian because`
**NEW:** `In this study, the generalised Gaussian (GG) model outperformed the standard Gaussian, because`
Keep the β = 2 sentence that follows — that's where the general claim belongs.

### ❌ L15 — greatest underestimation
**OLD:** `consistently showed the weakest accuracy`
**NEW:** `consistently showed the greatest underestimation`

### ❌ L33 — recite the intro's binarisation refs
**OLD:** `There are numerous other approaches for binarising the angiogram, which will most likely each behave differently.`
**NEW:** `There are numerous other approaches for binarising the angiogram~\cite{mehta...,rabiolo...,borrelli...,freedman...,arrigo...}, which will most likely each behave differently.`

### ❌ L35 — cut the speculative claim
**DELETE:** `The model-based approach avoids this limitation entirely by deriving diameter from the shape of the intensity profile rather than from an intensity cut-off, making it a fundamentally different and more robust alternative for quantitative diameter analysis.`

### ❌ L58 → above L54 — broad before specific
**MOVE** `The magnitudes we observed are generally larger than those reported in the human studies, though direct comparison is difficult…` (with the `Species, anaesthesia, stimulation frequency…` sentence that follows it) to sit **before** `In our study, the magnitude of vasodilation…`.

### ❌ L54 — average, not range
**OLD:** `In our study, the magnitude of vasodilation detected by the generalised Gaussian model ranged from $+3.1\%$ to $+28.4\%$ across the vessels with a significant response (Table~\ref{tab:flicker}).`
**NEW:** `In our study, the generalised Gaussian model detected a mean vasodilation of XX\% in the arteries and XX\% in the veins (Table~\ref{tab:flicker}).`

### ❌ L56 — flag the OCT-based studies
**OLD:** `Among the studies listed, Son et al.~\cite{...} used the most similar setup to ours`
**NEW:** `Son et al.~\cite{...} and Radhakrishnan and Srinivasan~\cite{...} are the only OCT-based studies among those listed, and are therefore the most directly comparable to our own. Of these, Son et al. used the most similar setup to ours`

### ❌ L56 — cut the speculative Son passage
**KEEP** up to `…may have been affected by the intensity-dependent artefacts characterised here.`
**DELETE** from `In the lateral direction, the RBC orientation artefact suppresses signal at vessel edges…` through `…whether their reported anisotropy changes when the lateral diameter is quantified differently.`
Then continue at `An earlier OCT-based study by Radhakrishnan and Srinivasan…`

### ⚠️ L58 — Rai et al.
Reports blood flow, not diameter. Keep or cut — your call.

### ❌ L83 — Table 3, exposure time
**OLD (Present study, Duration column):** `Cont.`
**NEW:** `9`
Also replace the Artery/Vein cells (`+3.5 to +28.4` and `+3.1`) with the same two averages as above.

---

# conclusion.tex — L3

### ❌ Errant comma
**OLD:** `compared against model-based profile fitting, on both maximum and mean intensity projections.`
**NEW:** `compared against model-based profile fitting on both maximum and mean intensity projections.`

### ❌ "metric" → "method", and name the condition
**OLD:** `The generalised Gaussian $1/e^2$ metric retained the strongest linear relationship with the ground truth under these conditions, so the residual underestimation is systematic and can be removed by calibration.`
**NEW:** `Under pre-contrast conditions, the generalised Gaussian $1/e^2$ method retained the strongest linear relationship with the ground truth, so the residual underestimation is systematic and can be removed by calibration.`

### ❌ Second "metric", plus precision
Scoped to model-based because BM-5 + MeIP ties at CoV 0.09.
**OLD:** `Post-contrast, the same metric applied to the mean intensity projection provided results closest to the ground truth of all combinations tested.`
**NEW:** `Post-contrast, the same method applied to the mean intensity projection provided results closest to the ground truth of all combinations tested, with the highest precision of the model-based methods (CoV = 0.09).`

### ❌ State intensity dependence before the consequence
**OLD:** `Binary mask based measurements depended on the threshold and the contrast condition, with the post-contrast slope falling steeply as the threshold increased.`
**NEW:** `Binary-mask-based measurements were highly dependent on angiogram intensity, varying with both the threshold and the contrast condition, with the post-contrast slope falling steeply as the threshold increased.`

---

# Global replacements

1. **`BW-` → `BM-`** — 44 occurrences: methods, results, discussion, both table headers, Fig. 5/6 sub-captions.
2. **`binary mask based` → `binary-mask-based`** — 37 occurrences. All sit before a noun, so all take hyphens. Avoid `binary mask-based`: that groups *mask-based* and leaves *binary* modifying it.
3. **`enface` → `en face`** in prose only (leave figure filenames and labels).

# Spelling splits (not from the meeting, but they'll be caught in proof)

4. **artifact / artefact** — intro has "artifact" ×2, "artefact" ×1; results and discussion use "artefact" ×7. Draft leans British, so go with *artefact*.
5. **visualize / visualise** — intro has "visualizes" and "visualization"; everywhere else uses "visualis-".
6. **generalized Gaussian** — one instance in the intro against "generalised" throughout.

---

# Still open — needs you
- **MATLAB averaging** for arterial and venous % change → discussion L54 *and* the Table 3 row.
- Keep or cut **Rai et al.**

# Main tex
- ✅ **Title** — yours.
- ✅ **Funding / Acknowledgments / Disclosures / Data availability** — copied in. SOD1 work was covered by the same two grants, nothing extra needed.

# Resolved, no action
Flicker duration 9 s · X = ground truth in Fig. 8d–f · DyC-OCT first · elasticity ref = Kannenkeril [8] · SOD1 genotype not needed · "glaucoma suspects" is current · MeIP CoV claim scoped to model-based · hyphenate to "binary-mask-based" · conclusion precision claim supported (tied at 0.09).
