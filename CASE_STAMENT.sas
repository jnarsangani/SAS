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
*Use of CASE Statment only if else;
proc sql;
select *
, case when salary <=1000 then 'low'
	else 'High'
	end as category
	from work.details;
quit;

*Use of CASE Statment more then one condition;
proc sql;
select *
, case when salary <=1000 then 'low'
	   when salary >= 1100 and salary <= 2000 then 'medium'
	   else 'High'
	end as category
	from work.details;
quit;

*Use of 2 CASE STAMEMT;
proc sql;
select *
, case when salary <=1000 then 'low'
	   when salary >= 1100 and salary <= 2000 then 'medium'
	   else 'High'
	end as category
	,case when salary <=1500 OR state = 'NY' or state = 'DE' then 'Tax Deducted'
	 else 'Tax included'
	 end as category2
	from work.details;
quit;