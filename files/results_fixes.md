# Results section — suggested fixes after t-test correction

Line numbers refer to `files/results.tex` as of this check. Work top-down; line numbers shift only if you add/remove lines (all edits below are in-place replacements unless noted).

---

## 1. Line 123 — GG vessel count is wrong

**Issue:** Table now shows **four** significant GG vessels (V1 +3.5\*\*, V2 +10.1\*\*\*, V4 +28.4\*\*\*, V5 +3.1\*\*). V1 flipped to significant after the t-test fix.

**Find:**
```latex
and the GG model showed significant increases in three of five vessels (Table~\ref{tab:flicker})
```

**Replace with:**
```latex
and the GG model showed significant increases in four of five vessels (Table~\ref{tab:flicker})
```

**Note:** with both models now at four of five, you could tighten the whole clause to "For both the Gaussian and GG models, four of five vessels showed significant diameter increases ($p < 0.01$; Table~\ref{tab:flicker})." Optional — only if you want to avoid repeating the count.

---

## 2. Line 142 — intensity range is stale

**Issue:** Table $\Delta I$ values are now $-13.6$, $-18.2$, $-14.3$, $-19.8$, $-16.3$.

**Find:**
```latex
ranging from $-14.1\%$ to $-19.9\%$ (Table~\ref{tab:flicker})
```

**Replace with:**
```latex
ranging from $-13.6\%$ to $-19.8\%$ (Table~\ref{tab:flicker})
```

---

## 3. Line 142 — overall BW correlation is stale

**Issue:** Table says $0.526$.

**Find:**
```latex
with an overall correlation of $\rho = 0.523$ ($p < 0.0005$)
```

**Replace with:**
```latex
with an overall correlation of $\rho = 0.526$ ($p < 0.0005$)
```

---

## 4. Line 28 — "MeIP mostly outperformed MIP in both accuracy and linearity" no longer holds

**Issue (the big one).** For model-based metrics, the updated $R^2$ values reverse the old pattern:

| Condition | $w_{1/e^2,\mathrm{G}}$ | $w_{fwhm,\mathrm{GG}}$ | $w_{1/e^2,\mathrm{GG}}$ | Winner |
|---|---|---|---|---|
| Pre | MIP 0.73 / MeIP 0.63 | 0.67 / 0.55 | 0.81 / 0.76 | **MIP, 3 of 3** |
| Peak | 0.90 / 0.95 | 0.95 / 0.94 | 0.98 / 0.97 | **MIP, 2 of 3** |
| Post | 0.92 / 0.98 | 0.96 / 0.98 | 0.95 / 0.97 | MeIP, 3 of 3 |

Slope (accuracy) still favours MeIP in most cells, so the two claims need separating.

**Find (last sentence of the paragraph):**
```latex
Across all metrics, MeIP mostly outperformed MIP in both accuracy and linearity (Table~\ref{tab:accuracy_linearity}, Fig.~\ref{fig:scatter_model}).
```

**Replace with:**
```latex
MeIP generally gave slopes closer to unity than MIP, but the linearity showed the opposite trend before contrast: pre-contrast $R^2$ was higher for MIP across all three metrics, and MeIP only surpassed MIP post-contrast (Table~\ref{tab:accuracy_linearity}, Fig.~\ref{fig:scatter_model}).
```

---

## 5. Line 71 — MeIP $R^2$ does not stay "stable", it increases

**Issue:** MeIP BW $R^2$ rises with threshold — pre 0.51→0.62, peak 0.69→0.88 (+0.19), post 0.75→0.82. That is the opposite of MIP, which is a cleaner story than "stable".

**Find:**
```latex
The $R^2$ values followed a similar pattern. For MIP, pre- and post-contrast $R^2$ decreased substantially with increasing threshold, whereas for MeIP, $R^2$ remained relatively stable.
```

**Replace with:**
```latex
The $R^2$ values showed opposite trends for the two projections. For MIP, $R^2$ decreased with increasing threshold across all contrast conditions, most strongly post-contrast. For MeIP, $R^2$ instead increased with threshold, which was most evident at peak contrast.
```

---

## 6. Line 71 — "MeIP more reliable than MIP" needs a qualifier

**Issue:** True for slope at every threshold and contrast condition, but $R^2$ crosses over — MIP is higher at BW-1 and BW-2, MeIP higher at BW-4 and BW-5.

**Find:**
```latex
Overall, MeIP provided more reliable binary mask based diameter measurements than MIP.
```

