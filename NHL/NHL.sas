libname Projet "/home/u59543116/SAS2021/Projet";
/**********************************************************************************/
/* 1 - Import des données */
/***********************************************************************************/

data PROJET.PLAYER_INFO    ;
            %let _EFIERR_ = 0; /* set the ERROR detection macro variable */
            infile '/home/u59543116/SAS2021/Projet/player_info.csv' delimiter = ',' MISSOVER DSD lrecl=32767 firstobs=2 ;
               informat player_id $9. ;
               informat firstName $16. ;
               informat lastName $21. ;
               informat nationality $5. ;
               informat birthCity $29. ;
               informat primaryPosition $4. ;
               informat birthDate anydtdtm40. ;
               informat birthStateProvince $4. ;
               informat height $9. ;
               informat height_cm $6. ;
               informat weight $3. ;
               informat shootsCatches $3. ;
               format player_id $9. ;
               format firstName $16. ;
               format lastName $21. ;
               format nationality $5. ;
               format birthCity $29. ;
               format primaryPosition $4. ;
               format birthDate datetime. ;
               format birthStateProvince $4. ;
               format height $9. ;
               format height_cm $6. ;
               format weight $3. ;
               format shootsCatches $3. ;
            input
                        player_id  $
                        firstName  $
                        lastName  $
                        nationality  $
                        birthCity  $
                        primaryPosition  $
                        birthDate
                        birthStateProvince  $
                        height  $
                        height_cm  $
                        weight  $
                        shootsCatches  $
            ;
            if _ERROR_ then call symputx('_EFIERR_',1);  /* set ERROR detection macro variable */
            run;
            
data PROJET.GAME_GOALIE_STATS    ;
            %let _EFIERR_ = 0; /* set the ERROR detection macro variable */
            infile '/home/u59543116/SAS2021/Projet/game_goalie_stats.csv' delimiter = ',' MISSOVER DSD lrecl=32767 firstobs=2 ;
               informat game_id $12. ;
               informat player_id $9. ;
               informat team_id $4. ;
               informat timeOnIce best32. ;
               informat assists best32. ;
               informat goals best32. ;
               informat pim best32. ;
               informat shots best32. ;
               informat saves best32. ;
               informat powerPlaySaves best32. ;
               informat shortHandedSaves best32. ;
               informat evenSaves best32. ;
               informat shortHandedShotsAgainst best32. ;
               informat evenShotsAgainst best32. ;
               informat powerPlayShotsAgainst best32. ;
               informat decision $3. ;
               informat savePercentage $16. ;
               informat powerPlaySavePercentage $16. ;
               informat evenStrengthSavePercentage $16. ;
               format game_id $12. ;
               format player_id $9. ;
               format team_id $4. ;
               format timeOnIce best12. ;
               format assists best12. ;
               format goals best12. ;
               format pim best12. ;
               format shots best12. ;
               format saves best12. ;
               format powerPlaySaves best12. ;
               format shortHandedSaves best12. ;
               format evenSaves best12. ;
               format shortHandedShotsAgainst best12. ;
               format evenShotsAgainst best12. ;
               format powerPlayShotsAgainst best12. ;
               format decision $3. ;
               format savePercentage $16. ;
               format powerPlaySavePercentage $16. ;
               format evenStrengthSavePercentage $16. ;
            input
                        game_id  $
                        player_id  $
                        team_id  $
                        timeOnIce
                        assists
                        goals
                        pim
                        shots
                        saves
                        powerPlaySaves
                        shortHandedSaves
                        evenSaves
                        shortHandedShotsAgainst
                        evenShotsAgainst
                        powerPlayShotsAgainst
                        decision  $
                        savePercentage  $
                        powerPlaySavePercentage  $
                        evenStrengthSavePercentage  $
            ;           if _ERROR_ then call symputx('_EFIERR_',1);  /* set ERROR detection macro variable */
            run;

