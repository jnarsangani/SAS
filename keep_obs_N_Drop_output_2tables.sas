libname test "/home/u61189332/"; 
proc import datafile ="/home/u61189332/housing.csv"
	out=test.house
	dbms=csv replace;
Run;

data Keep;				* Keep to keep variables(columns);
set Test.house(Keep= total_rooms total_bedrooms population households );
run;

data Test1;				* Drop to Drop variables(columns);
set Test.house(DROP= total_rooms total_bedrooms population households );
run;

* table1 and table 2 created from house data and conditons if household is <200 will show table1 else table 2;
data table1(Keep= total_rooms total_bedrooms population households) table2(DROP= total_rooms total_bedrooms population households );
set test.house;

if households<200 then output table1;
else output table2;
run;

*_N_ by default a number is assigned to rows so when u wants rows ranging from that no u can use _N_;
data lineno;
set test.house;
if _N_ >=10 and _N_<=20;
run;

*OBS it takes the first 10 obs (rows);
data table1;
set work.table1(OBS =10);
run;

*obs total observations and 2 in firstobs is starting point number from where to start;
data test3;
set test.house(OBS =10 firstobs=2);*here first obs is starting point so it will start from 2 (the number given by default to rows);
run;