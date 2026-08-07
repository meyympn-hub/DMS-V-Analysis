# Variable Dictionary

Variables from the raw DMS V dataset, and derived variables created by the analysis.

## Raw variables (from DMS V)

| Variable   | Description                                                        |
|------------|---------------------------------------------------------------------|
| `geschl`   | Sex (1 = male, 2 = female)                                          |
| `alter`    | Age in years                                                        |
| `dmft`     | DMFT index (decayed, missing, filled teeth) — adult          |
| `dt`       | Decayed teeth count — adult                                  |
| `dt28`     | Decayed teeth count — child                      |
| `ft`       | Filled teeth count — adult version                                  |
| `ft28`     | Filled teeth count — child                         |
| `cpifm`    | Periodontitis indicator — one variable                       |
| `cpipm100` | Periodontitis indicator — alternate variable                 |
| `zahnlos`  | Edentulism (complete tooth loss) indicator                          |
| `schulst`  | Education/school status                                             |
| `ostwest`  | Region (former East/West Germany)                                   |
| `bmikl`    | BMI category                                                        |
| `gew`      | Survey sampling weight                                              |

**TODO:** fill in exact coding/labels for each variable above (e.g. what each `schulst` or `bmikl` category means) so this table is self-contained for someone without access to the DMS V codebook.

## Derived variables (created in `code/`)

| Variable        | Created in                | Description                                                        |
|------------------|---------------------------|----------------------------------------------------------------------|
| `studygroup`     | `01_import_merge.do` / `02_clean_variables.do` | Study group: 1 = Kinder, 2 = Juengere Erwachsene, 3 = Juengere Senioren, 4 = Aeltere Senioren |
| `agegrpNEU`      | `02_clean_variables.do`   | Refined age group used for stratified analysis (see labels in script) |
| `dmft_disease`   | `03_create_variables.do`  | Any dental caries indicator (0 = No Caries, 1 = Caries)             |
| `dt_index`       | `03_create_variables.do`  | Combined decayed-teeth count (`dt` or `dt28`)                       |
| `dt_index_new`   | `03_create_variables.do`  | Decayed teeth: "dt_d" (has decay) / "dt_nd" (no decay)               |
| `ft_index`       | `03_create_variables.do`  | Combined filled-teeth count (`ft` or `ft28`)                        |
| `ft_index_new`   | `03_create_variables.do`  | Filled teeth: "ft_f" (has fillings) / "ft_nf" (no fillings)          |
| `pi_index`       | `03_create_variables.do`  | Combined periodontitis indicator (`cpifm` or `cpipm100`), recoded to binary |
