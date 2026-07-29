# Discussion Revision — `files/discussion.tex` (post paired-t-test rerun)

**Line numbers = current `discussion.tex`.** Sequential, ascending. Every item appears once, at its line. Work top to bottom.

**❌ open** · **⚠️ partial / judgement call** · **✅ done, no action** · **⌨️ needs MATLAB / reading** · **🔢 stale number from the old `ttest2`**

Three passes were made: (1) against `revision_reconciliation_v2.md`, (2) independent numerical audit against the updated `results.tex`, (3) independent read for internal consistency and dangling references. Items found only in passes 2–3 are marked **[new]**.

---

## 0. Summary of what changed in the results

| Quantity | Old | New |
|---|---|---|
| Intensity decline range | −14.1% to −19.9% | **−13.6% to −19.8%** |
| Binary mask overall ρ | 0.523 | **0.526** |
| GG significant vessels | 3 of 5 | **4 of 5** |
| Vessel 1 Gaussian Δd | +9.2% | **+8.2%** |
| Vessel 1 GG Δd | +1.5% (n.s.) | **+3.5%** (\*\*) |
| Vessel 2 Gaussian Δd | +9.6% | **+9.9%** |
| Vessel 2 GG Δd | +9.9% | **+10.1%** |
| Vessel 3 Gaussian Δd | +1.5% | **+1.2%** (n.s.) |
| Vessel 3 binarised Δd | −4.2% | **−4.1%** |
| Vessel 4 ΔI | −19.9% | **−19.8%** |

Plus a **new R² pattern**: pre-contrast R² is now *higher for MIP* than MeIP across all three model metrics, and higher for MIP at BW‑1/BW‑2. This breaks the blanket "MeIP is better at everything" claim in three places (L13, L53, and implicitly L7).

---

## 1. Before L7 — ❌ Add a correctability paragraph at the top of §4.1

From the meeting. Sets up *why* linearity matters so the reader carries it through. Currently only gestured at in "Best choices" (L44).

> **Insert as new opening paragraph of §4.1 (after L5):**
> A practical consequence of this difference is how correctable each method is. Because the model-based fit requires no threshold, it returns a single consistent value for a given profile, whereas the binarisation slope shifts with the chosen threshold, so any calibration must also encode which threshold was used. Underestimation itself is not disqualifying: a method that underestimates by a fixed proportion can be corrected using the slope, provided the relationship with the ground truth is strongly linear. Linearity, rather than slope alone, therefore determines how reliably a method can be corrected, and this is what makes the higher-linearity model-based metrics usable even pre-contrast.

---

## 2. L5 — ⚠️ "a varying threshold" **[new]**

Minor. "does not require a varying threshold" understates it — the model needs no threshold at all.

> **Old:** …and does not require a varying threshold.
> **New:** …and does not require a threshold at all.

---

## 3. L7 — ❌ Don't conflate linearity with slope

Currently pairs model-based **linearity** against binary-mask **slopes** — apples vs oranges.

> **Old:** Model-based methods maintained strong linearity with the ground truth across all contrast conditions, whereas the binary mask based slopes degraded progressively with increasing threshold.
> **New:** Model-based methods kept slopes closer to the ground truth and maintained stronger linearity across all contrast conditions, whereas for the binary mask based methods both the slope and the linearity degraded progressively with increasing threshold. This distinction matters because a slope that is systematically low but linear can still be corrected, whereas poor linearity cannot.

### 3b. L7 — ⚠️ "much weaker linearity" is now overstated **[new]**

With the new R², pre-contrast MeIP $w_{fwhm,GG}$ (0.55) is actually *below* MeIP BW‑4 (0.61) and BW‑5 (0.62), and MIP BW‑1 (0.62) is not far off MIP $w_{1/e^2,G}$ (0.73). "Much weaker" no longer holds universally pre-contrast.

> **Suggested:** "Binary mask based methods on the other hand showed weaker linearity **in most conditions**, potentially because…"

### 3c. L7 — ⚠️ Figure reference incomplete **[new]**

The paragraph discusses slopes, but `Fig.~\ref{fig:cov_r2}` only shows CoV and R². Add the table: `Fig.~\ref{fig:cov_r2}, Table~\ref{tab:accuracy_linearity}`.

