-- Let's introduce all data into the facts table and connect it to dimensions
-- Keep in mind that for each row in the raw data's table, we need to produce two entries
-- in our CDWH's fact table
USE dawa_cdwh;

TRUNCATE Match_results;

DROP PROCEDURE IF EXISTS importData;
delimiter //
CREATE PROCEDURE importData()
BEGIN

-- Let's rollback changes if any error happened
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION ROLLBACK;

START TRANSACTION;

-- Let's add auto increment to the table |  Make sure you have not added indexes yet, or comment out this
ALTER TABlE match_results ADD PRIMARY KEY (`idMatch_results`);
ALTER TABLE match_results MODIFY `idMatch_results` int(11) NOT NULL AUTO_INCREMENT;

-- Home team match results
INSERT INTO `Match_results` (idStadium, idTeam, idWeek, Goals, Goals_Against, numerGames, Win, Shots, Shots_On_Target, Red_Cards, Yellow_Cards)
SELECT S.idStadium, T.idTeam, w.idWeek, sea.FTHG, sea.FTAG, 1, CASE WHEN sea.FTR='H' THEN 1 ELSE 0 END as Win, sea.HS, sea.HST, sea.HR, sea.HY 
FROM Stadium S JOIN Team T ON T.Name = S.teamName JOIN dawa_stage.`season-0910` sea ON T.Name = sea.HomeTeam
JOIN Season ss ON ss.Season LIKE '%-10%' JOIN Week w ON (ss.idSeason = w.idSeason AND w.weekNum = sea.date);

-- Away team match results
INSERT INTO `Match_results` (idStadium, idWeek, Goals, Goals_Against, numerGames, Win, Shots, Shots_On_Target, Red_Cards, Yellow_Cards, idTeam)
SELECT S.idStadium, w.idWeek, sea.FTAG, sea.FTHG, 1, CASE WHEN sea.FTR='A' THEN 1 ELSE 0 END as Win, sea.AS, sea.AST, sea.AR, sea.AY, T.idTeam 
FROM Stadium S JOIN dawa_stage.`season-0910` sea ON S.teamName = sea.HomeTeam JOIN Team T ON T.Name = sea.AwayTeam
JOIN Season ss ON ss.Season LIKE '%-10%' JOIN Week w ON (ss.idSeason = w.idSeason AND w.weekNum = sea.date);

-- Home team match results
INSERT INTO `Match_results` (idStadium, idTeam, idWeek, Goals, Goals_Against, numerGames, Win, Shots, Shots_On_Target, Red_Cards, Yellow_Cards)
SELECT S.idStadium, T.idTeam, w.idWeek, sea.FTHG, sea.FTAG, 1, CASE WHEN sea.FTR='H' THEN 1 ELSE 0 END as Win, sea.HS, sea.HST, sea.HR, sea.HY 
FROM Stadium S JOIN Team T ON T.Name = S.teamName JOIN dawa_stage.`season-1011` sea ON T.Name = sea.HomeTeam
JOIN Season ss ON ss.Season LIKE '%-11%' JOIN Week w ON (ss.idSeason = w.idSeason AND w.weekNum = sea.date);

-- Away team match results
INSERT INTO `Match_results` (idStadium, idWeek, Goals, Goals_Against, numerGames, Win, Shots, Shots_On_Target, Red_Cards, Yellow_Cards, idTeam)
SELECT S.idStadium, w.idWeek, sea.FTAG, sea.FTHG, 1, CASE WHEN sea.FTR='A' THEN 1 ELSE 0 END as Win, sea.AS, sea.AST, sea.AR, sea.AY, T.idTeam 
FROM Stadium S JOIN dawa_stage.`season-1011` sea ON S.teamName = sea.HomeTeam JOIN Team T ON T.Name = sea.AwayTeam
JOIN Season ss ON ss.Season LIKE '%-11%' JOIN Week w ON (ss.idSeason = w.idSeason AND w.weekNum = sea.date);

