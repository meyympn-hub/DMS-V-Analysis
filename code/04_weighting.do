*==============================================================================
* 04_weighting.do
*
* Purpose : Add the survey design (sampling weights) so that subsequent
*           `svy:` commands produce weighted, nationally representative
*           estimates.
*
* Input   : data/DMS-V_m.dta
*==============================================================================

use "../data/DMS-V_m.dta", clear

svyset [pw=gew]