---

## 4. L9 — ❌ FWHM-GG reasoning + ⚠️ reconciliation is now stale here

**Two separate things.**

**(a) Delete the half-maximum sentence** (it describes an expected offset, not the real issue):

> **Delete:** "It could be because the half-maximum determines the vessel boundary where the intensity has already dropped inside the true edge."
> **Optionally replace with:** Near the half-maximum the profile shape changes rapidly and varies between vessels, from Gaussian to flat-topped, so the width measured at that level is more variable.

**(b) ⚠️ Do NOT apply the reconciliation's "qualify to pre-contrast" fix.** That guidance was written against the old numbers. In the **new** table $w_{fwhm,GG}$ has the slope furthest from unity in *all three* conditions (0.42/0.43 pre, 0.66/0.61 peak, 0.66/0.61 post), and your updated `results.tex` L72 now says "consistently … in all three contrast conditions". So **"consistently" is correct — keep it.** What is worth adding is the linearity nuance:

> **Append:** …although its linearity remained high post-contrast ($R^2 = 0.96$ for MIP and $0.98$ for MeIP), indicating that the underestimation is systematic and therefore correctable.

### 4b. L9 — ⚠️ Strengthen the GG ≥ Gaussian framing

> **Append after the $\beta$ sentence:** Because the GG reduces to a standard Gaussian when $\beta = 2$ and departs from it only when the data support a flatter profile, a correctly applied GG fit should perform at least as well as the Gaussian, at the cost of additional computation. The flat-topped shapes arise because the measured profile is effectively the vessel's reflectivity profile convolved with the system point spread function.

---

## 5. L13 — ❌ "a more average profile" → "a more consistent profile"

### 5b. L13 — 🔢 ❌ Blanket MeIP claim no longer holds **[new]**

"Across nearly all methods and conditions, MeIP outperformed MIP in both accuracy and precision" now contradicts your own updated results (L27, L70): pre-contrast R² is higher for **MIP** across all three model metrics, and higher for MIP at BW‑1/BW‑2.

> **Old:** Across nearly all methods and conditions, MeIP outperformed MIP in both accuracy and precision (Table~\ref{tab:accuracy_linearity}).
> **New:** Across nearly all methods and conditions, MeIP outperformed MIP in both accuracy and precision (Table~\ref{tab:accuracy_linearity}). Linearity was the exception: pre-contrast, MIP achieved higher $R^2$ than MeIP for every model-based metric and at the two lowest binarisation thresholds, with MeIP overtaking MIP only after contrast enhancement.

---

## 6. L15 — 🔢 ❌ "remained above 0.86"

Post-contrast MeIP BW‑5 **is** 0.86, not above it.

> **Old:** …remained above 0.86 even at BW-5 post-contrast.
> **New:** …remained at 0.86 even at BW-5 post-contrast.

### 6b. L15 — ⚠️ CoV vs threshold-removal (low priority)

The paragraph blends two arguments. The CoV explanation (MIP profile is spiky → higher variability) is correct and should stay. The "threshold removes a vessel-dependent fraction" point is really about linearity/representation rather than CoV — consider moving it into the L7 linearity paragraph. Coherent as written, so low priority.

---

## 7. L19 — ⚠️ Intensity-drop paragraph: mostly fixed, four things left

Your red-text rewrite already does the main job (drops the "prolonged session" / flow-scaling over-reach). Remaining:

- **🔢 Numbers:** "$-14.1\%$ to $-19.9\%$" → **"$-13.6\%$ to $-19.8\%$"**
- **Grammar [new]:** "the model-based diameter **remain** unaffected" → "**remains** unaffected"
- **Hyphenation [new]:** "binary mask-based" → "binary mask based" (matches the rest of the file)
- **Un-red it** once you're happy with the wording.

**Also add the missing volumetric detail** the reconciliation had and the red text dropped — "no large motion" and "only a gradual reduction":