data PROJET.GAME_SKATER_STATS    ;
            %let _EFIERR_ = 0; /* set the ERROR detection macro variable */
            infile '/home/u59543116/SAS2021/Projet/game_skater_stats.csv' delimiter = ',' MISSOVER DSD lrecl=32767 firstobs=2 ;
               informat game_id $12. ;
               informat player_id $9. ;
               informat team_id $4. ;
               informat timeOnIce best32. ;
               informat assists best32. ;
               informat goals best32. ;
               informat shots best32. ;
               informat hits $2. ;
               informat powerPlayGoals best32. ;
               informat powerPlayAssists best32. ;
               informat penaltyMinutes best32. ;
               informat faceOffWins best32. ;
               informat faceoffTaken best32. ;
               informat takeaways $2. ;
               informat giveaways $2. ;
               informat shortHandedGoals best32. ;
               informat shortHandedAssists best32. ;
               informat blocked $2. ;
               informat plusMinus best32. ;
               informat evenTimeOnIce best32. ;
               informat shortHandedTimeOnIce best32. ;
               informat powerPlayTimeOnIce best32. ;
               format game_id $12. ;
               format player_id $9. ;
               format team_id $4. ;
               format timeOnIce best12. ;
               format assists best12. ;
               format goals best12. ;
               format shots best12. ;
               format hits $2. ;
               format powerPlayGoals best12. ;
               format powerPlayAssists best12. ;
               format penaltyMinutes best12. ;
               format faceOffWins best12. ;
               format faceoffTaken best12. ;
               format takeaways $2. ;
               format giveaways $2. ;
               format shortHandedGoals best12. ;
               format shortHandedAssists best12. ;
               format blocked $2. ;
               format plusMinus best12. ;
               format evenTimeOnIce best12. ;
               format shortHandedTimeOnIce best12. ;
               format powerPlayTimeOnIce best12. ;
            input
                        game_id  $
                        player_id  $
                        team_id  $
                        timeOnIce
                        assists
                        goals
                        shots
                        hits  $
                        powerPlayGoals
                        powerPlayAssists
                        penaltyMinutes
                        faceOffWins
                        faceoffTaken
                        takeaways  $
                        giveaways  $
                        shortHandedGoals
                        shortHandedAssists
                        blocked  $
                        plusMinus
                        evenTimeOnIce
                        shortHandedTimeOnIce
                        powerPlayTimeOnIce
            ;
            if _ERROR_ then call symputx('_EFIERR_',1);  /* set ERROR detection macro variable */            
            run;            
        
PROC IMPORT OUT= PROJET.game
            DATAFILE= "/home/u59543116/SAS2021/Projet/game.csv"
            DBMS=CSV REPLACE;
            DELIMITER= ",";
     		GETNAMES=YES;
     		DATAROW=2;
RUN;

proc sort data = PROJET.game out = PROJET.game nodupkey;
by game_id;
run;

PROC IMPORT OUT= Projet.game_teams_stats
            DATAFILE= "/home/u59543116/SAS2021/Projet/game_teams_stats.csv"
            DBMS=DLM REPLACE;
            DELIMITER= ",";
     		GETNAMES=YES;
     		DATAROW=2;
     		GUESSINGROWS=50000;
RUN;

proc sort data = PROJET.game_teams_stats out = PROJET.game_teams_stats nodupkey;
by team_id game_id;
run; 

data Projet.player_info;
	set Projet.player_info;
	array CHAR _character_;
	array num _numeric_;

do over CHAR;
	if CHAR='NA' then call missing(CHAR);
	else if missing(CHAR) then CHAR='WAS MISSING';
end;
run;

data Projet.player_info(drop=weight height_cm);
set Projet.player_info;
new_height_cm=input(height_cm, best12.);
new_weight=input(weight, best12.);
run;

data PROJET.GAME_SKATER_STATS;
	set PROJET.GAME_SKATER_STATS;
	array CHAR _character_;
	array num _numeric_;