-- Home team match results
INSERT INTO `Match_results` (idStadium, idTeam, idWeek, Goals, Goals_Against, numerGames, Win, Shots, Shots_On_Target, Red_Cards, Yellow_Cards)
SELECT S.idStadium, T.idTeam, w.idWeek, sea.FTHG, sea.FTAG, 1, CASE WHEN sea.FTR='H' THEN 1 ELSE 0 END as Win, sea.HS, sea.HST, sea.HR, sea.HY 
FROM Stadium S JOIN Team T ON T.Name = S.teamName JOIN dawa_stage.`season-1112` sea ON T.Name = sea.HomeTeam
JOIN Season ss ON ss.Season LIKE '%-12%' JOIN Week w ON (ss.idSeason = w.idSeason AND w.weekNum = sea.date);

-- Away team match results
INSERT INTO `Match_results` (idStadium, idWeek, Goals, Goals_Against, numerGames, Win, Shots, Shots_On_Target, Red_Cards, Yellow_Cards, idTeam)
SELECT S.idStadium, w.idWeek, sea.FTAG, sea.FTHG, 1, CASE WHEN sea.FTR='A' THEN 1 ELSE 0 END as Win, sea.AS, sea.AST, sea.AR, sea.AY, T.idTeam 
FROM Stadium S JOIN dawa_stage.`season-1112` sea ON S.teamName = sea.HomeTeam JOIN Team T ON T.Name = sea.AwayTeam
JOIN Season ss ON ss.Season LIKE '%-12%' JOIN Week w ON (ss.idSeason = w.idSeason AND w.weekNum = sea.date);

-- Home team match results
INSERT INTO `Match_results` (idStadium, idTeam, idWeek, Goals, Goals_Against, numerGames, Win, Shots, Shots_On_Target, Red_Cards, Yellow_Cards)
SELECT S.idStadium, T.idTeam, w.idWeek, sea.FTHG, sea.FTAG, 1, CASE WHEN sea.FTR='H' THEN 1 ELSE 0 END as Win, sea.HS, sea.HST, sea.HR, sea.HY 
FROM Stadium S JOIN Team T ON T.Name = S.teamName JOIN dawa_stage.`season-1213` sea ON T.Name = sea.HomeTeam
JOIN Season ss ON ss.Season LIKE '%-13%' JOIN Week w ON (ss.idSeason = w.idSeason AND w.weekNum = sea.date);

-- Away team match results
INSERT INTO `Match_results` (idStadium, idWeek, Goals, Goals_Against, numerGames, Win, Shots, Shots_On_Target, Red_Cards, Yellow_Cards, idTeam)
SELECT S.idStadium, w.idWeek, sea.FTAG, sea.FTHG, 1, CASE WHEN sea.FTR='A' THEN 1 ELSE 0 END as Win, sea.AS, sea.AST, sea.AR, sea.AY, T.idTeam 
FROM Stadium S JOIN dawa_stage.`season-1213` sea ON S.teamName = sea.HomeTeam JOIN Team T ON T.Name = sea.AwayTeam
JOIN Season ss ON ss.Season LIKE '%-13%' JOIN Week w ON (ss.idSeason = w.idSeason AND w.weekNum = sea.date);

-- Home team match results
INSERT INTO `Match_results` (idStadium, idTeam, idWeek, Goals, Goals_Against, numerGames, Win, Shots, Shots_On_Target, Red_Cards, Yellow_Cards)
SELECT S.idStadium, T.idTeam, w.idWeek, sea.FTHG, sea.FTAG, 1, CASE WHEN sea.FTR='H' THEN 1 ELSE 0 END as Win, sea.HS, sea.HST, sea.HR, sea.HY 
FROM Stadium S JOIN Team T ON T.Name = S.teamName JOIN dawa_stage.`season-1314` sea ON T.Name = sea.HomeTeam
JOIN Season ss ON ss.Season LIKE '%-14%' JOIN Week w ON (ss.idSeason = w.idSeason AND w.weekNum = sea.date);

-- Away team match results
INSERT INTO `Match_results` (idStadium, idWeek, Goals, Goals_Against, numerGames, Win, Shots, Shots_On_Target, Red_Cards, Yellow_Cards, idTeam)
SELECT S.idStadium, w.idWeek, sea.FTAG, sea.FTHG, 1, CASE WHEN sea.FTR='A' THEN 1 ELSE 0 END as Win, sea.AS, sea.AST, sea.AR, sea.AY, T.idTeam 
FROM Stadium S JOIN dawa_stage.`season-1314` sea ON S.teamName = sea.HomeTeam JOIN Team T ON T.Name = sea.AwayTeam
JOIN Season ss ON ss.Season LIKE '%-14%' JOIN Week w ON (ss.idSeason = w.idSeason AND w.weekNum = sea.date);

