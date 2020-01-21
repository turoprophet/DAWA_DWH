In case a straightforward reproduction of the cdwh is desired, please execute in the following order:

-> Execute DM1.sql -> Import data from /DATA/DM/ -> Execute DM3_INDEXES.sql

Otherwise, in case one wants to go step by step in the CDWH creation, the execution order should following
the alphabetical ordering of the files:

-> DM1.sql -> DM2_ImportCDWH.sql -> DM3_INDEXES.sql

Given the following conditions, the execution of the scripts should lead to the desired CDWH
	-> The database names are the same as those used in the scripts: "dawa_cdwh", "dawa_dm"