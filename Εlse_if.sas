Data emp ;					*creating a dataset it will be created by default in libary/work need to moved to folder under libraby as per your wish;
	input name$6. salary  hour;				 *input for creating field names for character $ and dot(.)required ;
	datalines;
	jalpa 20 40
	dipak 30 50
	James 30 40
	Kapil 30 40
	Frin 40 50
	Kirk 50 50
	Sames 40 20
	Haty 20 45
	Jetty 20 30
	Katty 30 40
	Fatu 25 60
	Molly 40 40
	Polly 50 60
	james 30 50;
Run;

libname empdet "/home/u61189332/"; *creating a lib folder;

data test2;
set empdet.emp;
total = salary*hour;								*If Elese;
if total>=2000 then category = "High";
else if total <2000 and total >=1000 then category ="Medium";
else category ="Low";
Run;