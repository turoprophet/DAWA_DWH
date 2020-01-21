-- Let's get the data from the staging area into the cdwh

USE dawa_cdwh;

TRUNCATE Country;
TRUNCATE Stadium;
TRUNCATE State;

-- Our raw data belongs only to the 1. Bundesliga, so we hard code some things here
-- that could come from the staging area if we had a bigger database and scope

DROP PROCEDURE IF EXISTS createLocDim;
delimiter //
create procedure createLocDim()
begin
declare cName, sName varchar(45);
declare staID, stdID int;
declare finished bool;

DECLARE cursorStadium
	CURSOR FOR SELECT name FROM Stadium;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = TRUE;
-- Let's rollback changes if any error happened
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION ROLLBACK;

START TRANSACTION;

set stdID = 1;
set cName = 'Germany';
set finished = FALSE;

-- Fill up the country, state and team tables
INSERT INTO Country (countryName) VALUES (cName);

INSERT INTO State (stateName, countryName) 
SELECT DISTINCT stateName, cName FROM dawa_stage.Stadiums;

INSERT INTO Stadium (stateName, name, teamName)
SELECT stateName, name, teamName FROM dawa_stage.stadiums;

OPEN cursorStadium;

-- Set ids to Stadium
bucle: LOOP
FETCH cursorStadium INTO sName;
IF finished = TRUE THEN LEAVE bucle; END IF;

UPDATE Stadium SET idStadium = stdID WHERE name = sName;
SET stdID = stdID + 1;

END LOOP bucle;

CLOSE cursorStadium;

-- END TRANSACTION
COMMIT;

END
//
delimiter ;

CALL createLocDim;

DROP PROCEDURE createLocDim;