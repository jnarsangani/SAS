libname test "/home/u61189332/"; 
proc import datafile ="/home/u61189332/housing.csv"
	out=test.house
	dbms=csv replace;
Run;


proc sort data=test.house; *sort's data in ascending oder;
by population;
run;
*to take note changes are done on orignal dataset;
proc sort data=test.emp; *sort's data in ascending oder for 2 fields;
by salary hour;
run;

*here table sorted is created using out so no changes on orignal table;
proc sort data =test.emp2 out = sorted; 
by name salary; *here first by name sorting then in that names sort by salary;
run;

*sort by descending;
proc sort data =test.emp2 out = sorted; 
by descending name salary; *here first by name sorting then in that names Descending sort by salary;
run;

*Note nodupkey deletes by column duplication not by all the variables or fields that are excat dupulicate;
proc sort data =test.emp nodupkey out = nam; 
by  name ; 
run;


*Here duplicate recods exact all the values in each field or varaible are duplicated means rows are removed using nodup BUT in that are occuring consisuctively;
*means 1,2,3 is different and 4 is duplicate it will not remove 4th row;
proc sort data =test.emp nodup out = nam; 
by  name ; 
run;

*Here duplicate recods exact all the values in each field or varaible are duplicated means rows are removed using _all_ (Unique);
proc sort data =test.house nodup out = nam; 
by  _all_ ; *here _all_ means by all varaible for removing duplicate;
run;

*Here DUPLICAATE values are stored in different table using DUPOUT and dupl is table name where u want to store the duplicates;
proc sort data =test.house nodup out = nam dupout=dupl; 
by  _all_ ; *here _all_ means by all varaible for removing duplicate;
run;