This study addresses an important source of bias in retinal OCT angiography (OCTA) vessel diameter measurements.
The comparison of projection methods, model fits, and binary masks against contrast-enhanced cross-sections is useful,
and the flicker experiment illustrates the consequences of intensity-dependent measurements. The central claims would
be stronger if the authors could address the following comments:

Title: The phrase “artefact-induced underestimation” does not identify the specific mechanism examined. Please consider
naming shear-induced artifacts, or any other appropriate terms, in the title so that the scope of the study is clear.

Line 56-58: OCTA can not only evaluate metrics based on the angiogram but also has been proven to quantitatively
measure blood flow, such as velocity [1], even down to the capillary scale [2]. Recognize the capability of OCTA.

Line 62-64: The introduction summarizes global and local binarization methods, while adaptive or dynamic thresholding
approaches are discussed later in Section 4.4. Please briefly introduce these approaches here and include
representative references, so that the overview of existing OCTA vessel quantification methods is more complete.

Line 67-68: There are different types of artifacts, from the blood flow itself or from the imaging protocol, and all of them
have been well discussed [3][4]. I think you could start with a big picture of artifacts in OCTA and then narrow the
scope to the specific types of artifacts you resolved in the manuscript. Also, please distinguish the mechanism from
depth projection or vessel-tail artifacts when framing the OCTA artifact literature. A brief discussion of relevant
projection-artifact suppression methods [5,6] (more available papers tried to address artifacts initiated from the blood
vessels) and why they do not directly resolve the edge-signal problem studied here would clarify the contribution of
the proposed method.

Line 68-69: The description of the hourglass appearance and reduced signal at the vessel edges would be easier to
understand with a representative, enlarged cross-sectional OCTA image showing this artifact.

Lines 67–77: The manuscript attributes the suppressed signal at vessel edges to red blood cell orientation. Please
distinguish this mechanism from depth projection or vessel-tail artifacts when framing the OCTA artifact literature.
A brief discussion of relevant projection-artifact suppression methods [5-7] and why they do not directly resolve the
edge-signal problem studied here would clarify the contribution of the proposed method.

Line 72-74: It is worth diversifying the references here. Many other groups also use Intralipid to enhance the contrast,
such as [8].

Line 101-103: Please specify the exact time: how long before and after the administration and stimulation. Is this time
affected by blood circulation? How long can mice be imaged after Intralipid administration? Does Intralipid have
any side effects?