do over CHAR;
	if CHAR='NA' then call missing(CHAR);
	else if missing(CHAR) then CHAR='WAS MISSING';
end;
run;

data PROJET.GAME_SKATER_STATS(drop=hits takeaways giveaways blocked);
	set PROJET.GAME_SKATER_STATS;
	new_hits=input(hits, best12.);
	new_takeaways=input(takeaways, best12.);
	new_giveaways=input(giveaways, best12.);
	new_blocked=input(blocked, best12.);
run;

data Projet.game_goalie_stats;
	set Projet.game_goalie_stats;
	array CHAR _character_;
	array num _numeric_;

do over CHAR;
	if CHAR='NA' then call missing(CHAR);
	else if missing(CHAR) then CHAR='WAS MISSING';
end;
run;

data Projet.game_goalie_stats(drop=savePercentage powerPlaySavePercentage evenStrengthSavePercentage);
	set Projet.game_goalie_stats;
	new_savePercentage=input(savePercentage, best16.);
	new_powerPlaySavePercentage=input(powerPlaySavePercentage, best16.);
	new_evenStrengthSavePercentage=input(evenStrengthSavePercentage, best16.);
run;

data Projet.game;
	set Projet.game;
	array CHAR _character_;
	array num _numeric_;

do over CHAR;
	if CHAR='NA' then call missing(CHAR);
	else if missing(CHAR) then CHAR='WAS MISSING';
end;
run;

/* 2 - Caractéristiques des joueurs et des postes */

/* Les indicateurs moyens de skater par saison et par joueur (Pour toutes  les saisons>20042005)*/

proc sql;
create table Projet.ind_moy_skater as
select Distinct A.season, 
		        B.player_id,
		        C.primaryPosition,
		        avg(timeOnIce) as avg_timeOnIce,
	 	        avg(B.assists) as avg_assists, 
	         	avg(B.goals) as avg_goals, 
	        	avg(B.shots) as avg_shots,
                avg (B.powerPlayAssists) as avg_powerPlayAssists,      
                avg (B.faceOffWins) as avg_faceOffWins,
                avg (B.faceoffTaken) as avg_faceoffTaken,
                avg (B.shortHandedGoals) as avg_shortHandedGoals,
                avg (B.shortHandedAssists) as avg_shortHandedAssists,
                avg (B.plusMinus) as avg_plusMinus,
                avg (B.evenTimeOnIce) as avg_evenTimeOnIce,
                avg (B.shortHandedTimeOnIce) as avg_shortHandedTimeOnIce,
                avg (B.powerPlayTimeOnIce) as avg_powerPlayTimeOnIce,
                avg (B.new_blocked)  as avg_new_blocked,
                avg (B.new_hits) as avg_new_hits,
                avg (B.new_takeaways) as avg_new_takeaways,
                avg (B.new_giveaways) as avg_new_giveaways
from Projet.game A inner join Projet.GAME_SKATER_STATS B on A.game_id=B.game_id 
				   inner join PROJET.PLAYER_INFO C on B.player_id=C.player_id
Where A.season NOT IN ('20002001','20012002','20022003','20032004','20042005')					   
Group by A.season, B.player_id
;

/* Les indicateurs moyens de goalie par saison et par joueur (Pour toutes les saisons>20042005)*/

create table Projet.ind_moy_goalie as
select Distinct A.season, 				
		        B.player_id,
		        C.primaryPosition,
		        avg(timeOnIce) as avg_timeOnIce,
	 	        avg(B.assists) as avg_assists, 
	         	avg(B.goals) as avg_goals, 
	        	avg(B.shots) as avg_shots,
                avg (B.evenSaves) as avg_evenSaves,      
                avg (B.evenShotsAgainst) as avg_evenShotsAgainst,
                avg (B.shortHandedShotsAgainst) as avg_shortHandedShotsAgainst,
                avg (B.shortHandedSaves) as avg_shortHandedSaves,
                avg (B.saves) as avg_saves,
                avg (B.powerPlayShotsAgainst) as avg_powerPlayShotsAgainst,
                avg (B.powerPlaySaves) as avg_powerPlaySaves,
                avg (B.pim) as avg_pim,
                avg (B.new_evenStrengthSavePercentage)  as avg_evenStrengthSavePercentage,
                avg (B.new_powerPlaySavePercentage) as avg_new_powerPlaySavePercentage,
                avg (B.new_savePercentage) as avg_new_savePercentage      
