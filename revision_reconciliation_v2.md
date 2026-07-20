# Revision Reconciliation — `Vessel_Underestimation_v1` (sequential)

Same content as v1, reordered. **Files in manuscript order; line numbers ascending within each file. Every item appears exactly once, at its line.** Work top to bottom, no scrolling back.

**❌ open** · **⚠️ partial** · **✅ done, no action** · **⌨️ needs MATLAB / logs / reading — not a text edit**

---

# 1. `Vessel_Underestimation_v1.tex` (main file)

### ❌ L18 — Title
Still the template placeholder: "Universal manuscript template for Optica…". Write the real title.

### ❌ L29–32 — Abstract
Still template boilerplate. Write the real one (~100 words for Optica). Best done last, once the intro and numbers settle.

### ❌ L334 — `\bibliography{}` line
Currently: `\bibliography{sample,Merkle_Master_Library,Vessel_Underestimation}}`
- Drop **`sample,`** — that's the Optica template's own bib.
- Remove the **stray extra `}`** at the end.
- ✅ The two-library split (master + your project bib) is otherwise correct.
- *(If you use the trimmed `Vessel_Underestimation.bib` I built, you can point at it alone and drop the master entirely — it holds all 32 cited refs and avoids duplicate-key warnings.)*

### ❌ After Discussion — Conclusion section missing
The manuscript ends at Future directions. Add a Conclusion, or confirm you're deliberately folding it into the Discussion.

---

# 2. `introduction.tex` — ❌ major rewrite

The whole file, not a line-item. Three paragraphs that overlap heavily (two separate "OCT is… / OCTA is…" openings).

### ❌ L6 — `XXX` placeholders
Literal `XXX`: "XXX number of systems and XXX OCT scans". ⌨️ Fill with a citable source.

### ❌ Whole file — consolidate to the agreed structure
1. Vessel-diameter measurement matters (microvascular networks, disease).
2. Current binarisation methods are threshold-dependent and lacking → introduce the hourglass / RBC-orientation artefact **here** (Methods and Results both now defer to the intro for it, so it must land).
3. Intralipid as ground-truth contrast.
4. Transition: model-based fitting (Gaussian / generalised Gaussian) as a threshold-free alternative and a correction strategy.

---

# 3. `methods_and_materials.tex`

### ⚠️⌨️ L10 — Anaesthesia for the SOD1 / stimulation dataset
Your own red note flags it. Check the logs for what that dataset actually used (K/X or iso), then make Methods and Results agree. Red placeholders for strain detail and "n = XX mice per group" also live here.

### ❌ L13 — "uniformly" → "completely", and trim the RBC clause
No evidence intralipid fills the lumen *uniformly* (could be a concentration gradient) — only that it fills it completely. The hourglass / RBC-orientation cause is covered in the intro, so don't retread it here.
> **Old:** …fills the vascular lumen **uniformly**, thereby compensating for the artefact caused by the diminished backscattering at vessel peripheries **caused by RBC orientation effects**~\cite{…}.
>
> **New:** …fills the vascular lumen **completely**, thereby compensating for the artefact caused by the diminished backscattering at vessel peripheries~\cite{…}.

### ⚠️ L15 — Stimulation onset, analysis window, terminology
Three things at this line:
- **Onset:** draft says unstimulated for "approximately 8 seconds"; observed onset was **≈ 7 s**. Decide which you report (protocol-intended vs. observed) and make the figure's onset marker match.
- **Window:** answer your embedded question ("why 4 s and not the full 8 s?") — chosen because the signal had **stabilised** there; **100 samples = 4.1375 s ≈ 4 s**. Promote your buried comment to main text.
- **Terminology (optional):** "post-stim" is misleading since stimulation is ongoing — consider **pre-/post-dilation**. Low priority.

### ✅ L21 — Citation cleanup (OCTA processing)
Cites Srinivasan + Harper; no lingering VISTA / variable-interscan ref. No action.

