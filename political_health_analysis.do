***** Political inequalities and health inequalities

import excel "/Users/reevesa/Dropbox/Political determinants of health/Data/health inequalities and turnout.xlsx", sheet("Sheet1") firstrow

import excel "C:/Users/areeves/Dropbox/Political determinants of health/Data/health inequalities and turnout.xlsx", sheet("Sheet1") firstrow


gen pop1000 = pop/1000
gen gdp100 = gdp/100



** Figure 1 and 2
scatter smr_rel_ineq_male_ed voted_ed_diff, mlabel(country) 
pwcorr smr_rel_ineq_male_ed voted_ed_diff , sig
scatter smr_rel_ineq_female_ed voted_ed_diff, mlabel(country) 
pwcorr smr_rel_ineq_female_ed voted_ed_diff, sig



** Table 1
*** SMR - Male
eststo clear
eststo: reg smr_rel_ineq_male_ed voted_ed_diff [pw=pop1000]
eststo: reg smr_rel_ineq_male_ed voted_ed_diff gdp100 [pw=pop1000]
eststo: reg smr_rel_ineq_male_ed voted_ed_diff gini [pw=pop1000]
eststo: reg smr_rel_ineq_male_ed voted_ed_diff soc_proc [pw=pop1000]
eststo: reg smr_rel_ineq_male_ed voted_ed_diff post_comm [pw=pop1000]
eststo: reg smr_rel_ineq_male_ed voted_ed_diff health_exp_GDPpc [pw=pop1000]
eststo: reg smr_rel_ineq_male_ed voted_ed_diff pov_lineq_ed [pw=pop1000]
eststo: reg smr_rel_ineq_male_ed voted_ed_diff smoke_diff_m [pw=pop1000]
eststo: reg smr_rel_ineq_male_ed voted_ed_diff gdp100 gini  soc_proc post_comm health_exp_GDPpc pov_lineq_ed smoke_diff_m [pw=pop1000]
esttab
esttab using "/users/reevesa/Dropbox/Political determinants of health/Tables/Table1.rtf", se(a2) r2(a2) l nodep replace ///
	b(a2) star(* 0.05 ** 0.01) onecell
esttab using "/users/reevesa/Dropbox/Political determinants of health/Final/Table1.tex", se(a2) r2(a2) l nodep replace ///
	b(a2) star(* 0.05 ** 0.01) 	
eststo clear 


** Table 2
*** SMR - Female
eststo clear
eststo: reg smr_rel_ineq_female_ed voted_ed_diff [pw=pop1000]
eststo: reg smr_rel_ineq_female_ed voted_ed_diff gdp100 [pw=pop1000]
eststo: reg smr_rel_ineq_female_ed voted_ed_diff gini [pw=pop1000]
eststo: reg smr_rel_ineq_female_ed voted_ed_diff soc_proc [pw=pop1000]
eststo: reg smr_rel_ineq_female_ed voted_ed_diff post_comm [pw=pop1000]
eststo: reg smr_rel_ineq_female_ed voted_ed_diff health_exp_GDPpc [pw=pop1000]
eststo: reg smr_rel_ineq_female_ed voted_ed_diff pov_lineq_ed [pw=pop1000]
eststo: reg smr_rel_ineq_female_ed voted_ed_diff smoke_diff_f [pw=pop1000]
eststo: reg smr_rel_ineq_female_ed voted_ed_diff gdp100 gini  soc_proc post_comm health_exp_GDPpc pov_lineq_ed smoke_diff_f [pw=pop1000]
esttab
esttab using "/users/reevesa/Dropbox/Political determinants of health/Tables/Table2.rtf", se(a2) r2(a2) l nodep replace ///
	b(a2) star(* 0.05 ** 0.01) onecell
esttab using "/users/reevesa/Dropbox/Political determinants of health/Final/Table2.tex", se(a2) r2(a2) l nodep replace ///
	b(a2) star(* 0.05 ** 0.01) 	
eststo clear 



** Table 3
*** Cause specific mortality - Male
eststo clear
eststo: reg smk_rel_ineq_male_ed voted_ed_diff gdp100 gini soc_proc post_comm health_exp_GDPpc  pov_lineq_ed smoke_diff_m [pw=pop1000]
eststo: reg can_rel_ineq_male_ed voted_ed_diff gdp100 gini  soc_proc post_comm health_exp_GDPpc  pov_lineq_ed smoke_diff_m [pw=pop1000]
eststo: reg cvd_rel_ineq_male_ed voted_ed_diff gdp100 gini soc_proc post_comm health_exp_GDPpc  pov_lineq_ed smoke_diff_m [pw=pop1000]
eststo: reg oth_rel_ineq_male_ed voted_ed_diff gdp100 gini soc_proc post_comm health_exp_GDPpc  pov_lineq_ed smoke_diff_m [pw=pop1000]
eststo: reg amen_rel_ineq_male_ed voted_ed_diff gdp100 gini soc_proc post_comm health_exp_GDPpc  pov_lineq_ed smoke_diff_m [pw=pop1000]
esttab
esttab using "/users/reevesa/Dropbox/Political determinants of health/Tables/Table3.rtf", se(a2) r2(a2) l nodep replace ///
	b(a2) star(* 0.05 ** 0.01) onecell
