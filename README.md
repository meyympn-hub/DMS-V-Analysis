# DMS V Oral Health Analysis

This repository contains the analysis pipeline used for my master's thesis in Epidemiology at Charité – Universitätsmedizin Berlin.

## Methodology

This study analyses nationally representative, cross-sectional oral health data collected by the Institute of German Dentists (IDZ) as part of the Fifth German Oral Health Study (DMS V) study conducted from 2013 to 2014. The data consists of clinical oral health examinations and socio-demographic information for predefined age groups. Prevalence of carious disease, periodontitis, and edentulism was estimated using standardized clinical indices. Disease burden was quantified as Years Lived with Disability (YLDs), applying disability weights and severity distributions from the GBD framework. Estimates were stratified by age and sex, weighted to reflect the German population and compared with corresponding GBD estimates.

## Software used

- Stata
- R

## Repository structure

```
dmsv-oral-health-analysis/
├── README.md
├── LICENSE
├── .gitignore
├── code/
│   ├── 00_run_all.do
│   ├── 01_import_merge.do
│   ├── 02_clean_variables.do
│   ├── 03_create_variables.do
│   ├── 04_weighting.do
│   ├── 05_dental_caries.do
│   ├── 06_periodontitis.do
│   ├── 07_code_R
├── data/
│   └── README.md
├── results/
│   ├── figures/
│   └── tables/
└── documentation/
    └── variable_dictionary.md
```

## How to reproduce

1. Obtain the DMS V dataset from the original data provider (see `data/README.md`) and place the raw files in `data/`.
2. Open Stata and set your working directory to `code/`.
3. Run `00_run_all.do`, or run scripts `01` through `07` individually in order.

## Data

The dataset is not included in this repository due to licensing restrictions. The authors state that access restrictions apply to the DMS V data from the Institute of German Dentists on which the results are based. Due to strict data protection regulations, DMS V data are generally not publicly available. Therefore, the minimal dataset underlying the results of this study is archived but cannot be made available to other researchers.