*In this case I am not able to give a precise answer because the exact injection time was not recorded in our logs, but I can say that the time between the Intralipid injection and the stimulation scan would have been in the range of 1-3 minutes, during which, the enhanced contrast from the Intralipid should be stable.  Recirculation and stabilization of the tracer occurs rapidly and is apparant within 10 seconds as shown in Figure 3.  The tracer will be removed from the circulation over time, and a half-life of 9 minutes in rats has been reported [10.1038/s41598-017-16293-6].  Nevertheless, we have observed contrast from Intralipid beyond 10 minutes post-injection [YP First Paper].  For proper intravenous injection of Intralipid, no side effects are expected in mice.  Failed injections of lipid emulsions that miss the vein and deliver into the perivascular space have the potential to lead to tissue necrosis (https://www.sciencedirect.com/science/article/pii/0002961064901813?via%3Dihub).*

Line 168: The authors should specify whether ground truth measurements were taken at peak contrast, during the later
stabilized phase, or averaged across multiple frames. This distinction matters because Section 3.1 notes that vessels
appeared slightly wider at peak contrast than afterward. Please define the time window and frame-selection rule used
for the reference measurements, and clarify whether choosing a different contrast phase would materially change the
method comparisons in Section 3.2.

*Diameter measurements were typically acquired at peak contrast when available because this demonstrated the best contrast for identifying vessel edges.  Vessel boundaries were manually annotated from individual frames of the OCTA time stack and confirmed against adjacent frames using ImageJ.  While contrast was best during the peak phase, vessel boundaries were still in agreement in the post phase of the passage, so we do not believe that the specific phase significantly impacts the manual (see below).  It is important to note that while we mentioned in the qualitative assesment in section 3.1 that the vessels "appeared slightly wider at peak than post-contrast", we also pointed out that "this could be due to the dynamic range of the image rather than a true diameter change," and based on our results, we believe this to be the case.  We have added additional details to the methods section to clarify our methods.*

**Line 146 5 B-scan repeats**

**Vessel boundaries were manually annotated from individual frames of the OCTA time stack and confirmed against adjacent frames using ImageJ (ImageJ info here).  When available, frames were selected from the peak of the bolus passage due to higher contrast, but measurements remained in agreement during the post-bolus phase.** 

line 376

lines 188–193： Using Intralipid-enhanced images to establish reference diameters and calibrate the method is
appropriate. However, the vessel-specific skew correction factor, (d_{GT}/d_x), is also derived from those enhanced
images. Please clarify whether this factor was applied to the pre-contrast measurements reported in Table 1 and the
corresponding figures. If it was, the authors should distinguish the performance demonstrated after this correction
from the performance achievable when only native OCTA images are available. Results without the vessel-specific
skew correction, or an explanation of how off-axis vessel orientation would be handled in that setting, would help
support the proposed contrast-free application.

*The vessel-specific skew correction was applied to all the results in the manuscript, both pre- and post-contrast to correct for the unknown skew angle in the DyC-OCT imaging plane.  This correction is actually simpler to achieve in traditional OCTA, where the skew angle can be measured directly from the enface projection of the vessels or where the 3D data can be interpolated perpendicular to the vessel axis such that there are no effects of vessel skew.  Regardless, the application of the skew correction should not affect the performance of the methods presented here, it simply scales the measured diameters so that they reflect the true diameters of the measured vessels.  We have expanded the discussion so that it is clear how vessel skew could be addressed in traditional OCTA scans.*

Line 133-134: Are the data divided manually based on the evidence of vascular response? Will this step introduce any
human factor?

Lines 138–145: The manuscript explains that ketamine/xylazine was chosen for the flicker experiment to minimize
anaesthesia-induced vasodilation. Please clarify why the other C57BL/6J mouse received a different maintenance
regimen, whether measurements obtained under different anaesthesia protocols were pooled in the regression and
calibration analyses, and whether the results are sensitive to that pooling. Animal-level results or a sensitivity
analysis would help address this concern.

Section 2.3.1, lines 168–176: The ground-truth diameter is defined using the smaller of the lateral and axial diameters
measured in contrast-enhanced B-scans. Please explain how the axial boundary, particularly the posterior edge of the
vessel lumen, was identified when projection tails or other depth-related signals were present. A representative B-
scan with the measured boundaries marked, together with the artifact-suppression or manual measurement criteria,
would help establish the reliability of axial diameter.

*In our case, we did not have any issues separating the posterior axial boundary from projection tails because we performed this measurement during the passage of the contrast agent, which increased the visibility of the vessel boundaries relative to any tail artefacts.  Boundaries were measured manually without additional artefact suppression.  We have added further information to the methods:*

**Axial vessel segmentation was performed manually during the peak or post phases of the contrast passage **

Line 258 and Figure 2: The vessels are visible, but matched magnified insets or arrows marking the same vessels before
and after contrast would make the reported changes in apparent width easier to assess, particularly in the
intermediate and deep capillary plexuses. Please use comparable display scaling in each pair of panels.

Discussion, Section 4.7: OCTA is also used in preclinical studies of brain pathology. Please discuss whether the
proposed generalised Gaussian fitting approach and the preference for mean intensity projection could be applied to
vessel diameter measurements in cortical OCTA. The present validation focuses on larger vessels in the superficial retinal
plexus. It would therefore be helpful to identify which assumptions may carry over to cortical imaging and which factors,
such as vessel orientation, imaging depth, and signal characteristics, would require separate validation. This discussion
would clarify the potential scope of the method without implying that its applicability to cortical OCTA has already been
established.