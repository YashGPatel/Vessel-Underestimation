# Suggested Prose Revisions for Results Sections 3.3 and 3.4

Now that Table `\ref{tab:accuracy_linearity}` holds all the m and R² values, the text can focus on trends and key takeaways instead of listing every number. Below are suggestions — rewrite in your own words.

---

## Section 3.3: Accuracy and linearity across model-based measurements

**Current issue:** The two paragraphs (lines 45–47) essentially read out every m and R² value from Figure 4. With the table in place, you can trim this down to the key story points.

**Suggested points to cover (not exact wording — just the ideas):**

1. **All model-based methods showed pre-contrast underestimation** — slopes ranged from 0.42 to 0.73 (Table X), confirming that standard OCTA systematically underestimates vessel diameter.

2. **Contrast enhancement improved all methods**, but the degree of improvement varied substantially across metrics.

3. **GG FWHM was the worst performer** — even with contrast it stayed well below unity. This is expected since FWHM is inherently narrower than the true vessel extent. Maybe not worth spending more than one sentence on.

4. **GG 1/e² + MeIP was the best** — post-contrast slope of 1.00 with R² = 0.97. This is the headline number. Worth calling out explicitly.

5. **MeIP consistently outperformed MIP** — closer to unity, higher R². One sentence is enough.

6. **Gaussian 1/e² with MIP slightly overestimated post-contrast** (m = 1.12–1.15) — worth noting as a contrast to the GG 1/e² near-perfect agreement.

**Example trimmed paragraph (adapt to your voice):**

> All model-based methods underestimated vessel diameter in pre-contrast data, with slopes ranging from 0.42 to 0.73 (Table X). Contrast enhancement improved accuracy across all metrics, though the degree of improvement varied. The GG FWHM metric remained well below unity even post-contrast, consistent with FWHM being inherently narrower than the full vessel extent. The Gaussian 1/e² width with MIP slightly overestimated post-contrast (m = 1.12–1.15), while MeIP yielded values closer to unity (m = 1.04). The GG 1/e² width with MeIP provided the best overall agreement, achieving m = 1.00 (R² = 0.97) post-contrast — the closest to the identity line of any method tested. Across all metrics, MeIP consistently outperformed MIP in both accuracy and linearity (Table X, Fig. X).

---

## Section 3.4: Accuracy and linearity across binary mask based measurements

**Current issue:** Lines 65–67 list all the BW slopes and R² values for every threshold × contrast condition. Very dense.

**Suggested points to cover:**

1. **BW slopes degraded with increasing threshold** — this was the dominant trend for both MIP and MeIP. One sentence referencing the table.

2. **MIP was far more sensitive to threshold than MeIP** — MIP R² collapsed from 0.58 to 0.24 pre-contrast, while MeIP R² actually stayed stable (~0.59–0.65). This is a key finding worth highlighting.

3. **Even the best BW result (MeIP BW-3 peak: m = 0.99) had lower R² than model-based** — R² = 0.86 vs 0.97 for GG 1/e². The slope can match but the scatter is worse.

4. **MeIP BW-1 overestimated at peak contrast** (m = 1.14) — shows that lenient thresholds can overcorrect.

5. **Overall: MeIP > MIP for BW, but model-based still superior** — transition sentence to the next subsection.

**Example trimmed paragraph (adapt to your voice):**

> For binarisation-based methods, diameter accuracy degraded with increasing threshold stringency across all contrast conditions (Table X). This effect was far more severe for MIP, where the pre-contrast R² dropped from 0.58 (BW-1) to 0.24 (BW-5), than for MeIP, where the R² remained relatively stable (0.59–0.65). At peak contrast, MeIP BW-3 achieved a slope of m = 0.99, though with a lower R² (0.86) compared to the model-based GG 1/e² (R² = 0.97). At the most lenient threshold (BW-1), MeIP slightly overestimated the ground truth (m = 1.14), indicating that threshold selection introduces a bias–variance trade-off that model-based methods avoid. Overall, MeIP provided more reliable binarisation-based measurements than MIP, but both remained inferior to the model-based approach in accuracy and linearity.

---

## Notes

- The values in the table were extracted from the figures — confirm against your MATLAB outputs before finalising.
- You might also want to add a brief sentence at the start of Section 3.3 pointing the reader to the table: something like "A summary of all slope and R² values is provided in Table X."
- The red note in Section 3.5 about confirming CoV values still stands — same applies to the table values.