### ❌ L25 — width/height → axial/lateral, and split out skew correction
"width" = lateral (x), "height" = axial (z). The very next subsection (L29) already uses axial/lateral, so the two currently disagree in vocabulary.
> **Ground truth (rewritten):** Ground truth vessel diameters were obtained from contrast-enhanced DyC-OCT B-scan angiograms after arrival of the contrast agent. The lateral ($x$) and axial ($z$) diameters of the vessel were manually measured from its cross-section. The ground truth diameter was defined as the minimum of the two to account for off-axis cross-sectioning, which gives the vessel a more elliptical appearance in the B-scan; for a vessel perpendicular to the B-scan the lateral and axial diameters agree.
>
> **New `\subsubsection{Skew correction}`:** Because the lateral diameter is the quantity studied here, a correction factor of (axial / lateral) was applied for cases where the lateral diameter exceeded the axial diameter due to skew, and set to 1 otherwise. Multiplying this factor by the diameter measured from the ROI projection ensured the reported diameter reflected the true vessel size.

### ⚠️ L29 — "For each vessel of interest" → "For each large vessel in the field of view"
Minor; makes explicit you're on the large vessels.

### ⚠️⌨️ L79 — Threshold reasoning
Kernel size (50×50×10) ✅ already stated. Still open: answer your red "why these thresholds" note — they span borderline-too-high (vessels start dropping out) to borderline-too-low (noise/tissue creeps in). **Verify that range is genuinely comparable and evenly stepped for both MIP and MeIP** — this gates the "steeper degradation for MIP" claims in Results and Discussion.

### ❌ L83 — Statistical analysis: add the paired t-test
After the Pearson-correlation sentence:
> A paired t-test was used to evaluate whether vessel diameters differed significantly between the pre- and post-stimulation windows.

⌨️ **And confirm the numbers behind Table 3 / Fig. 8 stars came from the *paired* `ttest`, not `ttest2`.** This was the bug. Some significance levels move; none of the findings change.

### ✅ Throughout — en face spelling
Verified, all two-word. No action.

---

# 4. `results.tex`

### ❌ L13 — Drop the premise-echo
Too close to restating the paper's own premise.
> **Old:** …consistent with previous literature showing that OCTA underestimates vessel diameter in the absence of a contrast agent~\cite{merkle…}.
>
> **New:** …consistent with previous literature~\cite{merkle…}.