from Projet.game A inner join Projet.GAME_GOALIE_STATS B on A.game_id=B.game_id 
				   inner join PROJET.PLAYER_INFO C on B.player_id=C.player_id
Where A.season NOT IN ('20002001','20012002','20022003','20032004','20042005')			
Group by A.season, B.player_id
;
quit;

/* Les indicateurs moyens de goalie et skater par joueur (Pour toutes les saison entre 20152016 et 20192020)*/

proc sql;
create table Projet.ind_moy_skater_20152020 as
select  season,primaryPosition,player_id,
		avg_timeOnIce, avg_assists,avg_goals,avg_shots       
from Projet.ind_moy_skater as A 
Where A.season IN ('20152016','20162017',
				   '20172018','20182019','20192020') 
;
create table Projet.ind_moy_goalie_20152020 as
select season,primaryPosition, player_id,
	   avg_timeOnIce,avg_assists,avg_goals,avg_shots  
from Projet.ind_moy_goalie as A
Where A.season IN ('20152016','20162017',
				   '20172018','20182019','20192020')
;
quit;
data Projet.ind_moy_20152020;
set Projet.ind_moy_skater_20152020 Projet.ind_moy_goalie_20152020;
run
;

/* Pour chaque modalité de la variable « primaryPosition », donner les caractéristiques de chaque position en vous basant sur les différentes statistiques sportives, physique*/
proc sql;
create table Projet.pos_moy as
select  C.primaryPosition,			
  	    avg(B.assists) as avg_assists, 
  	    avg(B.goals) as avg_goals, 
    	avg(B.shots) as avg_shots,
        avg (B.powerPlayAssists) as avg_powerPlayAssists,      
        avg (B.faceOffWins) as avg_faceOffWins,
        avg (B.faceoffTaken) as avg_faceoffTaken,
        avg (B.shortHandedGoals) as avg_shortHandedGoals,
        avg (B.shortHandedAssists) as avg_shortHandedAssists,
        avg (B.plusMinus) as avg_plusMinus,
        avg (B.evenTimeOnIce) as avg_evenTimeOnIce,
        avg (B.shortHandedTimeOnIce) as avg_shortHandedTimeOnIce,
        avg (B.powerPlayTimeOnIce) as avg_powerPlayTimeOnIce,
        avg (B.new_takeaways) as avg_new_takeaways,
        avg (B.new_giveaways) as avg_new_giveaways
from Projet.game A inner join Projet.GAME_SKATER_STATS B on A.game_id=B.game_id
				   inner join PROJET.PLAYER_INFO C on B.player_id=C.player_id	
Where A.season NOT IN ('20002001','20012002','20022003','20032004','20042005')				   
Group by C.primaryPosition
;
quit;
/* Les indicateurs moyens de chaque postes et nombre de chaque postes par saison(Pour toutes les saison entre 20152016 et 20192020 )*/
proc sql;
create table Projet.nbe_postes as
select season,primaryPosition,count(*) as nbe_player
from Projet.ind_moy_20152020
group by season,primaryPosition
;

create table Projet.pos_moy_20152020 as
select DISTINCT primaryPosition,
		        avg(avg_timeOnIce) as avg_timeOnIce,
	 	        avg(avg_assists) as avg_assists, 
	         	avg(avg_goals) as avg_goals, 
	        	avg(avg_shots) as avg_shots