> **Suggested final L19 (first half):** During the DyC-OCT acquisition, the angiogram intensity declined significantly across all five vessels (Fig.~\ref{fig:flicker}g,h), with decreases ranging from $-13.6\%$ to $-19.8\%$ (Table~\ref{tab:flicker}). We did not establish the cause of this short-term decline with certainty. Inspection of the volumetric data ruled out the most important confounds: there was no out-of-plane motion, no large motion or breathing artefact, and image quality was consistent from the start to the end of the scan, with only a gradual reduction in intensity. We suspect a combination of rapid corneal drying and cataract development over the course of the scan. Crucially, the cause of the decline is not essential to our argument: what matters is that the decline is present, and that it biases the binary mask based diameter while leaving the model-based diameter unaffected.

### 7b. L19 — ❌ Trailing sentence is a conclusion stated before its evidence **[new]**

The paragraph now ends with "The results demonstrated that the model-based diameter calculation provided more accurate and repeatable measurements…" — but the mechanism that justifies it is not given until L32. **Move this sentence to the end of L32.**

### 7c. L19 — ❌ Deleting the old text orphaned "this expected vasodilation" **[new — important]**

The removed sentence was the only place establishing that flicker *should* cause vasodilation, and the equivalent sentence in `introduction.tex` L35 is **commented out**. L32 now opens with "The model-based methods correctly detected **this expected vasodilation**" with no antecedent anywhere in the manuscript.

**Fix either way:**
- **Option A (preferred):** uncomment `introduction.tex` L35 so the intro establishes it, and leave L32 as is.
- **Option B:** add to the end of L19: "Flicker stimulation is well established to evoke vasodilation in the retina~\cite{garhoferDiffuseLuminanceFlicker2004,sharifizadFactorsDeterminingFlickerinduced2016}."

⚠️ Note `sharifizadFactorsDeterminingFlickerinduced2016` is currently cited **nowhere** in the compiled text (only in the commented intro line).

---

## 8. L32 — 🔢 ❌ Four number/count corrections

| Current | Corrected |
|---|---|
| "GG model showing significant increases in **three** of five vessels" | **four** of five |
| "$\rho = 0.523$" | **$\rho = 0.526$** |
| "the tightest error bars" | "the **lowest standard deviations**" |
| "(up to $+28.5\%$)" | ✅ still correct |
| "$\rho = -0.101$ … $\rho = -0.098$" | ✅ still correct |
| "significant decreases in four of five vessels" | ✅ still correct |

> **Also append here** the sentence moved from L19 (item 7b): "Together these results demonstrate that the model-based diameter calculation provided more accurate and repeatable measurements, and recovered physiologically meaningful vascular responses that the binary mask based method misrepresented."

---

## 9. L34 — ❌ Decouple cataract from teardrops

Cataract (e.g. anaesthesia-induced) can occur even with teardrops; only corneal drying is teardrop-dependent.

> **Old:** …with additional factors such as corneal drying and cataract formation further reducing OCT intensity over time~\cite{…} if artificial tear drops are not applied during the imaging.
> **New:** …with additional factors such as cataract formation, and corneal drying if artificial tear drops are not applied, further reducing OCT intensity over time~\cite{…}.

---

## 10. L38–40 — ✅ Threshold selection

Frangi citation present; argument is sound and unaffected by the rerun. No action.

---

## 11. L44 — 🔢 ❌ Two wrong numbers, one wrong superlative

Pre-contrast claim is now materially wrong. New table: MeIP $w_{1/e^2,GG}$ pre‑contrast $R^2 = 0.76$, and the best pre-contrast $R^2$ of any method is **MIP** $w_{1/e^2,GG}$ at **0.81** — not MeIP.

> **Old:** If only pre-contrast data is available, the same metric still provides the best linearity ($R^2 = 0.88$) among all methods, though the slope of $m = 0.71$ indicates…
> **New:** If only pre-contrast data is available, the $w_{1/e^2,\,\mathrm{GG}}$ metric still provides the best linearity of all methods tested, reaching $R^2 = 0.81$ with MIP and $R^2 = 0.76$ with MeIP; the MeIP slope of $m = 0.71$ indicates…

Also: text says $m = 1.001$ while the table rounds to $1.00$ — harmless, but make them agree if a reviewer is likely to notice. ($R^2 = 0.97$ and CoV $= 0.09$ both ✅ still correct.)

