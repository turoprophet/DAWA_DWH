-- Let's get the data from the staging area into the cdwh

USE dawa_cdwh;

TRUNCATE Division;
TRUNCATE Team;

-- Our raw data belongs only to the 1. Bundesliga, so we hard code some things here
-- that could come from the staging area if we had a bigger database and scope

DROP PROCEDURE IF EXISTS createTeamDim;
delimiter //
create procedure createTeamDim()
begin

DECLARE dID int;
DECLARE dName VARCHAR(45);

-- Let's rollback changes if any error happened
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION ROLLBACK;

START TRANSACTION;

-- Let's add auto increment to the id |  Make sure you have not added indexes yet, or comment out this
ALTER TABlE Team ADD PRIMARY KEY (idTeam);
ALTER TABLE Team MODIFY idTeam INT NOT NULL AUTO_INCREMENT;

set dID = 1;
set dName = '1. Bundesliga';

-- Fill up the country, state and team tables
INSERT INTO Division (idDivision, Name) VALUES (dID, dName);

-- Fill up the Team from the raw data
INSERT IGNORE INTO Team (Name, idDivision) 
SELECT DISTINCT s.HomeTeam, CASE WHEN s.Div = 'D1' THEN dID ELSE -1 END
FROM dawa_stage.`season-0910` s;

INSERT IGNORE INTO Team (Name, idDivision) 
SELECT DISTINCT s.HomeTeam, CASE WHEN s.Div = 'D1' THEN dID ELSE -1 END
FROM dawa_stage.`season-1011` s;

INSERT IGNORE INTO Team (Name, idDivision) 
SELECT DISTINCT s.HomeTeam, CASE WHEN s.Div = 'D1' THEN dID ELSE -1 END
FROM dawa_stage.`season-1112` s;

INSERT IGNORE INTO Team (Name, idDivision) 
SELECT DISTINCT s.HomeTeam, CASE WHEN s.Div = 'D1' THEN dID ELSE -1 END
FROM dawa_stage.`season-1213` s;

INSERT IGNORE INTO Team (Name, idDivision) 
SELECT DISTINCT s.HomeTeam, CASE WHEN s.Div = 'D1' THEN dID ELSE -1 END
FROM dawa_stage.`season-1314` s;

INSERT IGNORE INTO Team (Name, idDivision) 
SELECT DISTINCT s.HomeTeam, CASE WHEN s.Div = 'D1' THEN dID ELSE -1 END
FROM dawa_stage.`season-1415` s;

INSERT IGNORE INTO Team (Name, idDivision) 
SELECT DISTINCT s.HomeTeam, CASE WHEN s.Div = 'D1' THEN dID ELSE -1 END
FROM dawa_stage.`season-1516` s;

INSERT IGNORE INTO Team (Name, idDivision) 
SELECT DISTINCT s.HomeTeam, CASE WHEN s.Div = 'D1' THEN dID ELSE -1 END
FROM dawa_stage.`season-1617` s;

INSERT IGNORE INTO Team (Name, idDivision) 
SELECT DISTINCT s.HomeTeam, CASE WHEN s.Div = 'D1' THEN dID ELSE -1 END
FROM dawa_stage.`season-1718` s;

INSERT IGNORE INTO Team (Name, idDivision) 
SELECT DISTINCT s.HomeTeam, CASE WHEN s.Div = 'D1' THEN dID ELSE -1 END
FROM dawa_stage.`season-1819` s;

-- In case you have not added indexes yet to the CDWH's tables, you'll end up
-- with a bunch of repeated entries. Let's clean that up with use of some temporary
-- table.. After all, we wanted to do all this without indexes
CREATE TEMPORARY TABLE tmp LIKE Team;
INSERT INTO tmp (Name, idDivision) SELECT DISTINCT Name, idDivision FROM Team;
TRUNCATE Team;
INSERT INTO Team SELECT * FROM tmp;
DROP TEMPORARY TABLE tmp;

-- END TRANSACTION
COMMIT;

END
//
delimiter ;

CALL createTeamDim;

DROP PROCEDURE createTeamDim;