proc sql; *starts;
*you can do the following
*select;
*from;
*where;
*groupby;
*having;
*oderby;


Quit; *ends instead of run;

Data details ;					*creating a dataset it will be created by default in libary/work need to moved to folder under libraby as per your wish;
	input name$6. state$3. salary ;				 *input for creating field names for character $ and dot(.)required ;
	datalines;
	jalpa NY 1000
	dipak DE 2000
	abc   FL 3500
	def   MA 5000
	ghi	  GA 1900
	jkl	  MA 2000
	Hel	  NY 1500
	Gel   DE 1200
	Fet   FL 2000
	Gol	  FL 3000
	Mat   MA 2500
	
Run;

proc sql; *use of select coulums;
select name, state 
from work.details;
Quit;

*use of WHERE;
proc sql; *use of all coulums; *if u put semi-colum end of from  statement it will end there and give all data;
select name,salary 
from work.details 
where salary > 2000;
Quit;

*Use of group by group by state (count for each state)(total sal for each stater;
proc sql; 
select state
	   ,count(state) as st
	   ,sum(salary) as tot_sal
from work.details 
group by state;
Quit;

*Use of group by group and where condition;
proc sql; 
select state
	   ,count(state) as st
	   ,sum(salary) as tot_sal
from work.details 
where salary > 1500
group by state;
Quit;


*Use of HAVING it works not on source data here after the grouping done;
proc sql; 
select state
	   ,count(state) as st
	   ,sum(salary) as tot_sal
from work.details 
group by state
having st >1 ;
Quit;

*Use of ODER BY after the grouping done;
proc sql; 
select state
	   ,count(state) as st
	   ,sum(salary) as tot_sal
from work.details 
group by state
having st >1 
oder by salary desc;
Quit;