from Projet.ind_moy_20152020			   
Group by primaryPosition
;
quit;
/* 3 -  Analyse de données */

/* 3.1- Nombre de chaque postes par saison(Pour toutes les saison entre 20152016 et 20192020)*/

proc sgplot data=PROJET.NBE_POSTES;
	scatter y=nbe_player x=primaryPosition / group=season;
	yaxis label='Nombre jouer';
	xaxis label='primaryPosition';
	keylegend /title='Nombre de joueurs en fonction de leurs positions pour 5 saisons';
run;

/* Skater et goalie 2019-2020,une boîte à moustaches séparément pour visualiser la distribution de leurs attributs de base.*/

proc sgplot data=Projet.ind_moy_20152020;
    vbox avg_timeOnIce/category=primaryPosition group=season;
    xaxis label='Positions';
    yaxis label='Temps moyen sur la glace';
    keylegend /title='Temps moyen sur la glace en fonction des différentes positions des joueurs pour 5 saisons';
run;

proc sgplot data=Projet.ind_moy_20152020;
    vbox avg_assists/category=primaryPosition group=season;
    xaxis label='Positions';
    yaxis label='Assistance/aide moyenne';  
    keylegend /title='Assistance moyenne en fonction des différentes positions pour 5 saisons';
run;

proc sgplot data=Projet.ind_moy_20152020;
    vbox avg_goals/category=primaryPosition group=season;
    xaxis label='Positions';
    yaxis label='Moyenne des buts marqués';
    keylegend /title='Moyenne des buts marqués en fonction des différents postes pour 5 saisons';
run;

/* 3.2 - Effectuer une ACP sur la base créée*/

/* Analyse en composantes principales des indicateurs moyens de skater par saison et par joueur (Pour toutes  les saisons>20042005)*/

proc princomp data=Projet.ind_moy_skater
	OUT= Projet.result_acp 
	OUTSTAT= Projet.stat_acp 
	N=3;
	var avg_assists--avg_powerPlayTimeOnIce; 
	ID player_id;
run;
/* OUT: donne le nom de la table de sortie contenant les données et les composantes principales*/
/* OUTSTAT: donne le nom du fichier de sortie contenant les différentes statistiques relatives aux variables sélectionnées*/
proc princomp data=Projet.ind_moy_skater
	N=3 
		OUT= Projet.result_acp 
	OUTSTAT= Projet.stat_acp 
	plots(ncomp=2)=all;
	ID player_id;
run;

/* 3.3 - Effectuer une ACP +Kmeans-Clustering sur la base créée*/

/* Kmeans Clustering */
proc stdize data=PROJET.IND_MOY_20152020 out=Work._std_ method=range;
	var avg_timeOnIce avg_assists avg_goals avg_shots;
run;
proc fastclus data=Work._std_ maxclusters=3 out=PROJET.Fastclus_scores0001;
	var avg_timeOnIce avg_assists avg_goals avg_shots;
run;
proc delete data=Work._std_;
run;

/* Analyse en composantes principales des indicateurs moyens de goalie et skater par joueur (Pour toutes les saison entre 20152016 et 20192020 )*/

proc princomp data=PROJET.FASTCLUS_SCORES0001 n=2 plots(only)=(scree) 
		out=PROJET.Princomp_scores0001;
	var avg_timeOnIce avg_assists avg_goals avg_shots;
run;

proc princomp data=PROJET.FASTCLUS_SCORES0001
	N=2 
		OUT= PROJET.ACP_Princomp_scores0001
	OUTSTAT= Projet.stat_acp_Princomp_scores0001 
	plots(ncomp=3)=all;
	ID player_id;
run;

/* Visualiser les clusters par composants */
proc sgplot data=PROJET.PRINCOMP_SCORES0001;
	scatter x=Prin1 y=Prin2 / group=CLUSTER;
	xaxis grid;
	yaxis grid;
	keylegend /title='Visualisation de clustering K-Means par composantes';
run;


