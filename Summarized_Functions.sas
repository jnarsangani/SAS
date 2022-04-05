Data details ;					*creating a dataset it will be created by default in libary/work need to moved to folder under libraby as per your wish;
	input name$6. state$3. salary city$9.;				 *input for creating field names for character $ and dot(.)required ;
	datalines;
	jalpa NY 1000 Newark
	dipak DE 2000 Newark
	abc   FL 3500 Jackson
	def   MA 5000 Downtown
	ghi	  GA 1900 Atlanta
	jkl	  MA 2000 Downtown
	Hel	  NY 1500 New york
	Gel   DE 1200 Dover
	Fet   FL 2000 Jackson
	Gol	  FL 3000 Miami
	Mat   MA 2500 Newark
	
Run;
* FREQ, COUNT, N, all are are same group by need to be used for summarized functions;
*ALL are grouped by state;
*Min, Maxto find minmum and maximum;
*MEAN and AVERAGE are same;

*range is the difference between min and max values;
*std (statical ) think so standard deviation;

proc sql;
select state
	,count(*) as cou_state
	,freq(state) as freq_state
	,n(state)as number_state
	,max(salary) as max_salary
	,min(salary) as min_salary
	,avg(salary) as avg_salary
	,mean(salary) as mean_salary
	,range(salary) as range_salary
	,std(salary) as std_salary
	,sum (salary) as sum_salary
	from work.details
	group by state; *here u can even metion 1 instead of state group by 1 ;
quit;

*if you are selecting 2 category suppose state,city;

proc sql;
select state,city
	,count(*) as cou_state
	,freq(state) as freq_state
	,n(state)as number_state
	,max(salary) as max_salary
	,min(salary) as min_salary
	,avg(salary) as avg_salary
	,mean(salary) as mean_salary
	,range(salary) as range_salary
	,std(salary) as std_salary
	,sum (salary) as sum_salary
	from work.details
	group by 1,2; *here u can even metion 1 instead of state group by 1 and 2 ;
quit; * if u see observation in DE it will show both cities;