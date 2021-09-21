filename dataloc 'games.csv' encoding="utf-8";

proc import datafile = dataloc out=games
  DBMS = csv; /* comma delimited file */
  GETNAMES = YES
  ;
proc print data=games (obs=10); /* print the first 10 observations */
  run;

/*Change the type of avg into numeric data for ranking*/
data games;
	set games(rename=(avg=c_avg));
	avg = input(c_avg,best8.);
	dropc_:;
run;


/*Select all the data of March 2020 and save then in a dataset called Mar_2020 */
proc sql;
create table Mar_2020 as
	select * from games
		where month='March'& year='2020';
quit;

/*Sorting the data and print the top 10*/
proc sort data=Mar_2020 out=sorted;
	by descending avg;
	run;
proc print data=sorted(obs=10);
 var gamename avg year month; 
 title 'top 10 by avg';
run;
