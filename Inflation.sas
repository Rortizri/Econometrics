/*IMPORTATION DE BASE DE DONNÉES*/

libname INFLATION 'C:\Users\ORTIZ\Desktop\Panel_Data';
proc import datafile='C:\Users\ORTIZ\Desktop\Panel_Data\data.xlsx' 
out=DATAP dbms=xlsx; 
run; 
proc print; run; 
ods excel file="C:\Users\ORTIZ\Desktop\archivador.xlsx"; 
proc print data=DATAP; 
run;
/*STATISTIQUES DESCRIPTIVES BOLIVIA*/
proc means data=DATAB;
VAR Emission	Reserve_Legale	Inflation	Balance_Commerciale	Taux_Change;
run;

/*CORRELATIONS BOLIVIA*/

proc corr data=DATAB;
VAR Emission	Reserve_Legale	Inflation	Balance_Commerciale	Taux_Change;
run;
/*STATISTIQUES DESCRIPTIVES ARGENTINA*/
proc means data=DATAA;
VAR Emission	Reserve_Legale	Inflation	Balance_Commerciale	Taux_Change;
run;

/*CORRELATIONS ARGENTINA*/

proc corr data=DATAA;
VAR Emission	Reserve_Legale	Inflation	Balance_Commerciale	Taux_Change;
run;
/*ESTIMATEUR MCO BOLIVIA*/
proc reg data=DATAB;
model Inflation= Emission	Reserve_Legale Balance_Commerciale	Taux_Change;
run;


/*ESTIMATEUR MCO ARGENTINA*/

proc reg data=DATAA;
model Inflation= Emission	Reserve_Legale Balance_Commerciale	Taux_Change;
run;




/*TRI BASE DE DONNEES PAR PAYS ET ANNEES*/

proc sort data=DATAP;
by Pays Date;
run;

/*ESTIMATEUR POOLED=MCO*/

proc panel data=DATAP;
id Pays Date;
model Inflation= Emission Inflation1	Reserve_Legale Balance_Commerciale	Taux_Change/POOLED;
run;

/*ESTIMATEUR BETWEEN*/

proc panel data=DATAP;
id Pays Date;
model 
Inflation= Emission	Inflation1 Reserve_Legale Balance_Commerciale	Taux_Change/BTWNG;
run;


/*CHOIX DU MODELE: EFFETS FIXES OU EFFETS ALEATOIRES?*/ 
/*FIXED EFFECTS*/

proc panel data=DATAP;
id Pays Date;
model Inflation= Emission Inflation1 Reserve_Legale Balance_Commerciale	Taux_Change/FIXEONE;
run; 

/*RANDOM EFFECTS*/

proc panel data=DATAP;
id Pays Date;
model Inflation= Emission	Inflation1 Reserve_Legale Balance_Commerciale	Taux_Change/RANONE;
run;

/*TEST D'HETEROSCEDASTICITE*/

proc reg data= DATAP;
model Inflation= Emission	Inflation1 Reserve_Legale Balance_Commerciale	Taux_Change/SPEC;
run;

/*TEST DE NORMALITE DES RESIDUS*/

proc reg data=DATAP;
model Inflation= Emission	Inflation1 Reserve_Legale Balance_Commerciale	Taux_Change;
output out=resid1 residual=uhat;
run;

PROC AUTOREG data=DATAP;
model Inflation= Emission	Inflation1 Reserve_Legale Balance_Commerciale	Taux_Change/ NORMAL;
RUN;

/*TEST D'AUTOCORRELATION*/

proc model data=DATAP;
Inflation= bo + b1*Emission	+ b2*Inflation1  + b3*Reserve_Legale + b4*Balance_Commerciale + b*5Taux_Change;
fit Inflation / godfrey=2;
run;

/*TEST GODFREY BREUSCH AUTOCORRELATION*/

proc model data= DATAP;
parms b0 b1 b2 b3 b4 b5 b6;
Inflation = b0 + bo + b1*Emission	+ b2*Inflation1  + b3*Reserve_Legale + b4*Balance_Commerciale + b*5Taux_Change;
fit  Inflation/pagan=(1 Emission	Reserve_Legale Balance_Commerciale	Taux_Change);
run;


/*TEST D’ENDOGENEITE*/

proc sort data=DATAP;
by Pays Date;
run;

proc panel data=DATAP;
id Pays Date;
lag Inflation(1 2 3 4)/out=DATAP;
run;

proc panel data=DATAP;
id Pays Date;
lag Emission (1 2 3 4)/out=DATAP;
run;

proc print; run;
/*PROCESSUS AUTOREGRESSIF*/

proc autoreg data=DATAP;
model  Inflation= Emission	Inflation1 Reserve_Legale Balance_Commerciale	Taux_Change / 
nlag=2 method=ml;
run;
ods excel close;
