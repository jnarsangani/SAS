Data emp1 ;					*creating a dataset it will be created by default in libary/work need to moved to folder under libraby as per your wish;
	input name$6. salary  weekly;				 *input for creating field names for character $ and dot(.)required ;
	datalines;
	jalpa 20 40
	dipak 30 50
	abc   30 40
	def   30 40
	ghi	  40 50
	jkl	  50 50;
Run;

Data details ;					*creating a dataset it will be created by default in libary/work need to moved to folder under libraby as per your wish;
	input name$6. state$3. ;				 *input for creating field names for character $ and dot(.)required ;
	datalines;
	jalpa NY
	dipak DE
	abc   FL
	def   MA
	ghi	  GA
	jkl	  MA;
Run;

Data detailsunsor ;					*creating a dataset it will be created by default in libary/work need to moved to folder under libraby as per your wish;
	input name$6. state$3. ;				 *input for creating field names for character $ and dot(.)required ;
	datalines;
	fat   NY
	cat   DE
	jalpa FL
	dipak MA
	ghi	  GA
	jkl	  MA;
Run;

*combine the table;
*here it will combine provided both have common column and data in same sequence;
*and it should have data in same sequence;
*if data is in different sequence it will replace with second table data;
data combined;
set emp1;
set details;
run;

data combined; *here data is replace with detail sunsor table if u observe;
set emp1;
set detailsunsor;
run;

*Here it will combine 2 tables one under another;
data combined2; * set is metioned only once and no sem-column after first data set;
set emp1
	details;
run;

proc print data=combined; *to print the output;

*merge the data in 2 tables with common data colum;
*it should first be sorted;

proc sort data=emp1;by name; run;
proc sort data=details; by name;run;
data mer;
merge work.emp1
	  work.details;
by name;
run;


proc sort data=emp1;by name; run;
proc sort data=detailsunsor; by name;run;
data mer;
merge work.emp1
	  work.detailsunsor;
by name;
run;

*here merge but displaying data only of left side (left merge) first table;
proc sort data=emp1;by name; run;
proc sort data=detailsunsor; by name;run;
data mer;
merge work.emp1(in=a)
	  work.detailsunsor(in=b); *(in = a or b is the alias name give to table);
by name;
if a;
run;


*here merging the table right merge;
data mer;
merge work.emp1(in=a)
	  work.detailsunsor(in=b); *(in = a or b is the alias name give to table);
by name;
if b;
run;


*here merging the table COMMON IN BOTH ;
data mer;
merge work.emp1(in=a)
	  work.detailsunsor(in=b); *(in = a or b is the alias name give to table);
by name;
if a and b;
run;

*here merging the table have data  IN BOTH using OR;
data mer;
merge work.emp1(in=a)
	  work.detailsunsor(in=b); *(in = a or b is the alias name give to table);
by name;
if a or b;
run;



*Appending the data meand adding the table from other table;
*here the data is appended in base table;
*every time you run the data from second table is added to the base table;

proc append base=work.emp1 data = details; run;* this wont work becoz the column names are not common in each table different column names;
*becoz emp has (name,salary) details has (name,state) state is different so wont work here ;

*adding FORCE will make the updates;
proc append base=work.emp1 data = details force; run;
proc print data = work.emp1;


proc append base=work.details data = detailsunsor; run;
proc print data = work.details; *here work.details is base so all data will be added to it;



* COMBINE ALL TABLES STARTING WITH SPEICFIC NAME IN LIBRARIES;

DATA COMBINED_ALL;
SET WORK.EMP:; *Here : is use and will comine all tables starting with emp ;
RUN;
