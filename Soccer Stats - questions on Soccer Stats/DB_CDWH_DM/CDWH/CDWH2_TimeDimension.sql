-- Let's get the data from the staging area into the cdwh

USE dawa_cdwh;

TRUNCATE Season;
TRUNCATE Week;
TRUNCATE Decades;

-- Our raw data goes from season 2009-10 to 2018-19, so we only prepare decades and seasons
-- to our use case
DROP PROCEDURE IF EXISTS createTimeDim;
delimiter //
create procedure createTimeDim()
begin
declare dName, sName varchar(45);
declare wID, sID, dID int; -- time dim

set wID = 1;
set sID = 1;
set dID = 1;


-- Let's rollback changes if any error happened
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION ROLLBACK;

START TRANSACTION;

-- First insert the decade of 2000s and the only season we have data of, plus its weeks
INSERT INTO Decades (idDecade, Decade) VALUES (dID, '2000s');
INSERT INTO Season (idSeason, Season, idDecade) VALUES (sID, 'Season 2009-10', dID);

FOR i IN 1 .. 34 
DO
	INSERT INTO Week (idWeek, idSeason, weekNum) VALUES (wID, sID, i);
    SET wID = wID + 1;
END FOR;

-- Increment variables
set dID = dID +  1;
set sID = sID +  1;

INSERT INTO Decades (idDecade, Decade) VALUES (dID, '2010s');

bucle: LOOP
IF sID = 10 THEN LEAVE bucle; END IF;
-- Select season name
SELECT CASE
	WHEN sID = 1 THEN 'Season 2010-11'
    WHEN sID = 2 THEN 'Season 2011-12'
    WHEN sID = 3 THEN 'Season 2012-13'
    WHEN sID = 4 THEN 'Season 2013-14'
    WHEN sID = 5 THEN 'Season 2014-15'
    WHEN sID = 6 THEN 'Season 2015-16'
    WHEN sID = 7 THEN 'Season 2016-17'
    WHEN sID = 8 THEN 'Season 2017-18'
    WHEN sID = 9 THEN 'Season 2018-19'
    END
    INTO sName;
    
    INSERT INTO Season (idSeason, Season, idDecade) VALUES (sID, sName, dID);
    FOR i IN 1 .. 34 
	DO
		INSERT INTO Week (idWeek, idSeason, weekNum) VALUES (wID, sID, i);
		SET wID = wID + 1;
	END FOR;
	
    SET sID = sID + 1;

END LOOP bucle;

-- END TRANSACTION
COMMIT;
END
//
delimiter ;

CALL createTimeDim;

DROP PROCEDURE createTimeDim;