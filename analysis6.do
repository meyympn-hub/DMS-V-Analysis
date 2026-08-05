
log using "C:\Users\shylu\OneDrive\Desktop\Masters Thesis\results6.log", text replace

use "C:\Users\shylu\OneDrive\Desktop\Masters Thesis\dataset\DMS-V_Kinder.dta", clear
gen studygroup = 1  
label define studygroup 1 "Kinder"
label values studygroup studygroup

save "C:\Users\shylu\OneDrive\Desktop\Masters Thesis\dataset\DMS-V_m.dta", replace

use "C:\Users\shylu\OneDrive\Desktop\Masters Thesis\dataset\DMS-V_m.dta", clear
append using "C:\Users\shylu\OneDrive\Desktop\Masters Thesis\dataset\DMS-V_Jüngere Erwachsene.dta"
append using "C:\Users\shylu\OneDrive\Desktop\Masters Thesis\dataset\DMS-V_Ältere Senioren.dta"
append using "C:\Users\shylu\OneDrive\Desktop\Masters Thesis\dataset\DMS-V_3_jüngere_Senioren.dta"


* Kinder = 1.468
* Jüngere Erwachsene = 966
* Jüngere Senioren = 1.042
* Ältere Senioren = 1.133
* Gesamt = 4.609


tab geschl


recode studygroup (. = .)  
recode dmft (0 = 0) (1/max = 1), gen(dmft_disease)

lab var dmft_disease "Dental Caries Prevalence"
lab define dmft_disease 0 "No Caries" 1 "Caries"
lab values dmft_disease dmft_disease

tab dmft_disease


replace studygroup = 2 if alter >= 34 & alter <= 44  // Jüngere Erwachsene
lab define studygroup 2 "Jüngere Erwachsene", add

replace studygroup = 3 if alter >= 64 & alter <= 74  // Jüngere Senioren
lab define studygroup 3 "Jüngere Senioren", add

replace studygroup = 4 if alter >= 75 & alter <= 100  // Ältere Senioren
lab define studygroup 4 "Ältere Senioren", add

gen agegrpNEU = 0  // Start by setting the default value as 0 for all observations


replace agegrpNEU = 1 if alter >= 34 & alter <= 39
replace agegrpNEU = 2 if alter >= 40 & alter <= 44
replace agegrpNEU = 3 if alter >= 64 & alter <= 69
replace agegrpNEU = 4 if alter >= 70 & alter <= 74
replace agegrpNEU = 5 if alter >= 75 & alter <= 79
replace agegrpNEU = 6 if alter >= 80 & alter <= 84
replace agegrpNEU = 7 if alter >= 85

replace agegrpNEU = 0 if studygroup == 1
label var agegrpNEU "Neue Altersgruppen"

label define agegrpNEU 0 "14" ///  // Kinder category
                         1 "35-39" ///
                         2 "40-44" ///
                         3 "65-69" ///
                         4 "70-74" ///
                         5 "75-79" ///
                         6 "80-84" ///
                         7 "85+"

label values agegrpNEU agegrpNEU
tab agegrpNEU


egen dt_index = rowmax(dt dt28)

gen dt_index_new = ""

replace dt_index_new = "dt_d" if dt_index > 0
replace dt_index_new = "dt_nd" if dt_index == 0

tab dt_index_new

gen ft_index = .

replace ft_index = ft if !missing(ft)
replace ft_index = ft28 if missing(ft_index) & !missing(ft28)

tab ft_index

gen ft_index_new = ""

replace ft_index_new = "ft_f" if ft_index > 0
replace ft_index_new = "ft_nf" if ft_index == 0

tab ft_index_new


gen pi_index = .

replace pi_index = cpifm if !missing(cpifm)
replace pi_index = cpipm100 if missing(pi_index) & !missing(cpipm100)

tab pi_index


recode pi_index (1/2 = 1)
tab pi_index

tab pi_index agegrpNEU
tab dt_index_new agegrpNEU


** 	Weighting
svyset [pw=gew]


** Statistical analyses


** Dental Caries Prevalence
svy: tab dmft_disease, per ci obs format(%9.1f)
svy: tab dmft_disease geschl, per col ci obs format(%9.1f)
svy: tab dmft_disease agegrpNEU, per col ci obs format(%9.1f)
svy: tab dmft_disease schulst, per col ci obs format(%9.1f)
svy: tab dmft_disease ostwest, per col ci obs format(%9.1f)
svy: tab dmft_disease bmikl, per col ci obs format(%9.1f)


** Decayed teeth
* total, women, men
svy: tab dt_index_new agegrpNEU, per col ci obs format(%9.1f)
svy: tab dt_index_new agegrpNEU if geschl==2, per col ci obs format(%9.1f)
svy: tab dt_index_new agegrpNEU if geschl==1, per col ci obs format(%9.1f)

**Filled teeth
svy: tab ft_index_new agegrpNEU, per col ci obs format(%9.1f)
svy: tab ft_index_new agegrpNEU if geschl==2, per col ci obs format(%9.1f)
svy: tab ft_index_new agegrpNEU if geschl==1, per col ci obs format(%9.1f)


svy, subpop(if ft_index > 0): mean ft_index, over(agegrpNEU geschl)
svy, subpop(if dt_index > 0): mean dt_index, over(agegrpNEU geschl)

**Periodontitis
* total, women, men
svy: tab pi_index agegrpNEU, per col ci obs format(%9.1f)
svy: tab pi_index agegrpNEU if geschl==2, per col ci obs format(%9.1f)
svy: tab pi_index agegrpNEU if geschl==1, per col ci obs format(%9.1f)


** Edentulism
* total, women, men
svy: tab zahnlos agegrpNEU, per col ci obs format(%9.1f)
svy: tab zahnlos agegrpNEU if geschl==2, per col ci obs format(%9.1f)
svy: tab zahnlos agegrpNEU if geschl==1, per col ci obs format(%9.1f)


** END



log close




