%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Dati Italia, Lombardia, Veneto. Emilia Romagna, Piemonte, Marche
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
lastday = datenum(2020,03,11);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
t0 = datenum(2020,02,24);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 1Positivi, 2Ricoverati, 3Intensiva, 4Morti, 5Casitotali, 6guariti
Italia=[
  322  114   35	 10 322+10+1     1
  374  128   36	 12 400+12+3     3
  650  248   56	 17 650+0+45    45
  821  345   64	 21 821+21+46   46
 1049  401  105	 29 1049+29+50  50 
 1577  639  140	 34 1694        83
 1835  742  166	 52 2036       149
 2263 1034  229	 79 2502       160
 2706 1346  295 107 3089       276
 3296 1790  351 148 3858       414
 3916 2394  462 197 4636       523
 5061 2651  567 233 5833       589
 6387 3557  650 366 7375       622
 7985 4316  733 463 9172       724
 8514 5038  877 631 10149     1004
10590 5838 1028 827 12462     1045];
% Positivi, Ricoverati, Intensiva, Morti, Casi totali, guariti

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
t0=datenum(2020,03,01);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 1Ricoverati con sintomi	2Terapia intensiva	3Isolamento domiciliare	4Totale attualmente positivi	5DIMESSIGUARITI	6DECEDUTI	7CASI TOTALI	8TAMPONI
Lomb=[
 478 127  472 1077	139  38 1254  7925
 698 167  461 1326  139	 55	1520  9577
877  209  411 1497  250  73 1820 12138
1169 244  364 1777  376  98 2251 12354
1622 309   77 2008  469 135 2612 13556
1661 359  722 2742  524 154 3420 15778
2217 399  756 3372  550 267 4189 18534
2802 440 1248 4490  646 333 5469 20135
3319 466  642 4427  896 468 5791 21479
3852 562 1351 5763  900 617 7280 25629];
% 1Ricoverati con sintomi	2Terapia intensiva	3Isolamento domiciliare	4Totale attualmente positivi	5DIMESSIGUARITI	6DECEDUTI	7CASI TOTALI	8TAMPONI

ERomagna=[
148	 16	160	 324  0  11  335 
187	 24	187	 398  4	 18	 420
256	 26	234	 516  6	 22	 544
327	 32	299	 658 10	 30	 698
397	 53	366	 816 17	 37	 870
464  64 409  937 25  48 1010
542  75 480 1097 27  56 1180
576  90 620 1286 30  70 1386
669  98 650 1417 31  85 1533
745 104 739 1588 38 113 1739];
% 1Ricoverati con sintomi	2Terapia intensiva	3Isolamento domiciliare	4Totale attualmente positivi	5DIMESSIGUARITI	6DECEDUTI	7CASI TOTALI	8TAMPONI

Veneto=[
 53	14 204 271	0  2  273  9782
 49	19 229 297	7  3  307 10176
 76	23 246 345  9  6  360 10515
 92	24 264 380 17 10  407 11949
117	27 310 454 22 12  488 13023
123 41 341 505 25 13  543 14429
146 47 430 623 29 18  670 15918
186 51 457 694 30 20  744 15956
204 67 512 783 47 26  856 16643
262 68 610 940 54 29 1023 21400];
% 1Ricoverati con sintomi	2Terapia intensiva	3Isolamento domiciliare	4Totale attualmente positivi	5DIMESSIGUARITI	6DECEDUTI	7CASI TOTALI	8TAMPONI

Marche=[
 17	 6  11  34 0  1  35  137
 27	13  19  59 0  2  61  200
 34	15  31  80 0  4  84  288
 57	19  44 120 0  4 124  413
 73	20  62 155 0  4 159  585
 94 36  71 201 0  6 207  816
110 41 114 265 0  7 272 1025
136 47 130 313 0 10 323 1250
152 54 175 381 0 13 394 1437
212 66 183 461 0 18 479 1656];
% 1Ricoverati con sintomi	2Terapia intensiva	3Isolamento domiciliare	4Totale attualmente positivi	5DIMESSIGUARITI	6DECEDUTI	7CASI TOTALI	8TAMPONI

Piemont=[
 12	 2 37  51 0	 0.9  51
 13  3 40  56 0	 0.9  56
 26	13 43  82 0	 0.9  82
 43	17 46 106 0	 2	 108
 57	30 52 139 0	 4	 143
110 38 54 202 0  5   207
222 50 65 337 0 11   348
238 61 68 367 0 13   380
306 66 64 436 0 17   453
319 75 86 480 0 21   501];
% 1Ricoverati con sintomi	2Terapia intensiva	3Isolamento domiciliare	4Totale attualmente positivi	5DIMESSIGUARITI	6DECEDUTI	7CASI TOTALI	8TAMPONI

