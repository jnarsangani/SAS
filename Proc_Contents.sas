* how many observation table has?;
*how many variables(columns) table has?;
*what are the variable names the table has ?;
*type of variable ?;

proc contents data=test.emp;
run;

* gives u all info when created , modifed, varaible name, type etc;

proc contents data=test.emp varnum; * this give field names and it details in sequence as in table not soarted;
run;