---

## 12. L46 — 🔢 ❌ Wrong R²

> **Old:** …still provides good post-contrast accuracy ($m = 1.02$, $R^2 = 0.93$).
> **New:** …still provides good post-contrast accuracy ($m = 1.02$, $R^2 = 0.95$).

($m = 0.92$ for BW‑1 post-contrast MIP ✅ still correct.)

---

## 13. L48 — 🔢 ❌ Both BW-3 numbers slightly off

New table, post-contrast MeIP BW‑3: $m = 0.96$, $R^2 = 0.81$.

> **Old:** At post-contrast, BW-3 using MeIP achieved $m = 0.97$ and $R^2 = 0.80$…
> **New:** At post-contrast, BW-3 using MeIP achieved $m = 0.96$ and $R^2 = 0.81$…

---

## 14. L53 — ❌ Image-quality claim + 🔢 "consistently"

**Two edits in one sentence pair.** You show no MIP-vs-MeIP visual comparison, so don't claim your results confirm it; and "consistently" is now contradicted by the pre-contrast R² reversal.

> **Old:** Our results are consistent with this for image quality purposes, but reveal a different picture when it comes to quantitative vessel diameter measurement. We found that MeIP consistently yielded more accurate and precise diameter values than MIP…
> **New:** While MIP is preferred for visualisation in the literature~\cite{hormelMaximumValueProjection2018}, our results reveal a different picture for quantitative vessel diameter measurement. We found that MeIP yielded more accurate and precise diameter values than MIP across both model-based and binary mask based approaches, with the exception of pre-contrast linearity, where MIP performed better.

---

## 15. L57 — ❌ Citation order

Cimalla (2011) predates Bernucci (2018); foundational paper first.

> **Old:** …described by Bernucci et~al.~\cite{bernucci…} and Cimalla et al.~\cite{cimalla…}
> **New:** …described by Cimalla et~al.~\cite{cimalla…} and Bernucci et~al.~\cite{bernucci…}

