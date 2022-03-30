*frequency proc helps to find how many time it accoured the results gives frequency,percentage,cummulivate frequency,cummulivate %;
*in Excel it can be achived by pviot table ;
proc freq data= test.house;
tables ocean_proximity; *here it will show different values in ocean_proxmity and frequency of occurance;
run;

proc freq data= test.house;
tables ocean_proximity/nopercent nocum; *here it will show only frequency and will remove percentage and cummulative percentage;
run;

*here 2 diminesion frequency means in salary hours;
proc freq data= test.emp;
tables salary * hour; *here it will show different values in ocean_proxmity and frequency of occurance;
run;


*here 2 diminesion frequency removes unneccesary info of percentage;
proc freq data= test.emp;
tables salary * hour/ nopercent norow nocol; *here it will show different values in ocean_proxmity and frequency of occurance;
run;

*Just created a extra field for below fequency where condition to execute;
data test2;
set test.emp;
total = salary*hour;
run;

* here frequency with condition;
proc freq data = work.test2;
tables salary*hour/nopercent norow nocol;
where total >= 1000;
Run;