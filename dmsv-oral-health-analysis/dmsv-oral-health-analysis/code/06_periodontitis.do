*==============================================================================
* 06_periodontitis.do
*
* Purpose : Estimate weighted prevalence of periodontitis and edentulism,
*           overall and stratified by sex and age group.
*
* Input   : data/DMS-V_m.dta
* Output  : results/06_periodontitis.log
*==============================================================================

capture log close
log using "../results/06_periodontitis.log", text replace

use "../data/DMS-V_m.dta", clear
svyset [pw=gew]

*------------------------------------------------------------------
* Periodontitis: total, women, men
*------------------------------------------------------------------
svy: tab pi_index agegrpNEU, per col ci obs format(%9.1f)
svy: tab pi_index agegrpNEU if geschl == 2, per col ci obs format(%9.1f)
svy: tab pi_index agegrpNEU if geschl == 1, per col ci obs format(%9.1f)

*------------------------------------------------------------------
* Edentulism: total, women, men
*------------------------------------------------------------------
svy: tab zahnlos agegrpNEU, per col ci obs format(%9.1f)
svy: tab zahnlos agegrpNEU if geschl == 2, per col ci obs format(%9.1f)
svy: tab zahnlos agegrpNEU if geschl == 1, per col ci obs format(%9.1f)

log close