**Replace with:**
```latex
Overall, MeIP provided more accurate binary mask based diameter measurements than MIP at every threshold, and was also more linear at the higher thresholds, though MIP retained higher $R^2$ at the two lowest thresholds.
```

---

## 7. Line 73 (red text) — $w_{fwhm,\mathrm{GG}}$ "comparable post-contrast" contradicts line 28

**Issue:** Line 28 says it "remained well below unity even post-contrast" (post slopes 0.66 / 0.61 vs ~1.0 for the others). So it is *not* comparable on accuracy. It *is* comparable on precision (post CoV 0.18 / 0.11, against 0.16–0.18 / 0.09–0.10 for the other model metrics). Just needs to say which.

**Find:**
```latex
Among the model-based metrics, $w_{fwhm,\,\mathrm{GG}}$ consistently exhibited the weakest accuracy pre-contrast, while remaining comparable to the other model metrics post-contrast.
```

**Replace with:**
```latex
Among the model-based metrics, $w_{fwhm,\,\mathrm{GG}}$ consistently exhibited the weakest accuracy in all three contrast conditions, though its precision remained comparable to the other model metrics.
```

---

## 8. Line 28 — $m = 1.001$ vs table value 1.00

**Issue:** Table now reads 1.00 and no longer carries a "confirm with MATLAB" note, so the extra digit looks inconsistent.

**Find:**
```latex
achieving a slope closest to unity with $m = 1.001$ ($R^2 = 0.97$) post-contrast
```

**Replace with:**
```latex
achieving a slope closest to unity with $m = 1.00$ ($R^2 = 0.97$) post-contrast
```

**Or** keep 1.001 and add the third decimal to that one cell in the table so they agree. Your call — depends whether you want to make the point that it is *exactly* on the identity line.

---

## 9. Line 28 — $m = 1.12$–$1.15$ spans peak and post, not just post

**Issue:** $w_{1/e^2,\mathrm{G}}$ MIP is 1.15 at peak and 1.12 post. The sentence says post-contrast but gives both.

**Find:**
```latex
The $w_{1/e^2,\,\mathrm{G}}$ with MIP slightly overestimated post-contrast ($m = 1.12$--$1.15$), while MeIP yielded values closer to unity ($m = 1.04$).
```

**Replace with:**
```latex
The $w_{1/e^2,\,\mathrm{G}}$ with MIP slightly overestimated at both peak and post-contrast ($m = 1.15$ and $m = 1.12$), while MeIP yielded values closer to unity ($m = 1.04$ in both conditions).
```

---

## 10. Line 71 — "decreased substantially" is now milder pre-contrast

**Issue:** MIP pre-contrast $R^2$ drops 0.62→0.40 (was 0.58→0.24 in the old table). Post-contrast is still a big drop (0.81→0.48).

**Status:** Already handled by the replacement in item 5, which drops "substantially" and says "most strongly post-contrast" instead. No separate edit needed — just don't reintroduce the word.

---

## Verified correct — no action needed

- All slope monotonicity claims (BW slope decreases with threshold in all 6 projection × condition combinations)
- "MeIP slopes were consistently higher than MIP at every threshold and contrast condition" — holds in all 15 pairs
- "MeIP tended to slightly overestimate at lower thresholds, peak and post" — BW-1/BW-2 peak 1.14/1.06, post 1.11/1.03
- Model-based pre-contrast slope range 0.42–0.73
- Entire CoV paragraph up to the red text: MIP CoV increase with threshold, MeIP CoV stability, model-based values lower overall, peak bump then post drop
- Gaussian "four of five vessels ($p < 0.01$)" — V2 is \*\* so the $p < 0.01$ bound is right
- Binarised "significant decreases in four of five vessels"
- Gaussian and GG overall $\rho$ ($-0.101$, $-0.098$)
- Table 1 bolding: all three rules (slope $0.9 \le m \le 1.1$, $R^2 \ge 0.90$, CoV $\le 0.10$) applied correctly in all 48 cells
- Table 2 bolding: significance markers consistent with bolded values

---

## Still open (not data-consistency, flagged earlier)

- Line 13, 15, 22 — red text pending review
- Line 123 — `\textcolor{red}{BW-3}` placeholder: confirm which threshold the flicker binarisation used
- Line 16–17 — Conrad's two commented-out notes. The light-diffusion objection has been addressed in the current line 15 text; the second comment (concluding sentence belongs in discussion) is resolved by that sentence now being commented out. Both comment blocks can be deleted once you are happy.
