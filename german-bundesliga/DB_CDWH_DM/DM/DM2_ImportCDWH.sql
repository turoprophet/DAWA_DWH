-- Let's fill up all dimensions from the cdwh into the dm
-- tables already created with the corresponding script

USE dawa_dm;

TRUNCATE Match_results_Datamart;
TRUNCATE Loc_Datamart;
TRUNCATE Time_Datamart;
TRUNCATE Team_Datamart;

DROP PROCEDURE IF EXISTS importCDWH;
delimiter //
CREATE PROCEDURE importCDWH()
BEGIN

-- Let's rollback changes if any error happened
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION ROLLBACK;

START TRANSACTION;

-- Let's import the time dimension
INSERT INTO Time_Datamart (idTime, weekNum, seasonName, decadeName)
SELECT w.idWeek, w.weekNum, s.Season, d.decade
FROM dawa_cdwh.Decades d JOIN dawa_cdwh.Season s ON d.idDecade = s.idDecade
JOIN dawa_cdwh.Week w ON s.idSeason = w.idSeason;

-- Let's import the location dimension
INSERT INTO Loc_Datamart (idPlace, stadiumName, stateName, countryName)
SELECT std.idStadium, std.Name, stt.stateName, stt.countryName
FROM dawa_cdwh.Stadium std JOIN dawa_cdwh.State ON std.stateName = stt.stateName;

-- Let's import the team dimension
INSERT INTO Team_Datamart (idTeam, name, divisionName)
SELECT t.idTeam, t.name, d.Name
FROM dawa_cdwh.Team t JOIN dawa_cdwh.Division d ON t.idDivision = d.idDivision;

-- Let's import the fact table
INSERT INTO match_results_datamart (idMatch_results, idPlace, idTeam, idTime, Goals, 
Goals_against, numerGames, Win, Shots, Shots_On_Target, Red_Cards, Yellow_Cards)
SELECT m.idMatch_results, m.idStadium, m.idTeam, m.idWeek, m.Goals, 
m.Goals_against, m.numerGames, m.Win, m.Shots, m.Shots_On_Target, m.Red_Cards, m.Yellow_Cards
FROM dawa_cdwh.match_results m;

-- END TRANSACTION
COMMIT;

END
//
delimiter ;

CALL importCDWH;

DROP PROCEDURE importCDWH;