-- Home team match results
INSERT INTO `Match_results` (idStadium, idTeam, idWeek, Goals, Goals_Against, numerGames, Win, Shots, Shots_On_Target, Red_Cards, Yellow_Cards)
SELECT S.idStadium, T.idTeam, w.idWeek, sea.FTHG, sea.FTAG, 1, CASE WHEN sea.FTR='H' THEN 1 ELSE 0 END as Win, sea.HS, sea.HST, sea.HR, sea.HY 
FROM Stadium S JOIN Team T ON T.Name = S.teamName JOIN dawa_stage.`season-1415` sea ON T.Name = sea.HomeTeam
JOIN Season ss ON ss.Season LIKE '%-15%' JOIN Week w ON (ss.idSeason = w.idSeason AND w.weekNum = sea.date);

-- Away team match results
INSERT INTO `Match_results` (idStadium, idWeek, Goals, Goals_Against, numerGames, Win, Shots, Shots_On_Target, Red_Cards, Yellow_Cards, idTeam)
SELECT S.idStadium, w.idWeek, sea.FTAG, sea.FTHG, 1, CASE WHEN sea.FTR='A' THEN 1 ELSE 0 END as Win, sea.AS, sea.AST, sea.AR, sea.AY, T.idTeam 
FROM Stadium S JOIN dawa_stage.`season-1415` sea ON S.teamName = sea.HomeTeam JOIN Team T ON T.Name = sea.AwayTeam
JOIN Season ss ON ss.Season LIKE '%-15%' JOIN Week w ON (ss.idSeason = w.idSeason AND w.weekNum = sea.date);

-- Home team match results
INSERT INTO `Match_results` (idStadium, idTeam, idWeek, Goals, Goals_Against, numerGames, Win, Shots, Shots_On_Target, Red_Cards, Yellow_Cards)
SELECT S.idStadium, T.idTeam, w.idWeek, sea.FTHG, sea.FTAG, 1, CASE WHEN sea.FTR='H' THEN 1 ELSE 0 END as Win, sea.HS, sea.HST, sea.HR, sea.HY 
FROM Stadium S JOIN Team T ON T.Name = S.teamName JOIN dawa_stage.`season-1516` sea ON T.Name = sea.HomeTeam
JOIN Season ss ON ss.Season LIKE '%-16%' JOIN Week w ON (ss.idSeason = w.idSeason AND w.weekNum = sea.date);

-- Away team match results
INSERT INTO `Match_results` (idStadium, idWeek, Goals, Goals_Against, numerGames, Win, Shots, Shots_On_Target, Red_Cards, Yellow_Cards, idTeam)
SELECT S.idStadium, w.idWeek, sea.FTAG, sea.FTHG, 1, CASE WHEN sea.FTR='A' THEN 1 ELSE 0 END as Win, sea.AS, sea.AST, sea.AR, sea.AY, T.idTeam 
FROM Stadium S JOIN dawa_stage.`season-1516` sea ON S.teamName = sea.HomeTeam JOIN Team T ON T.Name = sea.AwayTeam
JOIN Season ss ON ss.Season LIKE '%-16%' JOIN Week w ON (ss.idSeason = w.idSeason AND w.weekNum = sea.date);

-- Home team match results
INSERT INTO `Match_results` (idStadium, idTeam, idWeek, Goals, Goals_Against, numerGames, Win, Shots, Shots_On_Target, Red_Cards, Yellow_Cards)
SELECT S.idStadium, T.idTeam, w.idWeek, sea.FTHG, sea.FTAG, 1, CASE WHEN sea.FTR='H' THEN 1 ELSE 0 END as Win, sea.HS, sea.HST, sea.HR, sea.HY 
FROM Stadium S JOIN Team T ON T.Name = S.teamName JOIN dawa_stage.`season-1617` sea ON T.Name = sea.HomeTeam
JOIN Season ss ON ss.Season LIKE '%-17%' JOIN Week w ON (ss.idSeason = w.idSeason AND w.weekNum = sea.date);

