In case a straightforward reproduction of the cdwh is desired, please execute in the following order:

-> Execute CDWH1.sql -> Import data from /DATA/CDWH/ -> Execute CDWH6_INDEXES.sql

Note that before executing the CDWH6_INDEXES.sql script, one must comment out the ALTER statements
for the Match_results and Team tables. More specifically, we want uncomment the statements that contain
add the PRIMARY KEY and make the PRIMARY KEY AUTO_INCREMENT. 

These are two separate statements: 
look for the ALTER ... ADD PRIMARY ... for the first case
look for the ALTER ... MODIFY <column> AUTO_INCREMENT for the second case

Otherwise, in case one wants to go step by step in the CDWH creation, the execution order should following
the alphabetical ordering of the files:

-> CDWH1.sql -> CDWH2.Time_Dimension.sql -> CDWH3_TeamDimension.sql -> CDWH4_LocDimension.sql -> CDWH5_ImportFact.sql
-> CDWH6_INDEXES.sql

Given the following conditions, the execution of the scripts should lead to the desired CDWH
	-> CDWH6_INDEXES.sql has not been modified as stated in the starting section of this document.
	-> The database names are the same as those used in the scripts: "dawa_cdwh", "dawa_stage"