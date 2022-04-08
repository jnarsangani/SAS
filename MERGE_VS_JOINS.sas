*MERGE table VS JOIN;

*MERGE;
*1) Should have 2 tables;
*2)One Common column EVEN THE NAME OF COLUMN SHOULD BE SAME with some observations(rows);
*3)All DATA MUST BE SOARTED on Key/COMMAN VARIABLE;


*sytnax for left merge
data stud_details
merge work.temp (in=a)
	  work.temp2 (in =b)
by name;
*if a; *here a if left join (if b )if right join for inner (if a and b) for full (a or b);
	  

*JOIN;
*1) Should have 2 tables;
*2)One Common column THE COLUMN NAME CAN BE DIFFERENT with some observations(rows);
*3)SOARTING IS NOT NECESSARY;

*syntax for left join
proc sql
select   a.*
		,b.Height
		,b.Weight
	from Stud as a
	left join Stud_details as b *here right(keyword) when right join and inner (keyword) join for both and FULL for all data
	on a.name= b.name; 
*Quit;