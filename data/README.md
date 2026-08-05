# Data

The DMS V dataset cannot be distributed in this repository because it is subject to licensing restrictions.

Researchers should obtain the dataset directly from the original data provider (Institut der Deutschen Zahnärzte, IDZ).

## Expected files

Once obtained, place the following files in this folder so the pipeline in `code/` can find them:

- `DMS-V_Kinder.dta`
- `DMS-V_Juengere_Erwachsene.dta`
- `DMS-V_Aeltere_Senioren.dta`
- `DMS-V_3_juengere_Senioren.dta`

Running `code/01_import_merge.do` will merge these into a single working file, `DMS-V_m.dta`, also stored here. None of these files are tracked by git (see `.gitignore`).
