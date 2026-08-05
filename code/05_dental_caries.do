*==============================================================================
* 05_dental_caries.do
*
* Purpose : Estimate weighted prevalence of dental caries, decayed teeth,
*           and filled teeth, overall and stratified by sex, age group,
*           education, region, and BMI category.
*
* Input   : data/DMS-V_m.dta
* Output  : results/05_dental_caries.log
*==============================================================================

capture log close
log using "../results/05_dental_caries.log", text replace

use "../data/DMS-V_m.dta", clear
svyset [pw=gew]

*------------------------------------------------------------------
* Dental caries prevalence
*------------------------------------------------------------------
svy: tab dmft_disease, per ci obs format(%9.1f)
svy: tab dmft_disease geschl, per col ci obs format(%9.1f)
svy: tab dmft_disease agegrpNEU, per col ci obs format(%9.1f)
svy: tab dmft_disease schulst, per col ci obs format(%9.1f)
svy: tab dmft_disease ostwest, per col ci obs format(%9.1f)
svy: tab dmft_disease bmikl, per col ci obs format(%9.1f)

*------------------------------------------------------------------
* Decayed teeth: total, women, men
*------------------------------------------------------------------
svy: tab dt_index_new agegrpNEU, per col ci obs format(%9.1f)
svy: tab dt_index_new agegrpNEU if geschl == 2, per col ci obs format(%9.1f)
svy: tab dt_index_new agegrpNEU if geschl == 1, per col ci obs format(%9.1f)

*------------------------------------------------------------------
* Filled teeth: total, women, men
*------------------------------------------------------------------
svy: tab ft_index_new agegrpNEU, per col ci obs format(%9.1f)
svy: tab ft_index_new agegrpNEU if geschl == 2, per col ci obs format(%9.1f)
svy: tab ft_index_new agegrpNEU if geschl == 1, per col ci obs format(%9.1f)

* Mean number of decayed / filled teeth among those affected
svy, subpop(if ft_index > 0): mean ft_index, over(agegrpNEU geschl)
svy, subpop(if dt_index > 0): mean dt_index, over(agegrpNEU geschl)

log close
