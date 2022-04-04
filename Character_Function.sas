
*character function;
*compress;
*compbl;
*Trim removes all TRAILING blank space;
*TRIMN removes all TRAILING blank space and gives length;
*STRIP removes all TRAILING & LEADING blank space


data sample;
Name = "Happy.  Birthday   To";
len= length(Name);
comp = compress(Name); * removes all the blanks;
len1 = length(comp);
combl = compbl(name); * revoes all blanks but keeps one;
len2 = length(comb1);
Run;


data sample;
value = "4jddjdjdj!%"; *removes the unwanted characters;
new_value = compress(value,'!%');
run;


 

data sample;
value = "AB4jabddjdjdj!%"; 
new_value = compress(value,'','d'); *removes 'd' means it ignores all numbers(digits) a also;
run;


data test;
set test.emp;
new_v = compress(name);
run;


* compress(source, character, modifier);
*in modifer the below value justies the below;
*i = removes upper and lower case;
*k = keeps the specified character instead of removing;
*l= removes the lowercase character from string;
*u= removes the uppercase character from string;
*p = removes punctuations from string;
*s = removes space from string;
*d = removes the digits from string;
*kd = keeps the digit in string;
*ak = keeps only the character in string;

data sample;
value = "AB4jabddjdjdj!%"; 
new_value = compress(value,'','ak'); *removes 'd' means it ignores all numbers(digits) a also;
run;