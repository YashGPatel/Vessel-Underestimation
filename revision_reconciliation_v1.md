# Revision Reconciliation — `Vessel_Underestimation_v1`

Meeting checklist cross-checked against the actual draft. Status tags:
**❌ open** (not yet done) · **⚠️ partial** (started, needs finishing) · **✅ done** (already in v1, no action) · **⌨️ keyboard** (needs you in MATLAB / the logs — I can't verify from text).

Line numbers refer to the individual section files (`methods_and_materials.tex`, `results.tex`, `discussion.tex`, `introduction.tex`) and the main file.

---

## Priority — the high-impact open items

1. **❌ Discussion L19 — cut the over-justification of the intensity drop.** This is the big one your advisor flagged. The draft still argues the decline "is expected during prolonged imaging sessions," that "the angiogram signal scales with blood flow," and ties it to anaesthesia reducing flow. The meeting conclusion: it's a ~16 s scan, not prolonged; OCTA is *not* a flow measure; don't reach. Replace with: we're not certain of the cause, we ruled out the critical confounds, we suspect cataract/corneal drying. Rewrite below.
2. **❌ "uniformly" → "completely"** (methods L13, results L15) — no evidence intralipid fills *uniformly*.
3. **❌ width/height → axial/lateral** in the ground-truth subsection (methods L25), and **split skew correction into its own subsubsection**.
4. **❌ Statistical analysis (methods L83)** — add the paired t-test statement, and ⌨️ confirm the figures/table use the paired test (`ttest`), not `ttest2`.
5. **❌ BW scatter figures never cross-referenced** (results) — the meeting's "figures 5 & 6." Add `\ref`s.
6. **⌨️ Refill / confirm every table value in MATLAB** — both tables still carry your "confirm with MATLAB" red notes.
7. **❌ Introduction is still in rough/redundant form** with `XXX` placeholders — the major rewrite you said you'd do.
8. **❌ References** — fix the `\bibliography{}` line and the note-field pollution (details at the end).

---

## Methods (`methods_and_materials.tex`)

- **❌ L13 — "uniformly" → "completely" + trim the RBC clause.** The hourglass/RBC-orientation cause is already covered in the intro, so don't retread it here.
  > **Old:** …fills the vascular lumen **uniformly**, thereby compensating for the artefact caused by the diminished backscattering at vessel peripheries **caused by RBC orientation effects**~\cite{…}.
  > **New:** …fills the vascular lumen **completely**, thereby compensating for the artefact caused by the diminished backscattering at vessel peripheries~\cite{…}.

- **⚠️ L10 — anaesthesia for the SOD1 / stimulation dataset.** Your own red note flags it: confirm from the logs whether that dataset used K/X or iso, and make Methods/Results agree. ⌨️
- **⚠️ L15 — pre-stim/post-stim window + onset.** Two sub-items:
  - The draft says the retina was unstimulated for "**approximately 8 seconds**." The meeting landed on observed onset **≈ 7 s**. Decide which you're reporting (protocol-intended 8 s vs. observed ~7 s) and make the figure's onset marker match.
  - Answer the embedded question ("why 4 s and not the full 8 s?"): the window was chosen because the signal had **stabilised** there; **100 samples = 4.1375 s ≈ 4 s**. Promote your comment to main text.
  - **❌ optional terminology:** "post-stim" is slightly misleading since stimulation is ongoing — consider **pre-/post-dilation**. Low priority, but it's what your advisor raised.
- **❌ L25 — width/height → axial/lateral, and split out skew correction.** Here "width" = lateral (x), "height" = axial (z). Suggested rewrite of the ground-truth text, with the skew part moved to a new subsubsection:
  > **Ground truth (rewritten):** Ground truth vessel diameters were obtained from contrast-enhanced DyC-OCT B-scan angiograms after arrival of the contrast agent. The lateral ($x$) and axial ($z$) diameters of the vessel were manually measured from its cross-section. The ground truth diameter was defined as the minimum of the two to account for off-axis cross-sectioning, which gives the vessel a more elliptical appearance in the B-scan; for a vessel perpendicular to the B-scan the lateral and axial diameters agree.
  >
  > **New `\subsubsection{Skew correction}`:** Because the lateral diameter is the quantity studied here, a correction factor of (axial / lateral) was applied for cases where the lateral diameter exceeded the axial diameter due to skew, and set to 1 otherwise. Multiplying this factor by the diameter measured from the ROI projection ensured the reported diameter reflected the true vessel size.

- **⚠️ L29 — "For each vessel of interest" → "For each large vessel in the field of view."** Minor; makes explicit you're on the large vessels.
- **❌ L83 — Statistical analysis: add the paired t-test.** After the Pearson-correlation sentence, add:
  > A paired t-test was used to evaluate whether vessel diameters differed significantly between the pre- and post-stimulation windows.
  - ⌨️ **And confirm the data behind Table 3 / Fig. 8 stars used the *paired* `ttest`, not `ttest2`** — this was the bug; some significance levels move (none of the findings change).
- **⚠️ L79 — threshold reasoning.** Kernel size (50×50×10) ✅ already stated. Still ❌: answer your red "why these thresholds" note — they span from borderline-too-high (vessels start dropping out) to borderline-too-low (noise/tissue creeps in). ⌨️ And verify that range is genuinely comparable and evenly stepped for **both** MIP and MeIP (this gates the "steeper degradation for MIP" claims).
- **✅ Citation cleanup (OCTA processing, L21).** Now cites Srinivasan + Harper; no lingering VISTA/variable-interscan ref. (Double-check no stray VISTA cite elsewhere, but looks clean.)
- **✅** en face spelling consistency — verified, all two-word.

---

## Results (`results.tex`)

- **❌ L13 — drop the premise-echo.**
  > **Old:** …consistent with previous literature showing that OCTA underestimates vessel diameter in the absence of a contrast agent~\cite{merkle…}.
  > **New:** …consistent with previous literature~\cite{merkle…}.

- **❌ L15 — "uniformly" → "completely", and strike "true diameter"/"true extent".** You can't mark where the true boundary is in that figure, so don't claim relative to it. Keep the bigger-then-smaller observation but frame it as dynamic range, and move the interpretation to Discussion.
  > **Old:** Pre-contrast injection, the vessel cross-sections appeared narrower **than their true diameter** … At peak contrast, the Intralipid filled the vascular lumen **uniformly**, but the vessels look slightly extended **beyond their true extent** because of the dynamic range…
  > **New:** Pre-contrast injection, the vessel cross-sections appeared narrower **than in the contrast-enhanced phase** … At peak contrast, the Intralipid filled the vascular lumen **completely**. The vessels appeared slightly wider at peak than post-contrast; we attribute this to the dynamic range of the image rather than a true diameter change (discussed in Section~\ref{subsec:model_vs_binary}).
  - Note: your advisor's embedded comment at L16 already says exactly this (dynamic range, peak/post agree in the model-based data) — fold that in and delete the comment.

- **❌ BW scatter figures not cross-referenced.** `fig:scatter_bw_mip` and `fig:scatter_bw_meip` have **no `\ref`** anywhere in the text. Add callouts where you discuss the binary-mask slope/threshold trends (around L71): e.g. "…across all contrast conditions and projections (Fig.~\ref{fig:scatter_bw_mip}, Fig.~\ref{fig:scatter_bw_meip})."
- **❌ L73 / and Discussion L9 — qualify the FWHM-GG accuracy claim.** It's only the *weakest* pre-contrast; post-contrast it's comparable or better than the standard Gaussian. Change "consistently exhibited the weakest accuracy" → "exhibited the weakest accuracy **pre-contrast**, while remaining comparable to the other model metrics post-contrast."
- **⚠️ L73 — the "model-based outperformed binary in both accuracy and precision" claim.** Mostly true, but add the one exception: the binary angiogram at the **lowest threshold** reaches precision comparable to the model methods (though with lower accuracy). One qualifying clause covers it.
- **❌ L142 — "during the duration" → "throughout the duration."**
- **⚠️ L121/142 — motivate the intensity-series analysis.** It jumps straight in; add a lead-in like "To assess whether angiogram intensity itself biases the diameter measurements, we examined the intensity time series alongside the diameter time series."
- **⚠️ L142 — move the interpretive last sentence to Discussion.** "These results demonstrated that the model-based diameter calculation provided more accurate and repeatable measurements…" is a Discussion claim. (Borderline — fine to keep a short version as a results wrap-up.)
- **⌨️ Tables (L90, L111) — confirm all values in MATLAB.** Your own red notes; the slope/R²/CoV table and the flicker table need a pass once the paired-test rerun is done. The model-method correlations are printed on the figures, so those are quick to verify.
- **✅ Stimulation onset/offset lines** already in the flicker figure caption (L138).
- **✅ ρ defined** as correlation-with-intensity in the Table 3 caption (L145). Subscript (ρ_int) is optional polish.

---

## Discussion (`discussion.tex`)

- **❌ L19 — the priority rewrite.** Replace the prolonged-session / scales-with-flow / anaesthesia argument with an honest "we checked the confounds; cause uncertain":
  > **New L19 (replacing the cited chain):** During the DyC-OCT acquisition, the angiogram intensity declined significantly across all five vessels (Fig.~\ref{fig:flicker}g,h), with decreases of $-14.1\%$ to $-19.9\%$ (Table~\ref{tab:flicker}). We did not establish the cause of this short-term decline with certainty. Inspection of the volumetric data ruled out the most important confounds: there was no out-of-plane motion, no large motion or breathing artefact, and image quality was consistent from the start to the end of the scan, with only a gradual reduction in intensity. We suspect a combination of rapid corneal drying and/or cataract development over the course of the scan. Crucially, the *cause* of the decline is not essential to our argument — what matters is that the decline is present and that it biases the binary-mask diameter while leaving the model-based diameter unaffected.

  Remove the `tokayerBloodFlowVelocity2013` (OCTA-scales-with-flow) citation and the anaesthesia-reduces-flow framing **for this 16 s scan**. (The same anaesthesia/corneal-drying factors are still fine in the *longitudinal* paragraph at L34.)
- **❌ L7 — don't conflate linearity and slope.** The sentence pairs "model-based maintained strong **linearity**" against "binary-mask **slopes** degraded" — apples vs oranges. Compare like with like: model-based **slopes stayed close to ground truth** *and* kept strong linearity; binary-mask **linearity** was lower and threshold-dependent. A wrong-but-linear slope is still correctable; poor linearity is not.
- **❌ Add a correctability paragraph at the very top of the Discussion (before §4.1 linearity).** Sets up *why* linearity matters: model-based methods need no threshold → consistent value; binarisation slopes shift with threshold so any calibration must encode the threshold; underestimation is correctable from the slope **iff** linearity is strong (so higher-linearity methods correct more reliably, even pre-contrast). You already gesture at this in "Best choices" (L44) — pull the concept forward.
- **❌ L9 — FWHM-GG reasoning.** Delete the "half-maximum … already dropped inside the true edge" sentence (that's about expected offset, not the real issue). Keep the 1/e² point. Optionally add the real reason in one line: near the half-maximum the profile shape changes rapidly and varies between vessels (Gaussian↔flat-topped), increasing variability. And qualify "weakest accuracy" → pre-contrast (matches the Results fix).
- **⚠️ L9 — GG ≥ Gaussian framing.** Strengthen: GG reduces to a Gaussian when that's optimal (β=2) and fits better otherwise, so — assuming the fit is applied correctly — it performs at least as well, at the cost of extra computation. You can also note the profile is physically a Gaussian **convolved with the vessel's reflectivity profile**, which is why flat-topped shapes appear.
- **❌ L13 — "a more average profile" → "a more consistent profile."**
- **⚠️ L15 — COV vs threshold-removal.** The paragraph blends the COV explanation (MIP profile is spiky → higher variability → higher COV — correct, keep) with the threshold-removes-part-of-the-vessel point (which is really about linearity/representation). Consider trimming so the COV argument ends at "higher variability → higher COV," and leave the threshold-removal point to the linearity discussion. Coherent as written, so lower priority.
- **❌ L32 — "tightest error bars" → "lowest standard deviations."**
- **❌ L34 — decouple cataract from teardrops.** Currently "corneal drying **and cataract formation** … if artificial tear drops are not applied" attaches the teardrop condition to both. Cataract (e.g. anaesthesia-induced) can occur even with teardrops; only corneal drying is teardrop-dependent. Reorder:
  > …with additional factors such as cataract formation, and corneal drying if artificial tear drops are not applied, further reducing OCT intensity over time~\cite{…}.
- **❌ L53 — image-quality claim.** You don't show a MIP-vs-MeIP visualisation comparison, so don't say "our results are consistent with this for image quality." Just attribute it to the literature:
  > **Old:** Our results are consistent with this for image quality purposes, but reveal a different picture…
  > **New:** While MIP is preferred for visualisation in the literature~\cite{hormel…}, our results reveal a different picture for quantitative diameter measurement…
- **❌ L57 — citation order.** Cimalla (2011) predates Bernucci (2018), and the meeting wanted the foundational paper first. Swap "Bernucci et al. … and Cimalla et al." → "Cimalla et al. … and Bernucci et al." *(Confirm this is the "Samala/Bernucci" swap your advisor meant — "Samala" didn't map to a cite key; Cimalla is the best fit.)*
- **❌ L65 — Rai et al.** The meeting leaned toward cutting it: it reports **flow, not diameter**, and you can't infer diameter from flow (need velocity too). At minimum, **delete "confirming that the mouse retina exhibits a robust neurovascular coupling response"** (that's already well established) and the "consistent with the vasodilation we observed" inference. Cleanest is to remove the Rai sentence entirely.
- **⚠️ L59/61/63 — Son et al. comparison.** Focus the comparison on your **GG** results (your headline metric), not the standard Gaussian numbers currently quoted at L61. The same-strain/anaesthetic/10 Hz/504 nm/different-period comparison (L63) is ✅ there. Address your own red comment at L59 (whether Son underestimated lateral diameter — your method could correct it). ⌨️ requires reading Son.
- **❌ L113 — Computation time is commented out.** Uncomment (or fold a sentence in) and add the figure: in **your** testing the GG was **~40% slower** than the Gaussian — phrase it "in our testing… approximately 40% slower," note it's hardware-dependent and parallelisable. Don't give an absolute time.
- **⚠️ Rat example.** Optional per the meeting: one rat study (Srinivasan & Radhakrishnan — alpha-chloralose, ~11% arterial increase, thresholding-based OCT) could go in the comparison. Low priority.
- **✅ Already in v1:** vesselness/adaptive-threshold citations (L38, Frangi), threshold-selection section, dark-adaptation column + Neumaier overnight DA, lux-vs-µW and retina-vs-cornea handled via table footnotes (L89–91), lateral-resolution/eye-optics wording (L100), best-choices-by-condition section.

---

## Introduction (`introduction.tex`) — ❌ major rewrite

Three paragraphs that overlap heavily (two separate "OCT is…/OCTA is…" openings) and contain `XXX` placeholders (L6: "XXX number of systems and XXX OCT scans"). Consolidate to the structure you agreed on:
1. Vessel-diameter measurement matters (microvascular networks, disease).
2. Current binarisation methods are threshold-dependent and lacking → introduce the hourglass/RBC-orientation artefact (keep this here, since Methods/Results now defer to it).
3. Intralipid as ground-truth contrast.
4. Transition: we test model-based fitting (Gaussian / generalised Gaussian) as a threshold-free alternative and a correction strategy.

⌨️ Fill the `XXX` install/scan-count figures with a citable source.

---

## Whole-manuscript / front matter — ❌

- **Title** is still the template placeholder ("Universal manuscript template…", main L18).
- **Abstract** is template boilerplate (main L29–32) — write the real one (~100 words for Optica).
- **Conclusion** — none present (the discussion ends at Future directions). Add one, or confirm you're intentionally folding it into the discussion.

---

## References — ❌

- **`\bibliography{}` line (main L334):** `\bibliography{sample,Merkle_Master_Library,Vessel_Underestimation}}`
  - Drop **`sample,`** (the Optica template bib).
  - Remove the **stray extra `}`** at the end.
  - The two-library split your advisor described (his master + your `Vessel_Underestimation`) is ✅ in place.
- **Note-field pollution is NOT fixed in the uploaded `Merkle_Master_Library.bib`** — **181** entries still carry `note = {Export Date: …}` and correspondence-address/email junk (Zotero's default export behaviour). This is the exact problem from the meeting. Either this isn't your advisor's cleaned copy, or it predates his fix — check with him before you compile, or strip the `note` fields (a quick script: delete `note = { … }` blocks that contain "Export Date"). I can write that script if you want.

---

## ⌨️ Needs you (data / logs / MATLAB) — can't be done from the text
- Re-run with the **paired t-test**; regenerate p-values and figure stars; refill both tables.
- **Verify the threshold ranges** are fair and evenly stepped for MIP and MeIP.
- **Check the logs** for the anaesthesia used on the stimulation/SOD1 dataset; align Methods & Results.
- **Read Son et al.** to finalise that comparison and the lateral-underestimation point.
- **Process the C10 dataset** for Monday.
- Figure edits: onset marker at your chosen ~7/8 s, BW-3 label, mean-vs-max note, centred titles.
