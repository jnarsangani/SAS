*concatenating || ;
data test;
first_name = "Jalpa";
middle_name= "first";
Last_name ="abc";
result = first_name || middle_name||Last_name;
withspace = first_name ||""|| middle_name||""||Last_name;
run;

data test;
first_name = "Jalpa";
middle_name= "first";
Last_name ="abc";
result = cat(first_name,middle_name,Last_name); *cat function can also be used;
result2 =catx(' ',first_name,middle_name,Last_name); *catx function if want u want space or character between;
run;

data test;
first_name = "Jalpa    ";
middle_name= "  first";
Last_name =".   abc  ";
result = cats(first_name,middle_name,Last_name); *used concate and remove leading and trailing blanks ;
result2 =catt(first_name,middle_name,Last_name); 

*SCAN;
*TEXT to Columns in excel we go to data (text to colum and seprated by deliminate);
*eg jalpa_first_abc (will seprate into 3 column and deliminate is _ here;

data test1;
first_name ='happy_birthday_for' ;
first =scan(first_name,1,'_');
second = scan(first_name,2,'_');
thrid = scan(first_name,3,'_');
run;

data test1;
first_name ='happy_birthday_for' ;
first =scan(first_name,-1,'_'); * -1 means the last word;
second = scan(first_name,-2,'_'); *-2 means second last word;
thrid = scan(first_name,-3,'_'); *-3 means thrid last word;
run;



