*==============================================================================
* 03_create_variables.do
*
* Purpose : Create the outcome indicator variables used in the analysis:
*             - dmft_disease : any dental caries (DMFT > 0)
*             - dt_index     : decayed teeth (combines age-specific variables)
*             - ft_index     : filled teeth (combines age-specific variables)
*             - pi_index     : periodontitis indicator
*
* Input   : data/DMS-V_m.dta
* Output  : data/DMS-V_m.dta (overwritten with derived variables)
*==============================================================================

capture log close
log using "../results/03_create_variables.log", text replace

use "../data/DMS-V_m.dta", clear

*------------------------------------------------------------------
* Dental caries prevalence (any untreated or treated caries)
*------------------------------------------------------------------
recode dmft (0 = 0) (1/max = 1), gen(dmft_disease)
lab var dmft_disease "Dental Caries Prevalence"
lab define dmft_disease 0 "No Caries" 1 "Caries"
lab values dmft_disease dmft_disease

tab dmft_disease

*------------------------------------------------------------------
* Decayed teeth (dt): combine child/adult variable versions
*------------------------------------------------------------------
egen dt_index = rowmax(dt dt28)

gen dt_index_new = ""
replace dt_index_new = "dt_d"  if dt_index > 0    // has decayed teeth
replace dt_index_new = "dt_nd" if dt_index == 0   // no decayed teeth

tab dt_index_new

*------------------------------------------------------------------
* Filled teeth (ft): combine child/adult variable versions
*------------------------------------------------------------------
gen ft_index = .
replace ft_index = ft if !missing(ft)
replace ft_index = ft28 if missing(ft_index) & !missing(ft28)

tab ft_index

gen ft_index_new = ""
replace ft_index_new = "ft_f"  if ft_index > 0    // has filled teeth
replace ft_index_new = "ft_nf" if ft_index == 0   // no filled teeth

tab ft_index_new

*------------------------------------------------------------------
* Periodontitis indicator: combine child/adult variable versions
*------------------------------------------------------------------
gen pi_index = .
replace pi_index = cpifm if !missing(cpifm)
replace pi_index = cpipm100 if missing(pi_index) & !missing(cpipm100)

tab pi_index

recode pi_index (1/2 = 1)
tab pi_index

* Cross-tabs for a quick sanity check of distributions by age group
tab pi_index agegrpNEU
tab dt_index_new agegrpNEU

save "../data/DMS-V_m.dta", replace

log close