-- Away team match results
INSERT INTO `Match_results` (idStadium, idWeek, Goals, Goals_Against, numerGames, Win, Shots, Shots_On_Target, Red_Cards, Yellow_Cards, idTeam)
SELECT S.idStadium, w.idWeek, sea.FTAG, sea.FTHG, 1, CASE WHEN sea.FTR='A' THEN 1 ELSE 0 END as Win, sea.AS, sea.AST, sea.AR, sea.AY, T.idTeam 
FROM Stadium S JOIN dawa_stage.`season-1617` sea ON S.teamName = sea.HomeTeam JOIN Team T ON T.Name = sea.AwayTeam
JOIN Season ss ON ss.Season LIKE '%-17%' JOIN Week w ON (ss.idSeason = w.idSeason AND w.weekNum = sea.date);

-- Home team match results
INSERT INTO `Match_results` (idStadium, idTeam, idWeek, Goals, Goals_Against, numerGames, Win, Shots, Shots_On_Target, Red_Cards, Yellow_Cards)
SELECT S.idStadium, T.idTeam, w.idWeek, sea.FTHG, sea.FTAG, 1, CASE WHEN sea.FTR='H' THEN 1 ELSE 0 END as Win, sea.HS, sea.HST, sea.HR, sea.HY 
FROM Stadium S JOIN Team T ON T.Name = S.teamName JOIN dawa_stage.`season-1718` sea ON T.Name = sea.HomeTeam
JOIN Season ss ON ss.Season LIKE '%-18%' JOIN Week w ON (ss.idSeason = w.idSeason AND w.weekNum = sea.date);

-- Away team match results
INSERT INTO `Match_results` (idStadium, idWeek, Goals, Goals_Against, numerGames, Win, Shots, Shots_On_Target, Red_Cards, Yellow_Cards, idTeam)
SELECT S.idStadium, w.idWeek, sea.FTAG, sea.FTHG, 1, CASE WHEN sea.FTR='A' THEN 1 ELSE 0 END as Win, sea.AS, sea.AST, sea.AR, sea.AY, T.idTeam 
FROM Stadium S JOIN dawa_stage.`season-1718` sea ON S.teamName = sea.HomeTeam JOIN Team T ON T.Name = sea.AwayTeam
JOIN Season ss ON ss.Season LIKE '%-18%' JOIN Week w ON (ss.idSeason = w.idSeason AND w.weekNum = sea.date);

-- Home team match results
INSERT INTO `Match_results` (idStadium, idTeam, idWeek, Goals, Goals_Against, numerGames, Win, Shots, Shots_On_Target, Red_Cards, Yellow_Cards)
SELECT S.idStadium, T.idTeam, w.idWeek, sea.FTHG, sea.FTAG, 1, CASE WHEN sea.FTR='H' THEN 1 ELSE 0 END as Win, sea.HS, sea.HST, sea.HR, sea.HY 
FROM Stadium S JOIN Team T ON T.Name = S.teamName JOIN dawa_stage.`season-1819` sea ON T.Name = sea.HomeTeam
JOIN Season ss ON ss.Season LIKE '%-19%' JOIN Week w ON (ss.idSeason = w.idSeason AND w.weekNum = sea.date);

-- Away team match results
INSERT INTO `Match_results` (idStadium, idWeek, Goals, Goals_Against, numerGames, Win, Shots, Shots_On_Target, Red_Cards, Yellow_Cards, idTeam)
SELECT S.idStadium, w.idWeek, sea.FTAG, sea.FTHG, 1, CASE WHEN sea.FTR='A' THEN 1 ELSE 0 END as Win, sea.AS, sea.AST, sea.AR, sea.AY, T.idTeam 
FROM Stadium S JOIN dawa_stage.`season-1819` sea ON S.teamName = sea.HomeTeam JOIN Team T ON T.Name = sea.AwayTeam
JOIN Season ss ON ss.Season LIKE '%-19%' JOIN Week w ON (ss.idSeason = w.idSeason AND w.weekNum = sea.date);

-- END TRANSACTION
COMMIT;

END
//
delimiter ;

CALL importData();

DROP PROCEDURE importData;