*(Sanity-check against your meeting notes — "Samala" from the minutes doesn't map to any cite key, and Cimalla is the best fit.)*

---

## 16. L59 — ⚠️⌨️ Son et al.: your open red comment

Requires reading Son: whether they underestimated lateral diameter, whether your method could correct it, and whether they report percent or micron change. The inline `%` comment at the end of L59 should be resolved and deleted.

---

## 17. L61 — 🔢 ❌ Four stale numbers + ⚠️ Gaussian-vs-GG framing

**Numbers (Gaussian model):**

| Current | Corrected |
|---|---|
| "ranged from $+1.5\%$ to $+28.5\%$" | see below |
| Gaussian arteries "$+9.2\%$, $+9.6\%$, and $+28.5\%$" | **$+8.2\%$, $+9.9\%$, and $+28.5\%$** |
| veins "$+1.5\%$ and $+4.9\%$" | **$+1.2\%$ and $+4.9\%$** — and $+1.2\%$ is **not significant**, so don't call it an increase |

**⚠️ Framing:** the reconciliation asks you to lead with the **GG**, not the standard Gaussian, since GG is the headline method. The GG numbers are: arteries $+3.5\%$, $+10.1\%$, $+28.4\%$; veins $-0.4\%$ (n.s.) and $+3.1\%$.

> **Suggested rewrite of the first two sentences:** The magnitude of vasodilation detected by the generalised Gaussian model ranged from $+3.1\%$ to $+28.4\%$ across the vessels with a significant response (Table~\ref{tab:flicker}). The arteries (Vessels 1, 2, and 4) showed increases of $+3.5\%$, $+10.1\%$, and $+28.4\%$, while the veins (Vessels 3 and 5) showed a smaller response, with $+3.1\%$ in Vessel 5 and no significant change in Vessel 3. The standard Gaussian gave a comparable picture, with arterial increases of $+8.2\%$, $+9.9\%$, and $+28.5\%$ and a venous increase of $+4.9\%$ in Vessel 5.

**⚠️ Knock-on [new]:** the later sentence "the arterial response was **consistently and substantially** larger than the venous response" is well supported by the Gaussian ($+8.2$–$+28.5$ vs $+1.2$–$+4.9$) but marginal under the GG, where Vessel 1 artery ($+3.5\%$) barely exceeds Vessel 5 vein ($+3.1\%$). If you lead with GG, soften to:

> …in which the arterial response was **on average larger** than the venous response, most markedly in Vessel 4.

---

## 18. L63 — ✅ Son protocol comparison

Same strain / anaesthetic / 10 Hz / 504 nm / different stimulation duration, all present and correct. No action.

---

## 19. L65 — ❌ Rai et al.: cut the over-claim

Rai reports **flow, not diameter**; diameter cannot be inferred from flow without velocity.

> **Cleanest — delete the whole final sentence** ("In addition to these diameter-based studies, Rai et~al.… not straightforward.").
> **Minimum — delete** "confirming that the mouse retina exhibits a robust neurovascular coupling response" (already well established) **and** "their findings are consistent with the vasodilation we observed".

---

## 20. L87 — 🔢 ❌ Table row for the present study + ⚠️ DA placeholder

Two problems in one row.

- **Numbers:** "$+9.2$ to $+28.5$" / "$+1.5$ to $+4.9$" are stale and mix the Gaussian with a non-significant vein value.
  - If reporting **GG** (recommended, matches item 17): artery **$+3.5$ to $+28.4$**, vein **$+3.1$** (single significant vessel).
  - If reporting **Gaussian**: artery **$+8.2$ to $+28.5$**, vein **$+4.9$**.
  - Either way, add a footnote: "$^{\P}$Range across vessels with a statistically significant response."
- **⚠️ DA:** `\textcolor{red}{$2$}` — confirm the dark-adaptation duration and un-red it.

---

## 21. L98 — ✅ Future direction, intensity-loss sentence

"drying of the eye, cataract formation, etc." is consistent with the revised L19/L34 framing. No action.

*(⚠️ But see the standing comment at L102: this section may need a refresh now that the literature comparison is settled.)*

---

## 22. L104–111 — ⚠️ Clean up resolved TODO comments **[new]**

The three "done:" comment pairs have served their purpose and can be deleted before submission. The comment at **L102** ("this would also change based on the new studies…") is still genuinely open.

---

## 23. L113 — ❌ Uncomment the Computation Time subsection

Uncomment and add the measured figure. Phrase it as *your* testing, no absolute times.

> **Add to the uncommented paragraph:** In our testing, fitting the generalised Gaussian was approximately 40\% slower than the standard Gaussian. This difference is hardware-dependent, and because the fits at each cross-section are independent, the computation is highly parallelisable and could be accelerated substantially with appropriate hardware.

---

## 24. Optional — rat comparison

Srinivasan & Radhakrishnan (alpha-chloralose, ~11% arterial increase, thresholding-based OCT). The meeting called this optional; it would slot naturally into L63–65.

---

## 25. Housekeeping outside the prose

- **⚠️ Orphaned bib entry [new]:** `tokayerBloodFlowVelocity2013` is no longer cited anywhere after the L19 rewrite. Harmless with BibTeX, but remove it from the trimmed `Vessel_Underestimation.bib` if you want a clean 32-entry file.
- **⚠️ `sharifizadFactorsDeterminingFlickerinduced2016`** is likewise uncited unless you action item 7c.
- **Typo in `results.tex` L122 [new]:** `(BW-3;Fig.~\ref{fig:flicker}c)` is missing a space → `(BW-3; Fig.~\ref{fig:flicker}c)`.

---

## Suggested order of work

1. **Numbers first** (items 6, 7, 8, 11, 12, 13, 17, 20) — pure find-and-replace, no thinking required, and they gate everything else.
2. **The dangling "expected vasodilation"** (7c) — genuine correctness bug, cheap to fix.
3. **The three MeIP-vs-MIP qualifications** (5b, 14, and 3b) — these are the substantive consequence of the new R² pattern.
4. **Reconciliation prose items** (1, 3, 4, 5, 9, 15, 19, 23).
5. **Leave for last:** 16 (needs Son), 20 DA value, 24 (optional).
