*==============================================================================
* 01_import_merge.do
*
* Purpose : Import the four DMS V study-group datasets, tag each observation
*           with its study group, and append them into a single working file.
*
* Input   : data/DMS-V_Kinder.dta
*           data/DMS-V_Juengere_Erwachsene.dta
*           data/DMS-V_Aeltere_Senioren.dta
*           data/DMS-V_3_juengere_Senioren.dta
*
* Output  : data/DMS-V_m.dta
*
* Notes   : Expected(Available) sample sizes:
*             Kinder               = 1,468
*             Juengere Erwachsene    =   966
*             Juengere Senioren      = 1,042
*             Aeltere Senioren       = 1,133
*             Total                =  4,609
*==============================================================================

capture log close
log using "../results/01_import_merge.log", text replace

* --- Children ----------------------------------------------------------------
use "../data/DMS-V_Kinder.dta", clear
gen studygroup = 1
label define studygroup 1 "Kinder"
label values studygroup studygroup

save "../data/DMS-V_m.dta", replace

* --- Append remaining study groups -------------------------------------------
use "../data/DMS-V_m.dta", clear
append using "../data/DMS-V_Juengere_Erwachsene.dta"
append using "../data/DMS-V_Aeltere_Senioren.dta"
append using "../data/DMS-V_3_juengere_Senioren.dta"

* check against expected sample sizes above
tab studygroup
tab geschl

save "../data/DMS-V_m.dta", replace

log close
