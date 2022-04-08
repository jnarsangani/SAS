Data Stud ;					*creating a dataset it will be created by default in libary/work need to moved to folder under libraby as per your wish;
	input name$6. state$3. Age ;				 *input for creating field names for character $ and dot(.)required ;
	datalines;
	jalpa NY 10
	dipak DE 12
	abc   FL 13
	def   MA 15
	ghi	  GA 14
	jkl	  MA 14
	Hel	  NY 15
	Gel   DE 12
	Fet   FL 15
	Gol	  FL 14
	Mat   MA 12
	
Run;

Data Stud_details;					*creating a dataset it will be created by default in libary/work need to moved to folder under libraby as per your wish;
	input name$6. Height Weight ;				 *input for creating field names for character $ and dot(.)required ;
	datalines;
	jalpa 5.1 70
	dipak 5.2 71
	abc   5.5 80
	def   4.1 50
	ghi	  5.0 55
	jkl	  5.2 75
	Hel	  5.3 70
	Gel   4.9 80
	Fet   5.1 60
	Gol	  5.2 85
	Mat   4.6 50
	Sat   5.3 50
	
Run;
*Use of Left Join on Name column (column name can be different but data should be matching);
*Here all info of left table is printed and matching info of right table;
proc sql;
select   a.*
		,b.Height
		,b.Weight
	from Stud as a
	left join Stud_details as b
	on a.name= b.name;
Quit;

* Use of Right join;
*Here data on right side table is printed and matching data info;
proc sql;
select   a.*
		,b.Height
		,b.Weight
	from Stud as a
	Right join Stud_details as b
	on a.name= b.name;
Quit;

*Use of Inner Join;
*Here comman data (name) and its matching data is printed;

Proc sql;
select   a.*
		,b.Height
		,b.Weight
	from Stud as a
	inner join Stud_details as b
	on a.name= b.name;
Quit;

*Use of Full Join;
*It gives data from all the tables;
Proc sql;
select   a.*
		,b.Height
		,b.Weight
	from Stud as a
	Full join Stud_details as b
	on a.name= b.name;
Quit;

Data Stud_sub;					*creating a dataset it will be created by default in libary/work need to moved to folder under libraby as per your wish;
	input subject$10.;				 *input for creating field names for character $ and dot(.)required ;
	datalines;
	Maths
	Science
Run;


*CROSS JOIN;
*It will create here first table will combination of all the records;
*here no ON;
Proc sql;
select   a.*
		,b.subject
		
	from Stud as a
	cross join Stud_sub as b;
Quit;

*if you want to STORE THE output in TABLE in proc you can use CREATE TABLE;
proc sql;
create table combined as
select   a.*
		,b.subject
		
	from Stud as a
	cross join Stud_sub as b;
Quit;

proc print data=combined;

*IF u want to make permenant data use mylib;

proc print data=mylib.combined;run;

