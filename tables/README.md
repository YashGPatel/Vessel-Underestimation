# Tables

Manuscript statistics tables, generated from the MATLAB analysis and rendered to
LaTeX. Each table is a two-step pipeline: **MATLAB writes the data (xlsx), Python
renders the LaTeX** in the manuscript's exact format. Edit the xlsx and re-run the
Python script to regenerate the `.tex`.

Both `.tex` files are drop-in replacements for the hand-coded tables in
`results.tex` (same `\label{}`): `\input{tables/<name>.tex}`, or copy the
`tabular` body.

## Table 1 — accuracy / linearity (`tab:accuracy_linearity`)

Source: `Diameter_Figs.m` (set `save_tables = 1`).

```
Diameter_Figs.m   ->  accuracy_table.xlsx / .csv / .mat
python accuracy_to_tex.py  ->  accuracy_table.tex
```

Slope (m), R² and CoV for each method (BW-1..5, w(1/e²,G), FWHM_GG, w(1/e²,GG))
× projection (MIP = max, MeIP = mean), across Pre / Peak / Post phases. Values are
set **bold** automatically per the manuscript's rules: slope if 0.9 ≤ m ≤ 1.1,
R² if ≥ 0.90, CoV if ≤ 0.10. Spreadsheet layout: `Metric`, `Phase`, then the 16
method×projection value columns.

## Table 2 — flicker results (`tab:flicker`)

Source: `Diameter_Figs_Stim.m` (set `save_tables = 1`).

```
Diameter_Figs_Stim.m   ->  flicker_table.xlsx / .csv / .mat
python xlsx_to_tex.py   ->  flicker_table.tex
```

Per vessel (+ an Overall-ρ row): diameter change Δd (%) and correlation ρ
(diameter vs angiogram intensity, baseline window) for Gaussian / GG / Binarised,
plus intensity change ΔI (%). Significant values are **bold with superscript
stars**, driven by the companion `*_p` columns — Δd/ΔI from the paired `ttest`
(matched 100-sample windows: baseline `1:100`, post-stim `301:400`), ρ from the
correlation p-value. Edit a value or its p in the xlsx and the bold/stars update.

## Requirements

- Python with `pandas` + `openpyxl` (`pip install pandas openpyxl`)
- LaTeX: Table 1 uses `\resizebox` (graphicx); Table 2 needs no special packages.
  Both are already available in the Optica template.

## Options

```bash
python accuracy_to_tex.py -i accuracy_table.xlsx -o accuracy_table.tex --label tab:accuracy_linearity
python xlsx_to_tex.py      -i flicker_table.xlsx  -o flicker_table.tex   --label tab:flicker
```

> The `*_table.*` files currently here are **previews** built from the
> manuscript's present values, so you can see the format immediately. Run the
> MATLAB scripts (`save_tables = 1`) to overwrite them with freshly computed
> numbers, then re-run the converters.
>
> `flicker_pvalues.xlsx` is an obsolete earlier draft (superseded by
> `flicker_table.xlsx`) and can be deleted once it's closed in Excel.
