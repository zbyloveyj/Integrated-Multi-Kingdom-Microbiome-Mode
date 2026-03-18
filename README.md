# Integrated-Multi-Kingdom-Microbiome-Mode
# 🧠 Multi-kingdom gut microbiome analysis in first-episode drug-naïve MDD

## Overview

This study investigates gut microbiome alterations in **first-episode, drug-naïve young adults with major depressive disorder (MDD)** using **shotgun metagenomic sequencing**.

Unlike conventional studies focusing only on bacteria, we performed a **systematic multi-kingdom analysis**, including:

* 🦠 Bacteria
* 🧫 Archaea
* 🍄 Eukaryotes
* 🧬 Viruses

We further integrated **functional genes, metabolic pathways, cognitive phenotypes, and machine learning models** to evaluate their clinical relevance and diagnostic potential.
<img width="1024" height="1024" alt="image" src="https://github.com/user-attachments/assets/2571858e-07c8-4d5a-aab6-60c07dd9e7e8" />

---

## Study design

### Participants

* **MDD group**: 121 first-episode, drug-naïve young adults
* **HC group**: 117 healthy controls (age-, sex-, BMI-matched) 

### Clinical assessment

* Depression severity: **HAMD-17**
* Cognitive function: **MCCB**, including:

  * Processing speed
  * Attention/vigilance
  * Working memory
  * Verbal learning
  * Visual learning 

### Key feature of the cohort

* No prior medication exposure
* Early-stage disease
* Reduced clinical confounding

---

## Data generation

### Sample collection

* Fecal samples collected in fasting state (morning)
* Stored at −80°C before DNA extraction 

### Sequencing

* Shotgun metagenomic sequencing
* ~350 bp fragment library construction
* Standard Illumina workflow 

---

## Analytical workflow

### 1. Taxonomic profiling

Multi-kingdom microbial composition was profiled at species level:

* Bacteria
* Archaea
* Eukaryotes
* Viruses

---

### 2. Diversity analysis

* Alpha diversity: ACE, Chao1, Shannon
* Beta diversity: Bray–Curtis + PCoA
* Statistical test: PERMANOVA 

---

### 3. Differential species identification

* Method: LDA-based analysis
* Multi-kingdom comparison (MDD vs HC)

---

### 4. Functional analysis

* Gene-level analysis (KEGG orthology)
* Pathway enrichment (ReporterScore)
* Association analysis (MaAsLin2) 

---

### 5. Clinical association

* Microbiome ↔ cognitive scores
* Microbiome ↔ clinical symptoms

---

### 6. Machine learning

* Model: Random Forest
* Strategy:

  * Independent test set
  * Repeated random splitting (20 iterations)
* Output:

  * AUC
  * Feature importance

---

## Main findings

### 1. Multi-kingdom dysbiosis

* Significant alterations observed across multiple microbial kingdoms

* Not limited to bacterial changes

* Reduced diversity in:

  * Eukaryotes
  * Viruses

* No significant alpha diversity change in bacteria/archaea 

* Bacterial beta diversity significantly altered

* Cross-kingdom diversity correlations observed
  → suggests ecological interdependence 

---

### 2. Species-level biomarkers

Differential taxa identified across kingdoms:

* **Bacteria (MDD-enriched)**

  * *Bacteroides uniformis*
  * *Bacteroides fragilis*
  * *Alistipes spp.*

* **Bacteria (HC-enriched)**

  * *Bifidobacterium pseudocatenulatum*
  * *Lachnospira eligens* 

* **Eukaryotes / Archaea / Viruses**
  → multiple species with group-specific enrichment 

👉 Overall:

> Dysbiosis extends beyond bacteria to a full multi-kingdom shift

---

### 3. Functional alterations

* 22 differential genes identified
* 32 metabolic pathways altered 

Key patterns:

* Enrichment in metabolic pathways
* Involvement of neuro-related pathways
* Functional beta diversity significantly altered

---

### 4. Microbiome–cognition associations

* 5 bacterial species
* 4 viral species

significantly associated with cognitive domains 

Example:

* *Bifidobacterium pseudocatenulatum*
  → positively correlated with attention/vigilance

---

### 5. Machine learning performance

* Multi-kingdom integrated model:

  * AUC ≈ **0.80–0.86** 

* Outperformed:

  * Bacteria-only model
  * Single-kingdom models

* Optimal feature number:

  * ~20 features

👉 Interpretation:

* Multi-kingdom integration captures complementary biological signals
* Improves diagnostic robustness

---

## Conceptual interpretation

This study supports a **multi-layer framework**:

Microbiome (multi-kingdom)
→ Functional pathways
→ Cognitive impairment
→ Clinical phenotype

Rather than a single microbial signal, MDD appears associated with a **system-level ecological disruption**.

---

## Strengths

* Multi-kingdom perspective (beyond bacteria)
* Drug-naïve first-episode cohort
* Integration of taxonomy + function + cognition
* Robust machine learning validation

---

## Limitations

* Moderate sample size
* No external validation cohort
* Lack of detailed dietary data
* Cross-sectional design (no causality) 

---

## Conclusion

This study demonstrates that:

* MDD is associated with **broad multi-kingdom gut microbiome alterations**
* Functional and ecological changes are tightly linked
* Multi-kingdom microbial features show **promising diagnostic potential**

These findings provide a more complete view of the gut microbiome in MDD and support future work on **mechanism and biomarker development**.

---

## Notes

* Data and code: available upon request
* Ethics approval: obtained (Guangzhou Medical University) 

---