eststo clear 


** Table 4
*** Cause specific mortality - Female
eststo clear
eststo: reg smk_rel_ineq_female_ed voted_ed_diff gdp100 gini soc_proc post_comm health_exp_GDPpc  pov_lineq_ed smoke_diff_f [pw=pop1000]
eststo: reg can_rel_ineq_female_ed voted_ed_diff gdp100 gini soc_proc post_comm health_exp_GDPpc  pov_lineq_ed smoke_diff_f [pw=pop1000]
eststo: reg cvd_rel_ineq_female_ed voted_ed_diff gdp100 gini soc_proc post_comm health_exp_GDPpc  pov_lineq_ed smoke_diff_f [pw=pop1000]
eststo: reg oth_rel_ineq_female_ed voted_ed_diff gdp100 gini soc_proc post_comm health_exp_GDPpc  pov_lineq_ed smoke_diff_f [pw=pop1000]
eststo: reg amen_rel_ineq_female_ed voted_ed_diff gdp100 gini soc_proc post_comm health_exp_GDPpc  pov_lineq_ed smoke_diff_f [pw=pop1000]
esttab
esttab using "/users/reevesa/Dropbox/Political determinants of health/Tables/Table4.rtf", se(a2) r2(a2) l nodep replace ///
	b(a2) star(* 0.05 ** 0.01) onecell
eststo clear 


// perhaps update the amenable to external and drop the smoking-related. 

** Sensitivity analysis
foreach num of numlist 1 2 3 4 5 6 7 8 9 11 13 15 16 18 19 20 21 {
	qui reg smr_rel_ineq_male_ed voted_ed_diff if idn!=`num' 
	eststo M`num'
	}

qui reg smr_rel_ineq_male_ed voted_ed_diff 
eststo M0
	
coefplot M0 || M1 || M2 || M3 || M4 || M5 || M6 || M7 || M8 || M9 || M11 || ///
	M13 || M15 || M16 || M18 || M19 || M20 || M21, vertical drop(_cons) bycoefs ///
	xlabel(1 "All countries included" 2 "Austria" 3 "Belgium" 4 "Czech Republic" 5 "Denmark" 6 "England/Wales"  7 "Estonia"  ///
	8 "Finland"  9 "France" 10 "Hungary" 11 "Italy"  12 "Lithuania" 13 "Norway" 14 "Poland"  ///
	15 "Slovenia" 16 "Spain" 17 "Sweden" 18 "Switzerland" , angle(60)) ///
	ytitle("Association between inequalities in political" "participation and male health inequalities") ///
	group(1 2 3 4 5 6 7 8 9 10 11 12 13 14 ///
	15 16 17 18 = "{bf:Which country has been dropped from the regression model}") ylabel(0(0.05)0.3)
	
	
foreach num of numlist 1 2 3 4 5 6 7 8 9 11 13 15 16 18 19 20 21 {
	qui reg smr_rel_ineq_female_ed voted_ed_diff if idn!=`num' 
	eststo M`num'
	}

qui reg smr_rel_ineq_female_ed voted_ed_diff 
eststo M0
	
coefplot M0 || M1 || M2 || M3 || M4 || M5 || M6 || M7 || M8 || M9 || M11 || ///
	M13 || M15 || M16 || M18 || M19 || M20 || M21, vertical drop(_cons) bycoefs ///
	xlabel(1 "All countries included" 2 "Austria" 3 "Belgium" 4 "Czech Republic" 5 "Denmark" 6 "England/Wales"  7 "Estonia"  ///
	8 "Finland"  9 "France" 10 "Hungary" 11 "Italy"  12 "Lithuania" 13 "Norway" 14 "Poland"  ///
	15 "Slovenia" 16 "Spain" 17 "Sweden" 18 "Switzerland" , angle(60)) ///
	ytitle("Association between inequalities in political" "participation and female health inequalities") ///
	group(1 2 3 4 5 6 7 8 9 10 11 12 13 14 ///
	15 16 17 18 = "{bf:Which country has been dropped from the regression model}") ylabel(0(0.05)0.3)
	

** mrobust

mrobust reg smr_rel_ineq_male_ed voted_ed_diff gdp100 gini soc_proc post_comm health_exp_GDPpc  pov_lineq_ed  smoke_diff_m 
mrobust reg smr_rel_ineq_female_ed voted_ed_diff gdp100 gini  soc_proc post_comm health_exp_GDPpc pov_lineq_ed smoke_diff_f

	
