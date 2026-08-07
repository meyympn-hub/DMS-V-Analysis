*==============================================================================
* 02_clean_variables.do
*
* Purpose : Assign correct study-group codes by age, and derive the new
*           age-group variable (agegrpNEU) used throughout the analysis.
*
* Input   : data/DMS-V_m.dta
* Output  : data/DMS-V_m.dta (overwritten with cleaned variables)
*==============================================================================

capture log close
log using "../results/02_clean_variables.log", text replace

use "../data/DMS-V_m.dta", clear

*------------------------------------------------------------------
* Assign study group by age
*------------------------------------------------------------------
replace studygroup = 2 if alter >= 34 & alter <= 44   // Juengere Erwachsene
label define studygroup 2 "Juengere Erwachsene", add

replace studygroup = 3 if alter >= 64 & alter <= 74   // Juengere Senioren
label define studygroup 3 "Juengere Senioren", add

replace studygroup = 4 if alter >= 75 & alter <= 100  // Aeltere Senioren
label define studygroup 4 "Aeltere Senioren", add

*------------------------------------------------------------------
* Create new, aggregated age groups (agegrpNEU) for stratified analysis
*------------------------------------------------------------------
gen agegrpNEU = 0   // default: children (studygroup 1)

replace agegrpNEU = 1 if alter >= 34 & alter <= 39
replace agegrpNEU = 2 if alter >= 40 & alter <= 44
replace agegrpNEU = 3 if alter >= 64 & alter <= 69
replace agegrpNEU = 4 if alter >= 70 & alter <= 74
replace agegrpNEU = 5 if alter >= 75 & alter <= 79
replace agegrpNEU = 6 if alter >= 80 & alter <= 84
replace agegrpNEU = 7 if alter >= 85

replace agegrpNEU = 0 if studygroup == 1

label var agegrpNEU "New age groups"
label define agegrpNEU  0 "14 (children)" ///
                         1 "35-39" ///
                         2 "40-44" ///
                         3 "65-69" ///
                         4 "70-74" ///
                         5 "75-79" ///
                         6 "80-84" ///
                         7 "85+"
label values agegrpNEU agegrpNEU

tab agegrpNEU

save "../data/DMS-V_m.dta", replace

log close
