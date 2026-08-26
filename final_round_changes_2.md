# Final round (21 Aug 2026) — change list

Each item has two layers:

- **Discussed** — what Conrad actually said, quoted from the transcript. `[square brackets]` = obvious transcription errors corrected. Where he gave options, all options are listed.
- **Suggested** — my proposed wording. Check it against the quote above it; where he dictated text himself I've said so, and those you can paste without thinking.

Manuscript order, lines ascending. **OLD** = current text · **XX** = a number you need to fill.

> **Before you find-and-replace:** the OLD strings below are written with ordinary spaces, but the tex uses non-breaking spaces and thin spaces in many of them — `BW-1~=~40\%`, `1~mm~$\times$~1~mm`, `Son et~al.~\cite{...}`, `(a,\,b)`. There are 50 tildes across methods, results and discussion. A literal search will miss those lines; match on a distinctive fragment instead.

**❌ open · ⚠️ your call · ✅ checked, no action**

---

# abstract.tex — L6

### ❌ Opening claim is too strong
> "I would just rephrase this 1st one so that it's more focused on like, OCTA is widely used or like, you know, OCTA metrics are widely used… You could also change the focus and say, like, vessel diameter has been linked to a number of, like, vascular diseases, which I think we do support in the introduction… I just wouldn't say that vessel diameter itself is commonly assessed. Or that it's widely used."

