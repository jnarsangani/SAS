libname test "/home/u6-----/";  
proc import datafile ="/home/u6-----/housing.csv"
	out=test.house
	dbms=csv replace;
Run;

Data emp ;					*creating a dataset it will be created by default in libary/work need to moved to folder under libraby as per your wish;
	input name$6. salary  hour;				 *input for creating field names for character $ and dot(.)required ;
	datalines;
	jalpa 20 40
	dipak 30 50
	abc 30 40
	def 30 40
	ghi	40 50
	jkl	50	50
	james 30 50;
	
Run;
	
libname epde "/home/u61189332/"; 			*creating libname means creating folder under libray (named epde) and dragged and drop file from work;

data test;									* Creating tempory dataset;
set epde.emp;
run;



data test;									*performing tempory operation on fields ;
set epde.emp;
total = salary *3;
run;

data test;									*REMOVING column  using DROP ;
set epde.emp;
drop total;
Run;

data test;									*Permfoming numeric operation on two fields and creating a NEW COLUMN name total;
set epde.emp;
total = salary*hour;
run;

data test;									*RENAMING FIELD;
set epde.emp;
rename hour = Per_Hour;
run;

data test;									*Where Conditon;
set epde.emp;
where hour > 40;
Run;

data test;									*Where with OR can use AND too;
set epde.emp;
where hour > 40 or salary >=20;






