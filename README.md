# Wheat Yield Analysis Using a Randomized Complete Block Design

A group project for the **Design and Analysis of Experiments** course at **BINUS University**.

The project compares wheat genotype yields using a **Randomized Complete Block Design (RCBD)**, with field columns used as blocks to account for variation across the experimental field.

## Dataset

The report identifies the data as the **CIMMYT El Batan wheat trial** in Mexico, discussed by Besag and Higdon (1999).

The dataset contains **150 observations**, covering **50 wheat genotypes** across **three blocks**. Each genotype appears once in each block.

| Variable | Description |
| --- | --- |
| `yield` | Observed wheat yield |
| `gen` | Wheat genotype |
| `col` | Field column used as the blocking factor |
| `row` | Row position within the field |

## Methods

The R script uses `AgroR::DBC()` to perform RCBD analysis with Fisher's Least Significant Difference (LSD) comparisons.

The analysis includes:

- ANOVA for genotype and block effects.
- Shapiro–Wilk testing for residual normality.
- Bartlett testing for equal variances.
- Durbin–Watson testing for residual autocorrelation.
- Fisher's LSD comparisons between genotype means.

## Reported Results

### ANOVA

| Effect | F-statistic | p-value |
| --- | --- | --- |
| Genotype | 1.808639 | 0.006611 |
| Block | 1.134672 | 0.325715 |

At the **0.05 significance level**, the analysis indicates differences among genotype mean yields. The block effect was not statistically significant.

### Assumption Checks

| Test | p-value | Interpretation |
| --- | --- | --- |
| Shapiro–Wilk | 0.06999 | No significant evidence against residual normality |
| Bartlett | 0.28203 | No significant evidence of unequal variances |
| Durbin–Watson | 3.55 × 10⁻¹² | Evidence of residual autocorrelation |

The autocorrelation result raises concerns about the independence assumption, so the ANOVA and pairwise comparisons should be interpreted cautiously.

### Genotype Comparisons

The reported Fisher's LSD threshold is **1.163**. Selected genotype results are shown below:

| Genotype | Mean yield | LSD group |
| --- | --- | --- |
| G17 | 3.610620 | a |
| G04 | 3.564330 | ab |
| G01 | 3.402317 | abc |
| G33 | 1.712730 | ij |
| G30 | 1.604720 | ij |
| G36 | 1.465850 | j |

G17 had the highest observed mean yield, while G36 had the lowest. Genotypes sharing a group letter were not significantly different under the reported LSD procedure.

These results come from the submitted report and have not been independently reproduced. The study recommends considering spatial modeling in future analysis; the supplied script does not implement it.

## Tools

**R**, with the packages **AgroR**, **agricolae**, and **doebioresearch**.

## Project Files

| File | Description |
| --- | --- |
| `Kelompok5_AOL_DAE_Code.R` | Data loading and RCBD analysis |
| `data.csv` | Wheat trial data |

## How to Run

1. Install the required R packages.
2. Update the script's `setwd()` path to the folder containing `data.csv`.
3. Run the script in R or RStudio.

The main analysis command is:

```r
DBC(df$gen, df$col, df$yield, mcomp = "lsd")
```

## Authors

**Group 5 — BINUS University**

- Marcell Prasetyo
- Aaron Jeremy Alexander
- Ricardo Xavier Rinzi
- Satya Darma Padmakumara
- Anthony
- I Made Rayxelvio Erawan Rustiadi