**Two separate options, plus one hard constraint** (don't call diameter widely used or commonly assessed). Whichever you pick must define OCTA, since the abbreviation is used later in the abstract.

**OLD:** `Vessel diameter is a widely used biomarker of vascular health, commonly assessed in the retina using optical coherence tomography angiography (OCTA).`

**Option A — his first (OCTA-focused):**
`Optical coherence tomography angiography (OCTA) is widely used to evaluate the retinal vasculature in relation to disease.`

**Option B — his second (diameter linked to disease):**
`Vessel diameter has been linked to a number of vascular diseases, and can be measured in the retina using optical coherence tomography angiography (OCTA).`

**Option C — my merge of both** (this is mine, not his):
`Optical coherence tomography angiography (OCTA) is widely used to assess the retinal vasculature, and vessel diameter has been linked to a range of vascular diseases.`

### ❌ Split the setup sentence, pull the projections out
> "I would just include that we additionally investigated mean and the max… projection methods… we establish ground truth diameters using [Intralipid] contrast enhancement, compared binary mask-based calculation against model-based profile fitting, and used flicker stimulation to evaluate the performance of each method. We additionally investigated these methods on mean and max intensity projection data to determine what is the best configuration. Something along those lines… I would just take this out because it just makes this already long sentence a little bit too complicated."

He dictated the replacement almost word for word.

**OLD:** `compared binary mask based calculation against model-based profile fitting on maximum and mean intensity projections, and used flicker stimulation to evaluate the performance of each method.`
**Suggested:** `compared binary-mask-based calculation against model-based profile fitting, and used flicker stimulation to evaluate the performance of each method. We additionally investigated these methods on maximum and mean intensity projection data to determine the best configuration.`

### ❌ Reorder so "correctable" attaches to the linear relationship
> "So a generalized Gaussian fit to the maximum intensity projection, although it underestimated diameter by approximately 35%, retained the strongest linear relationship with ground truth of all methods tested, making it correctable by calib[ration]… So that it's clear where this connects to. It took me a couple of passes to understand where these connections were."

Dictated verbatim — paste as is.

**OLD:** `Before contrast, a generalised Gaussian fit to the maximum intensity projection retained the strongest linear relationship with ground truth of all methods tested, although it underestimated diameter by approximately 35\%, making it correctable by calibration.`
**Suggested:** `Before contrast, a generalised Gaussian fit to the maximum intensity projection, although it underestimated diameter by approximately 35\%, retained the strongest linear relationship with ground truth of all methods tested, making it correctable by calibration.`

### ❌ Drop the m/R² jargon
> "They don't know what m is, what [R²] is, until unless they read the paper… I think we could just say, like, post-contrast, this method presented the best results with high linearity and strong agreement… or you could even just say it was the most reliable based on accuracy, precision, and… linear[ity]. Or we can just keep it simple and just say that it was the most reliable method in our evaluation. Very short, sweet."

Three options, ending on the shortest.

**OLD:** `Post-contrast, the same fit applied to the mean intensity projection agreed with ground truth ($m = 1.001$, $R^2 = 0.97$).`
**Option A:** `Post-contrast, the same fit applied to the mean intensity projection presented the best results, with strong agreement and high linearity.`
**Option B:** `Post-contrast, the same fit applied to the mean intensity projection was the most reliable in terms of accuracy, precision and linearity.`
**Option C (his "short, sweet"):** `Post-contrast, the same fit applied to the mean intensity projection was the most reliable method in our evaluation.`

### ❌ Attribute the vasoconstriction to intensity
> "I would just maybe make it clear that this is caused by fluctuations [in] intensity. Because otherwise it makes it seem like any measurement using the binary mask would report vasoconstriction, which isn't true. Because if the intensity remains stable, then it could work… you could say, whereas with binary mask-based calculation… [it was] more affected by the fluctuations and the intensity changes and instead reported vasoconstriction."

**OLD:** `whereas binary mask based calculation instead reported vasoconstriction.`
**Suggested:** `whereas binary-mask-based calculation was more affected by fluctuations in intensity and instead reported vasoconstriction.`

### ⚠️ Word count
> "I wouldn't worry too much about that for sending it out to the co-authors… We have a little bit of time to decide what's the most important thing. So I would improve the clarity of the 1st one, but I don't think you have to change the content necessarily."

~158 words after these edits against a 100-word limit. Deliberately deferred. He also flagged that the MIP-better-for-GG point is nuanced (better R², worse CoV) and hard to fit — decide later whether it survives the cut.

---

# introduction.tex

### ⚠️ L3 — move the broad statement to the front
> "The reason why I highlighted this part isn't to take it out or anything. It's just to re-order it. So this is a broad statement about the vasculature. So this would go well at the beginning of the introduction… you could start with a very similar statement of like, at the very beginning: different diseases have known effects on retinal vascula[ture] and even preferentially affect different plexuses, [then] vessel diameter is an important biomarker… The vasculature in general is related to disease — broad statement. Refine it down to vessel density, a biomarker that is also useful, has been used in these studies. And then we talk about diameter."

His chain: **vasculature/disease → vessel density → diameter.**

**MOVE** to the very start of the paragraph, ahead of `Vessel diameter is an important biomarker…`:
`Different diseases have been shown to preferentially affect different plexuses, with glaucoma altering the superficial vascular complex~\cite{...} while diabetic retinopathy~\cite{...} and retinal vein occlusion~\cite{...} affect the deeper plexuses more severely.`

### ⚠️ L3 — optional density→diameter bridge
> **You:** "Vessel density is used a lot. [Density] is nothing but how much vessel you see in that plane, which literally is diameter."
> **Him:** "Yeah, no, I fully agree with that connection. I think it's an important one."

The middle step of his broad→specific chain. He endorsed the logic but nobody drafted a sentence, so this wording is entirely mine — the paper would then have to carry the claim.

**Suggested (mine), after the moved sentence:** `These plexus-level findings are quantified largely through vessel density, which reflects how much vessel area is visible in the projected angiogram and therefore depends directly on the measured vessel diameter.`

### ❌ L3 — local *and systemic*
> "After this, you talk about local and systemic effects. So you could just say regarding local and systemic vascular health."

**OLD:** `regarding local vascular health.`
**Suggested (his words):** `regarding local and systemic vascular health.`

### ❌ L3 — cut vessel elasticity and ref [8]
> "You don't necessarily have to include elasticity… I would maybe just remove reference number 8 and the vessel elasticity part. Because 8 does talk about vessel elasticity, it just doesn't use this method… We just reduce the statement a little bit: can be used to investigate local blood pressure."

Ref [8] = `kannenkerilRetinalVascularResistance2018`. Keep Mynard [9] and Seabra [10] — he confirmed both cover blood pressure via diameter.

**OLD:** `Combined with measurements of blood flow, diameter can also be used to investigate local blood pressure and vessel elasticity~\cite{kannenkeril...,mynard...,seabra...}.`
**Suggested:** `Combined with measurements of blood flow, diameter can also be used to investigate local blood pressure~\cite{mynard...,seabra...}.`

### ✅ L3 — "In glaucoma suspects"
> "I would just change the word suspects… you can even say in people suspected to have glaucoma… I would just check that if this is in common use. If it's in common use, it's fine."

Checked: still standard. AAO's 2025 Preferred Practice Pattern is titled *Primary Open-Angle Glaucoma Suspect*, and your own ref [3] uses "glaucoma suspects" in its title. **No change.** His fallback, if you'd rather: `in patients suspected of having glaucoma`.

### ❌ L5 — typo
> "So, [gauge] is misspelled. It's A-U, I think."

**OLD:** `used to guage vessel size`
**Suggested:** `used to gauge vessel size`

### ❌ L11 — list format + leftover note
> "I would just make it comma, fundus photography, and OCT. And I think this was a note before, so that should just get cut. Because this doesn't make sense — 'based on other optical [imaging methods]'."

**OLD:** `in techniques such as fluorescein angiography~\cite{...} and fundus photography~\cite{...} (based on other optical imaging methods) and OCT~\cite{...}`
**Suggested:** `in techniques such as fluorescein angiography~\cite{...}, fundus photography~\cite{...}, and OCT~\cite{...}`

### ❌ L11 — en face
Not raised in the meeting; a consistency fix (see spelling section).
**OLD:** `underestimated from enface projections`
**Suggested:** `underestimated from en face projections`

---

# methods_and_materials.tex

### ❌ L10 — animals, anaesthesia, 3Rs, abbreviations
Four separate instructions landing in one paragraph:

> **Defer to the source papers:** "We don't necessarily need to include all of the details for the VLDLR and SOD1. We can just refer back to the papers and then we can reduce some of that… So SOD1 and VLDLR will be talked about in their individual papers. I only talk about the anaesthesia only for the C57 because that's not talked about before."
> **The plural problem:** "It's just that you say for the C57 Black 6 mice, plural. And one of those was actually K[/]X."
> **Expand the abbreviations:** "You should probably say what these are. So you say VLDLR and it's never explained… that's very low density lipoprotein receptor, and SOD1 is superoxide dismutase 1."
> **The SOD1 animal:** "You could say a control mouse from a SOD1 study… a control sibling of an SOD1."
> **3Rs:** "We can just say that this follows the principles of replacement… you can say the principles of humane experimental technique and allows us to replace some data. Or you can say it follows the 3 [R]s of animal research… we can say that one VLDLR knockout mouse was used from this study."

No dictated wording for any of it, so the sentences below are mine. Both source-paper citations likely need adding to your bib.

**OLD:** the five sentences from `Three mouse models were used in this study:` through `…then MMFK (10 mL/kg body weight) was administered.`

**Suggested (mine):**
`Four mice were used in this study. In keeping with the 3Rs of animal research --- replacement, reduction and refinement --- data from two animals imaged for previously published studies were reused here: one very-low-density-lipoprotein receptor (VLDLR) knockout mouse (B6;129S7-\textit{Vldlr}\textsuperscript{tm1Her}/J, The Jackson Laboratory, Bar Harbor, USA)~\cite{YOUR_VLDLR_PAPER}, and one non-transgenic littermate from a superoxide dismutase 1 (SOD1) knockout colony (JAX stock \#002972, maintained on C57BL/6J)~\cite{AUGUSTIN_SOD1}. Anaesthesia and handling for these two animals are described in the respective publications.`

`The remaining two animals were C57BL/6J mice (The Jackson Laboratory, Bar Harbor, USA), imaged for this study. Both were induced with isoflurane at 4\% in oxygen for 4 minutes and subsequently maintained with an injectable anaesthetic, as specified for each experiment below.`

Then **add one sentence to the contrast/DyC paragraph**: `The mouse imaged during contrast agent administration was maintained on medetomidine + midazolam + fentanyl + ketamine (MMFK, 10 mL/kg body weight).`

**Leave the flicker paragraph untouched** --- its existing `For this experiment, ketamine/xylazine cocktail was chosen over isoflurane...` sentence already covers the second mouse, and naming the flicker experiment up in the animals paragraph would be a forward reference.

### ❌ L12 — DyC-OCT described first, volumetric second
> "Making [DyC] the 1st protocol and the 3D is the 2nd, because they are used only for visualisation purposes. So the [DyC] goes first, that goes second."

**MOVE** the DyC-OCT sentences (`A dynamic-contrast OCT (DyC-OCT) protocol…` through `…derived from the DyC-OCT data.`) ahead of the volumetric sentences. Three connectives then need fixing:

**OLD:** `Additionally, a dynamic-contrast OCT (DyC-OCT) protocol~\cite{...} was employed`
**Suggested:** `A dynamic-contrast OCT (DyC-OCT) protocol~\cite{...} was employed`

**OLD:** `Volumetric angiography data were acquired over a 1 mm $\times$ 1 mm field of view`
**Suggested:** `Additionally, volumetric angiography data were acquired over a 1 mm $\times$ 1 mm field of view`

**OLD:** `For this study, pre- and post-injection volumetric datasets were acquired. This volumetric data was used solely for visualisation purposes.`
**Suggested:** `Pre- and post-injection volumetric datasets were acquired and used solely for visualisation purposes.`

### ❌ L14 — flicker duration
> "I would just say, which was approximately X number of seconds. Because we know how long that should be. I guess it would be like another 9 seconds… because then it gives some numbers to people who are interested."

You've since confirmed 9 s.

**OLD:** `for the rest of the scan duration.`
**Suggested:** `for the remainder of the scan, approximately 9 seconds.`

### ❌ L28 — ROI includes surrounding tissue
> "I would just make sure to state that this ROI also incorporated some tissue surrounding the vessel. Because we need the baseline. If you cut it too short, you can't do the fit."

**ADD** after `…was selected from the DyC-OCT B-scan angiograms.`:
**Suggested (mine):** `The ROI was deliberately extended to include a margin of tissue surrounding the vessel, so that the profile contained a baseline on either side of the vessel for the model fits.`

### ❌ L32 — simplify skew correction
> "A correction factor was defined; by multiplying this correction factor against the diameter measured, we ensured that the measured vessel diameter reflected the true size. I think that's all we need to say there. I don't think we have to clarify that when the lateral diameter exceeds the axial diameter then it evaluates as this — I think this just complicates it… Without skew effects."

**DELETE:** `For an obliquely sectioned vessel, where the lateral diameter exceeds the axial diameter, this evaluates to $d_z/d_x$, while for a vessel perpendicular to the B-scan it reduces to unity.`
**OLD:** `reflected the true size of the vessel.`
**Suggested:** `reflected the true size of the vessel, without skew.`

### ❌ Throughout — hyphenate "generalised Gaussian"
> "Oh, yeah, to put hyphen between generalized [Gaussian]."

Only methods was updated, so the manuscript is now split: **methods has `Generalised-Gaussian` ×3**, against **`generalised Gaussian` unhyphenated ×8** (abstract 2, conclusion 2, discussion 3, results 1) and **`generalized Gaussian` ×1** (introduction — also the US spelling). Either hyphenate all of them as he asked, or drop the hyphen in methods; right now it reads as an inconsistency either way. Note the unhyphenated form is the more common one in the literature, so this is worth a word with him before you sweep.

### ❌ L90 — BM rename
> "And change all BWs to BM." — "BM or BT?" — "Pick anything, define it in the text."

**OLD:** `To produce a binarised black and white (BW) mask,`
**Suggested:** `To produce a binary mask (BM),`

### ❌ L90 — leading zeros
> "I would just take out the zeros, the leading zeros."

**OLD:** `BW-1 = 07\%, BW-2 = 08\%, BW-3 = 09\%, BW-4 = 10\%, and BW-5 = 11\%.`
**Suggested:** `BM-1 = 7\%, BM-2 = 8\%, BM-3 = 9\%, BM-4 = 10\%, and BM-5 = 11\%.`

### ❌ L90 — "range of values"
> "These thresholds were selected empirically to cover the usable range of — oh, the usable range of *values* for each projection."

**OLD:** `to cover the usable range of each projection.`
**Suggested (his words):** `to cover the usable range of values for each projection.`

### ❌ L94 — say what R² is for
> "You do a nice job, you say a slope of m equals one indicated perfect agreement with ground truth. Perfect. [Then:] R squared quantified the goodness of fit of the linear model, indicating how well it can be corrected."

Dictated. He wanted the same treatment R² gets for the slope — why it matters to you.

**OLD:** `$R^2$ quantified the goodness of fit of the linear model.`
**Suggested:** `$R^2$ quantified the goodness of fit of the linear model, indicating how well it can be corrected.`

---

# results.tex

### ❌ L59 — missing word
> "This seems like it's missing a word. Like 'OCTA MIP en face'… I would say en face OCTA MIPs, maximum intensity projections of the — sorry, just reword, [move en face] to the front."

**OLD:** `shows OCTA MIP enface images of the superficial vascular plexus (SVP)`
**Suggested:** `shows en face OCTA maximum intensity projections of the superficial vascular plexus (SVP)`

### ❌ L61 — assert the narrowing cause
> "I would just make this a stronger statement. We are very certain that the vessel appears narrower because of this artifact. It's super clear from our testing. So I think we can use a stronger statement, which is 'due to the lateral edge suppression' instead of 'which could be'… If anyone pushes back on this, we can dial it back."

**OLD:** `which could be due to lateral edge signal suppression`
**Suggested (his words):** `due to lateral edge signal suppression`

### ❌ L61 — "we think"
> "Sometimes making statements like 'we think' just feels a little bit unscientific… So instead of 'we think', just put 'but'. Yeah, but this could be due to… Because we still are saying what we think. We just say it slightly more straightforward."

**OLD:** `and we think this could be due to the dynamic range`
**Suggested (his words):** `but this could be due to the dynamic range`

### ❌ L66 — R² isn't accuracy
> "I would correct this because R squared isn't really accuracy… I would say like accuracy, linearity, and precision are summarised."

**OLD:** `The accuracy ($m$, $R^2$) and precision (CoV) of all diameter measurement methods are summarised`
**Suggested (his words):** `The accuracy ($m$), linearity ($R^2$) and precision (CoV) of all diameter measurement methods are summarised`

### ❌ L145 — add the standard-deviation point, drop "opposite trend"
> "Here you could say, MeIP generally gave slopes closer to unity than MIP, and also provided smaller standard deviations for model-based methods."
> Then: "No need for 'opposite trend' — just say that linearity showed pre-contrast R squared higher for MIP… Actually, you can kind of remove the state[ment], you say it in the next line… I would just remove this."

He first said MeIP "always reduced the error," then hedged: *"I would have to be checked. That I'm not confident in… For the model[-based], yes, but for the binary mask case… maybe that's just a statement for the model."* I checked Table 1 — he was right to hedge. For model-based, MeIP has the lower CoV in all nine comparisons. For binary masks it fails post-contrast at BM-1 and BM-2, where MIP is lower (0.10 vs 0.13, 0.10 vs 0.12). So it is scoped to model-based below.

**OLD:** `MeIP generally gave slopes closer to unity than MIP, but the linearity showed the opposite trend before contrast.`
**Suggested:** `MeIP generally gave slopes closer to unity than MIP, and also provided smaller standard deviations for the model-based methods (Table~\ref{tab:accuracy}).`

*(If you'd rather cite the metric the table actually reports, swap "smaller standard deviations" for "lower CoV values" — CoV is SD/mean, so the literal SD claim isn't proven by Table 1.)*

### ❌ L147 — cut the causal clause
> "This reads slightly as a causal statement, but it's not closer to the identity because [that]… I think this can just be safely cut, without really changing what you're saying, because it's already clear that this is closer than that."

**OLD:** `for MeIP) because MeIP overshot unity, and was also more linear`
**Suggested:** `for MeIP), and was also more linear`

### ❌ L169 — reorder §3.3
> "I just want to move this down… this is talking about the follow-up assessment, where we want to investigate the correlation with intensity. But before that, we have the general flicker stimulation results. So I'd present the general results 1st and then talk about the correlation with intensity as a follow-up… We want to see how the models performed in a controlled induction of diameter change, something along that. That's how we open the 1st paragraph."

**MOVE** `To assess whether angiogram intensity itself biases the diameter measurements, we examined the intensity time series alongside the diameter time series.` down to become the first sentence of the second paragraph.

**Suggested opener in its place (mine, from his sketch):** `To evaluate how each method performed under a controlled induction of diameter change, flicker stimulation was used to evoke vasodilation while the same vessels were tracked over time.`

### ❌ L169 — justify BM-5 + MeIP
> "Because it has the lowest coefficient [of] variation… and it has, I think, the highest R squared as well. So the slope doesn't matter so much because we can correct… I think when you look at this, it's clear that this is sort of the best combination for binary, post-contrast… I would maybe just have a one line sentence. Based on your results, we picked these parameters to decide which one to use for the binary mask based analysis."

Numbers confirmed from Table 1: among MeIP thresholds post-contrast, BM-5 has the lowest CoV (0.09) and joint-highest R² (0.82).

**Suggested (mine):** `For the binary-mask-based measurements, BM-5 applied to the MeIP was used, as this combination gave the lowest CoV (0.09) and the joint-highest $R^2$ (0.82) of the binary-mask configurations post-contrast; its slope is further from unity, but a systematic offset of this kind is correctable by calibration.`

### ❌ L169 — note GG agreed closest
> "I would maybe mention that the generalized Gaussian agreed the closest with the ground truth… in the flicker stimulation. This is the closest to the ground truth, in terms of just eyeballing it. It's pretty clear."

**ADD** after `…the GG model showed significant increases in four of five vessels (Table~\ref{tab:flicker}).`
**Suggested (mine):** `Of the three methods, the GG model agreed most closely with the manually measured ground truth (Figs.~\ref{fig:flicker}d--f).`

### ❌ L163 — Fig. 7 caption
> "I wouldn't say accuracy and precision… I would just say summary of like linearity, R squared, and precision, CoV, across all diameter measure[ment] methods. Because the accuracy, I guess, is the slope, and then R squared is more like linearity or correctability… I would maybe still make the clarification for which means which, just in case anyone is coming to this plot fresh, then they can see, okay, CoV is precision."

**OLD:** `Summary of accuracy and precision across all diameter measurement methods. (a, b) Coefficient of variation (CoV) and (c, d) coefficient of determination ($R^2$) for MIP (a, c) and MeIP (b, d), respectively.`
**Suggested:** `Summary of linearity and precision across all diameter measurement methods. (a, b) Coefficient of variation (CoV), a measure of precision, and (c, d) coefficient of determination ($R^2$), a measure of linearity and hence of how reliably a measurement can be corrected, for MIP (a, c) and MeIP (b, d), respectively.`

### ❌ Fig. 8 caption — X marker and significance key
> **On the stars:** "I would still include them in the figures that use them. There's only a couple figures that use them… anybody reading this out of context — a lot of people 1st look at figures, and it should be apparent from the figure what is being looked at." On the page-layout problem that made you move them: "That's a typesetting issue. I wouldn't worry about that until it's accepted and ready for publication. That would be something to deal with in the proofing stage."
> **On the X:** "Mark ground truth. So arteries and veins here… You can just say this one was the closest, and I would maybe add this extra column so that we can see, okay, this is what was measured manually."

**APPEND (mine):** `Crosses ($\times$) indicate the manually measured ground truth diameter for each vessel. Significance levels: $^{*}p < 0.05$, $^{**}p < 0.01$, $^{***}p < 0.001$.`

### ❌ Table 2 caption — significance key
Same reasoning as above.
**APPEND:** `Significance levels: $^{*}p < 0.05$, $^{**}p < 0.01$, $^{***}p < 0.001$.`

---

# discussion.tex

### ❌ L5 and L7 — model-based is not thresholdless
> "I would change this statement. So it does have a threshold. [The] 1/e² is our threshold. You could choose… the full [width at] half max. So where we're choosing to measure it is the threshold… So I wouldn't say that it's thresholdless… Instead of saying that we don't have one, I would say that it's easier to define. Or more consistent to define…" — **You:** "Or intensity independent." — **Him:** "Intensity independent, yes, that's a better word for it. Because there is a threshold. It's just not sensitive to intensity."

Two occurrences. He landed on **"intensity-independent"** (your suggestion, which he preferred). His alternatives were "easier to define" / "more consistent to define". Both sentences need restructuring for it to read, so the wording below is mine.

**OLD (first):** `it is inherently less sensitive to changes in angiogram signal and does not require a threshold at all.`
**Suggested:** `it is inherently less sensitive to changes in angiogram signal, and the level at which the diameter is defined is intensity-independent rather than set by the absolute intensity of the image.`

**OLD (second):** `Because the model-based fit requires no threshold, it returns`
**Suggested:** `Because the level at which the model-based diameter is read off is intensity-independent, it returns`

### ⚠️ L7 — minor wording
> "I would just say diameter underestimation can be corrected."

Adds the noun back so the sentence doesn't open on a bare "Underestimation". Very minor.

**OLD:** `Underestimation can be corrected by a fixed proportion using the slope`
**Suggested (his words):** `Diameter underestimation can be corrected by a fixed proportion using the slope`

### ❌ L7 — say why MIP is singled out
> "The reason why you're specifically talking about MIP is because that's the most commonly used one… you can say, whereas the binary mask-based MIP, which is the most commonly used, fell from… This is the type of stuff which is really easy to forget to include in a paper. You know it, I know it — but the reader doesn't."

**OLD:** `whereas binary mask based MIP fell from 0.81 at BW-1 to 0.48 at BW-5`
**Suggested:** `whereas binary-mask-based MIP, which is the most commonly used, fell from 0.81 at BM-1 to 0.48 at BM-5`

### ❌ L13 — weaken to an observation
> "I just weakened this statement a little bit. Theoretically, I think it's pretty much true as long as it's done right. I would just say: in this study we observed that the generalized Gaussian outperformed… Because we make the same statement later, essentially — the GG reduces to a standard Gaussian when beta equals 2… so a correctly applied GG fit should perform at least as well. We more explicitly say it there."

Keep the β = 2 sentence that follows; that's where the general claim belongs.

**OLD:** `The generalised Gaussian (GG) model will always outperform the standard Gaussian because`
**Suggested (his words):** `In this study we observed that the generalised Gaussian (GG) model outperformed the standard Gaussian, because`

### ❌ L15 — greatest underestimation
> "Instead of saying the weakest accuracy, I would say the greatest underestimation… Because it makes it sound like it's bad, but it's correctable. So it's the most underestimated. But the lin[earity] is very high, so — indicating — you say it exactly right, it's just to weaken this a little bit."

**OLD:** `consistently showed the weakest accuracy`
**Suggested (his words):** `consistently showed the greatest underestimation`

### ❌ L33 — recite the intro's binarisation refs
> "You can include the references from the introduction… You don't have to talk about them at all. You can just recite them so that we can link it back to what we talked about in the intro, in that there's a million methods and there's not a clear choice."

**OLD:** `There are numerous other approaches for binarising the angiogram, which will most likely each behave differently.`
**Suggested:** `There are numerous other approaches for binarising the angiogram~\cite{mehta...,rabiolo...,borrelli...,freedman...,arrigo...}, which will most likely each behave differently.`

### ❌ L35 — cut the speculative claim
> "This is a very strong statement… But it's true, I think I agree with you. But theoretically, there could be a model that better accommodates these things… I think we sort of already make our point, we've already talked about it. I don't think we necessarily need this statement… It's just that it's not something that we specifically tested and can support with our own data at this point. So I would hesitate to include it. You can read through it and see if you feel that it's necessary."

**DELETE:** `The model-based approach avoids this limitation entirely by deriving diameter from the shape of the intensity profile rather than from an intensity cut-off, making it a fundamentally different and more robust alternative for quantitative diameter analysis.`

### ❌ L58 → above L54 — broad before specific
> "This part I would move up. 'The magnitudes we observed'… this is, again, broad to specific. This is sort of a broad statement, and it leads into specific statements."

**MOVE** `The magnitudes we observed are generally larger than those reported in the human studies, though direct comparison is difficult…` (with the `Species, anaesthesia, stimulation frequency…` sentence that follows it) to sit **before** `In our study, the magnitude of vasodilation…`.

### ❌ L54 — average, not range
> "I would just do the average of our observations instead of the range… I would probably average. I would just average these. I don't know if you're able to average what they reported… If it's not clearly obvious to do it, just ignore it." On the size: "I think saying our average is like 15 still is within reason. It's not crazy. Plus, it's mice, not humans."

**OLD:** `In our study, the magnitude of vasodilation detected by the generalised Gaussian model ranged from $+3.1\%$ to $+28.4\%$ across the vessels with a significant response (Table~\ref{tab:flicker}).`
**Suggested:** `In our study, the generalised Gaussian model detected a mean vasodilation of XX\% in the arteries and XX\% in the veins (Table~\ref{tab:flicker}).`

Same two numbers replace `+3.5 to +28.4` and `+3.1` in the Table 3 row.

### ❌ L56 — flag the OCT-based studies
> "Were these the only 2 that were OCT based?… you could just highlight, additionally, like this is for OCT. Like that distinguishes this from the other one."

**OLD:** `Among the studies listed, Son et al.~\cite{...} used the most similar setup to ours`
**Suggested (mine):** `Son et al.~\cite{...} and Radhakrishnan and Srinivasan~\cite{...} are the only OCT-based studies among those listed, and are therefore the most directly comparable to our own. Of these, Son et al. used the most similar setup to ours`

### ❌ L56 — cut the speculative Son passage
> "This part I marked as being speculation… For me, this is getting a little bit too focused in on this paper. I would probably just cut this. It's an interesting discussion to have, but it's a bit more speculative because we don't know how they did it. It's reading a little bit too much into it… Your statement here — 'the authors did not describe how vessel diameters were quantified for their B-scans, so it's worth considering whether their lateral measurements may have been affected by intensity-dependent artifacts characterised here' — perfect statement. I think that's all you need to say there… We don't really want to single out a paper, because we're sort of disagreeing with them or identifying that they might have done something less than accurate."

**KEEP** up to `…may have been affected by the intensity-dependent artefacts characterised here.`
**DELETE** from `In the lateral direction, the RBC orientation artefact suppresses signal at vessel edges…` through `…whether their reported anisotropy changes when the lateral diameter is quantified differently.`
Then continue at `An earlier OCT-based study by Radhakrishnan and Srinivasan…`

### ⚠️ L58 — Rai et al.
> "This one is harder to compare. It's reporting blood flow, not diameter… I would probably — you have enough supporting evidence here. I wouldn't necessarily include this one… Because you need measurements of diameter and the velocity to infer flow. We don't have the velocity."
> **You:** "Then I can remove that whole section with the Rai et al." — **Him:** "Yeah, maybe. I mean, you can reread it and see if it makes sense."

Left to you.

### ❌ L83 — Table 3, exposure time
> "Here you can include our exposure time. Because it's like 9 seconds."

**OLD (Present study, Duration column):** `Cont.`
**Suggested:** `9`

---

# conclusion.tex — L3

### ❌ Errant comma
> "There's a comma here that shouldn't be there."

**OLD:** `compared against model-based profile fitting, on both maximum and mean intensity projections.`
**Suggested:** `compared against model-based profile fitting on both maximum and mean intensity projections.`

### ❌ "metric" → "method", and name the condition
> "I would say method instead of metric, maybe… Maybe say what conditions they are. Like, if you mean pre-contrast, then just say pre-contrast. Just make it clear what you're talking about."
> On the correctability clause: "I would just say strongest linear, making it correctable by calibration."

**OLD:** `The generalised Gaussian $1/e^2$ metric retained the strongest linear relationship with the ground truth under these conditions, so the residual underestimation is systematic and can be removed by calibration.`
**Suggested:** `Under pre-contrast conditions, the generalised Gaussian $1/e^2$ method retained the strongest linear relationship with the ground truth, making the residual underestimation correctable by calibration.`

### ❌ Second "metric", plus precision
> "Maybe also say in highest precision. Because I think that's also true." — **You:** "I'll make sure if it's true."

Checked: post-contrast GG-1/e² + MeIP has CoV 0.09, the lowest in Table 1 — but **tied** with BM-5 + MeIP. So "of all combinations tested" would be joint, not sole; scoped to model-based below.

**OLD:** `Post-contrast, the same metric applied to the mean intensity projection provided results closest to the ground truth of all combinations tested.`
**Suggested:** `Post-contrast, the same method applied to the mean intensity projection provided results closest to the ground truth of all combinations tested, with the highest precision of the model-based methods (CoV = 0.09).`

### ❌ State intensity dependence before the consequence
> "I would maybe add a statement in between here, just indicating that it was highly intensity [dependent]… if you introduce that it's intensity dependent, then you have the next statement as the practical consequence of that dependence. And that just leads into it better."

**OLD:** `Binary mask based measurements depended on the threshold and the contrast condition, with the post-contrast slope falling steeply as the threshold increased.`
**Suggested:** `Binary-mask-based measurements were highly intensity-dependent, varying with both the threshold and the contrast condition, with the post-contrast slope falling steeply as the threshold increased.`

---

# Global replacements

1. **`BW-` → `BM-`** — 44 occurrences: methods, results, discussion, both table headers, Fig. 5/6 sub-captions.
2. **`binary mask based` → `binary-mask-based`** — 37 occurrences.
   > "Look up whether we should be doing a hyphen here, and then just make [it] consistent. So I'd have to look up if binary mask based…"

   Checked: all 37 sit before a noun, which is the case that takes hyphens. Full hyphenation also matches "model-based". Avoid `binary mask-based` — that groups *mask-based* and leaves *binary* modifying it.
3. **`enface` → `en face`** in prose only (leave figure filenames and labels).

# Spelling splits — not from the meeting
Mine, spotted while checking. They'd be caught in proof anyway:

4. **artifact / artefact** — intro has "artifact" ×2 and "artefact" ×1; results and discussion use "artefact" ×7. The draft leans British.
5. **visualize / visualise** — intro has "visualizes" and "visualization"; everywhere else uses "visualis-".
6. **generalized Gaussian** — one instance in the intro against "generalised" throughout.

---

# Still open — needs you
- **MATLAB averaging** for arterial and venous % change → discussion L54 *and* the Table 3 row.
- Keep or cut **Rai et al.**
- Pick your abstract opener (A, B or C).

# Main tex
- ✅ **Title** — yours.
- ✅ **Funding / Acknowledgments / Disclosures / Data availability** — copied in. SOD1 work was covered by the same two grants, nothing extra needed.

# Resolved, no action
Flicker duration 9 s · X = ground truth in Fig. 8d–f · DyC-OCT first · elasticity ref = Kannenkeril [8] · SOD1 genotype not needed · "glaucoma suspects" is current · MeIP claim scoped to model-based · hyphenate to "binary-mask-based" · conclusion precision claim supported (tied at 0.09).
