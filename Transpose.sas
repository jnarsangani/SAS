*Transpose means rows(observations) to colums(variable), columns to rows;
*in excel u can achive by copying the table and while pasting checking the Transpose box;
*its good practice to sort data before using transpose;
*also data should be unique;


proc transpose data = work.test2 out = trans; * here data is input and out is table which u want as u dont want orignal to be updated;
by salary; * which you dont want to change a column ;
id hour; *which column u want to change to row observation;
var total; * field which u want to shows as values of rows and columns;
run;

proc transpose data = work.test2 out = trans (drop =_:); * here using drop will drop other columns u dont want to see _: ;
by salary;
id hour; 
var total; 
run;

*using prefix name for colunms prefix= what u want to add;
proc transpose data = work.test2 prefix=trans_ out = trans2 (drop =_:); * here using drop will drop other columns u dont want to see _: ;
by salary;
id hour; 
var total; 
run;

*using prefix name for colunms sufix= what u want to add;
proc transpose data = work.test2 prefix=trans_ suffix = _final out = trans2 (drop =_:); * here using drop will drop other columns u dont want to see _: ;
by salary;
id hour; 
var total; 
run;

*Just sorting the data;

proc sort data = work.test2;
by name;
run;


* here combinig two columns ;
proc transpose data = work.test2 out = trans; * here data is input and out is table which u want as u dont want orignal to be updated;
by name; * which you dont want to change a column ;
id hour salary; *which column u want to change to row observation;
var total; * field which u want to shows as values of rows and columns;
run;