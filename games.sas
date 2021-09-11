filename dataloc 'games.csv' encoding="utf-8";

proc import datafile = dataloc out=games
  DBMS = csv; /* comma delimited file */
  GETNAMES = YES
  ;
proc print data=games (obs=10); /* print the first 10 observations */
  run;