### ❌ L15 — "uniformly" → "completely", and strike "true diameter" / "true extent"
You can't mark where the true boundary is in that figure, so don't claim relative to it. Keep the bigger-then-smaller observation, frame it as dynamic range, move interpretation to Discussion. (Your advisor's embedded comment at L16 already says exactly this — fold it in and delete the comment.)
> **Old:** Pre-contrast injection, the vessel cross-sections appeared narrower **than their true diameter** … At peak contrast, the Intralipid filled the vascular lumen **uniformly**, but the vessels look slightly extended **beyond their true extent** because of the dynamic range…
>
> **New:** Pre-contrast injection, the vessel cross-sections appeared narrower **than in the contrast-enhanced phase** … At peak contrast, the Intralipid filled the vascular lumen **completely**. The vessels appeared slightly wider at peak than post-contrast; we attribute this to the dynamic range of the image rather than a true diameter change (discussed in Section~\ref{subsec:model_vs_binary}).

### ❌ ~L71 — BW scatter figures never cross-referenced
`fig:scatter_bw_mip` and `fig:scatter_bw_meip` are defined but have **no `\ref` anywhere in the body**. Add callouts where you discuss the binary-mask slope/threshold trends:
> …across all contrast conditions and projections (Fig.~\ref{fig:scatter_bw_mip}, Fig.~\ref{fig:scatter_bw_meip}).

### ❌ L73 — Qualify the FWHM-GG accuracy claim
It's only weakest **pre-contrast**; post-contrast it's comparable to or better than the standard Gaussian.
> "consistently exhibited the weakest accuracy" → "exhibited the weakest accuracy **pre-contrast**, while remaining comparable to the other model metrics post-contrast"

*(Same fix needed at discussion.tex L9 — see below.)*

### ⚠️ L73 — "Model-based outperformed binary in both accuracy and precision"
Mostly true, one exception to add: the binary angiogram at the **lowest threshold** reaches precision comparable to the model methods, though with lower accuracy. One qualifying clause covers it.

### ⌨️ L90 — Table: confirm values in MATLAB
Your red note. The slope/R²/CoV table needs a pass once the paired-test rerun is done. Model-method correlations are printed on the figures, so those verify quickly.

### ⌨️ L111 — Table: confirm values in MATLAB
Your red note. The flicker table, same as above. L123 also has a red **BW-3** placeholder to resolve.

### ⚠️ L121 — Motivate the intensity-series analysis
It jumps straight in with no stated reason. Add a lead-in:
> To assess whether angiogram intensity itself biases the diameter measurements, we examined the intensity time series alongside the diameter time series.

### ✅ L138 — Stimulation onset/offset lines
Already in the flicker figure caption. No action *(but the onset value must match whatever you settle at methods L15)*.

### ❌ L142 — "during the duration" → "throughout the duration"

### ⚠️ L142 — Move the interpretive closing sentence to Discussion
"These results demonstrated that the model-based diameter calculation provided more accurate and repeatable measurements…" is a Discussion claim. Borderline — a short version is fine as a Results wrap-up.

### ✅ L145 — ρ defined
Defined as correlation-with-intensity in the Table 3 caption. Subscript (ρ_int) is optional polish.

---

# 5. `discussion.tex`

### ❌ Before L7 — Add a correctability paragraph at the very top (before §4.1)
Sets up *why* linearity matters, so the reader carries the concept through the rest of the discussion: model-based methods need no threshold → consistent value; binarisation slopes shift with threshold, so any calibration must encode which threshold was used; underestimation is correctable from the slope **iff** linearity is strong → higher-linearity methods correct more reliably, even pre-contrast. You already gesture at this in "Best choices" (L44) — pull the concept forward to the front.

### ❌ L7 — Don't conflate linearity and slope
The sentence pairs "model-based maintained strong **linearity**" against "binary-mask **slopes** degraded" — apples vs oranges. Compare like with like: model-based **slopes stayed close to ground truth** *and* kept strong linearity; binary-mask **linearity** was lower and threshold-dependent. A wrong-but-linear slope is still correctable; poor linearity is not.

### ❌ L9 — FWHM-GG reasoning
Delete the "half-maximum … already dropped inside the true edge" sentence — that's about expected offset, not the real issue. Keep the 1/e² transition-region point. Optionally add the real reason in one line: near the half-maximum the profile shape changes rapidly and varies between vessels (Gaussian ↔ flat-topped), increasing variability. Also qualify "weakest accuracy" → **pre-contrast**, matching the results L73 fix.

### ⚠️ L9 — GG ≥ Gaussian framing
Strengthen: GG reduces to a Gaussian when that's optimal (β=2) and fits better otherwise, so — assuming the fit is applied correctly — it performs at least as well, at the cost of extra computation. Worth adding that the profile is physically a Gaussian **convolved with the vessel's reflectivity profile**, which is why flat-topped shapes appear at all.

### ❌ L13 — "a more average profile" → "a more consistent profile"

### ⚠️ L15 — COV vs threshold-removal
The paragraph blends two arguments. Keep the COV explanation (MIP profile is spiky → higher variability → higher COV — correct). The threshold-removes-part-of-the-vessel point is really about linearity/representation, not COV — consider moving it. Coherent as written, so lower priority.

### ❌ L19 — Cut the over-justification of the intensity drop
**The big one.** The draft argues the decline "is expected during prolonged imaging sessions," that the "angiogram signal scales with blood flow," and ties it to anaesthesia reducing flow. It's a ~16 s scan, not a prolonged session; OCTA is not a flow measure. Don't reach — say you don't know.
> **New L19:** During the DyC-OCT acquisition, the angiogram intensity declined significantly across all five vessels (Fig.~\ref{fig:flicker}g,h), with decreases of $-14.1\%$ to $-19.9\%$ (Table~\ref{tab:flicker}). We did not establish the cause of this short-term decline with certainty. Inspection of the volumetric data ruled out the most important confounds: there was no out-of-plane motion, no large motion or breathing artefact, and image quality was consistent from the start to the end of the scan, with only a gradual reduction in intensity. We suspect a combination of rapid corneal drying and/or cataract development over the course of the scan. Crucially, the *cause* of the decline is not essential to our argument — what matters is that the decline is present and that it biases the binary-mask diameter while leaving the model-based diameter unaffected.

Remove the `tokayerBloodFlowVelocity2013` (OCTA-scales-with-flow) citation and the anaesthesia-reduces-flow framing **for this 16 s scan**. *(The same anaesthesia/corneal-drying factors remain fine in the longitudinal paragraph at L34.)*

### ❌ L32 — "tightest error bars" → "lowest standard deviations"

### ❌ L34 — Decouple cataract from teardrops
Currently "corneal drying **and cataract formation** … if artificial tear drops are not applied" attaches the teardrop condition to both. Cataract (e.g. anaesthesia-induced) can occur even with teardrops; only corneal drying is teardrop-dependent.
> …with additional factors such as cataract formation, and corneal drying if artificial tear drops are not applied, further reducing OCT intensity over time~\cite{…}.

### ✅ L38 — Vesselness / adaptive-threshold citations
Frangi et al. present. No action.

### ✅ L44 — Best-choices-by-condition section
Present. No action *(but see "before L7" — pull its correctability concept to the front)*.

### ❌ L53 — Image-quality claim
You don't show a MIP-vs-MeIP visualisation comparison, so don't claim your results confirm it.
> **Old:** Our results are consistent with this for image quality purposes, but reveal a different picture…
>
> **New:** While MIP is preferred for visualisation in the literature~\cite{hormel…}, our results reveal a different picture for quantitative diameter measurement…

### ❌ L57 — Citation order
Cimalla (2011) predates Bernucci (2018); the foundational paper goes first. Swap "Bernucci et al. … and Cimalla et al." → "Cimalla et al. … and Bernucci et al."
*(I'm fairly confident this is the "Samala/Bernucci" swap from the meeting — "Samala" doesn't map to any cite key, and Cimalla is the best fit. Worth a sanity check.)*

### ⚠️⌨️ L59 — Son et al.: your open red comment
Whether Son underestimated lateral diameter, and whether your method could correct it. Requires reading Son.

### ⚠️ L61 — Son et al.: focus on GG, not standard Gaussian
The quoted numbers are the standard Gaussian's. Your headline result is the **generalised** Gaussian — compare with that.

### ✅ L63 — Son et al.: protocol comparison
Same strain / anaesthetic / 10 Hz / 504 nm / different stimulation period, all present. No action.

### ❌ L65 — Rai et al.
Reports **flow, not diameter**, and you can't infer diameter from flow (needs velocity too). At minimum delete "confirming that the mouse retina exhibits a robust neurovascular coupling response" (already well established) and the "consistent with the vasodilation we observed" inference. Cleanest is to cut the Rai sentence entirely.

### ⚠️ L87 — Dark-adaptation hours
Red "2" placeholder — confirm the value.

### ✅ L89–91 — lux vs µW, retina vs cornea
Handled via table footnotes. No action.

### ✅ L100 — Lateral resolution / eye optics wording
Present and correct (set by the eye's optics and beam optics, not source bandwidth). No action.

### ❌ L113 — Computation time is commented out
Uncomment and add the figure: in **your testing** the GG was **~40% slower** than the Gaussian. Phrase it "in our testing… approximately 40% slower"; note it's hardware-dependent and parallelisable. Don't give an absolute time.

### ⚠️ Optional — rat comparison
Srinivasan & Radhakrishnan (alpha-chloralose, ~11% arterial increase, thresholding-based OCT). Low priority; the meeting called it optional.

---

# 6. `Merkle_Master_Library.bib`

### ❌ Note-field pollution — 181 entries
Still carry `note = {Export Date: …}` plus correspondence-address/email junk (Zotero's default export). This is the exact problem from the meeting — either this isn't your advisor's cleaned copy, or it predates his fix. Check with him before compiling.

**Already handled:** the trimmed `Vessel_Underestimation.bib` I built for you has the 32 cited refs, sorted A–Z, with all notes stripped and braces verified. If you point the manuscript at that alone, this item disappears.

---

# 7. No line anchor — lab / data tasks
Everything else is pinned to a line above. These aren't:
- **Process the C10 dataset** for Monday.
- **Figure edits:** onset marker at your chosen ~7/8 s, BW-3 label, mean-vs-max note, centred titles.
