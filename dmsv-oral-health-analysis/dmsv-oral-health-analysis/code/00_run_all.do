*==============================================================================
* 00_run_all.do
*
* Purpose : Run the full analysis pipeline from raw data to results, in order.
*           Run this file from within the code/ folder (or set your working
*           directory to code/ first).
*==============================================================================

do "01_import_merge.do"
do "02_clean_variables.do"
do "03_create_variables.do"
do "04_weighting.do"
do "05_dental_caries.do"
do "06_periodontitis.do"
do "07_figures.do"
do "08_tables.do"
