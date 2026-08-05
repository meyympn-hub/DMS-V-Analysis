# DMS V Oral Health Analysis

This repository contains the analysis pipeline used for my MSc Epidemiology thesis at Charité – Universitätsmedizin Berlin.

## Research question

Assessing the burden of oral diseases in Germany using data from the Fifth German Oral Health Study (DMS V).

## Objectives

- Dental caries prevalence
- Periodontitis prevalence
- Edentulism prevalence
- Burden of disease estimation (YLD)
- Comparison with Global Burden of Disease estimates

## Software

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
│   ├── 07_figures.do
│   └── 08_tables.do
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
3. Run `00_run_all.do`, or run scripts `01` through `08` individually in order.

## Data

The dataset is not included in this repository due to licensing restrictions. See `data/README.md` for details on how to obtain it.
