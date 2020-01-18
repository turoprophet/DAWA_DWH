USE dawa_dm;

-- View performance per location
CREATE VIEW PerfPerLocation AS
SELECT t.name, l.stadiumName, l.stateName, l.countryName, CASE
	WHEN t.name = l.teamName THEN 1
    ELSE 0 END as `Home?`, m.Goals, m.Goals_Against, m.numerGames,
    m.Win, m.Shots, m.Shots_On_Target, m.Red_Cards, m.Yellow_Cards
    FROM Location_Datamart l JOIN Match_results_Datamart m ON l.idPlace = m.idPlace
    JOIN Team_Datamart t ON m.idTeam = t.idTeam;
    
-- View performance per time dimension
CREATE VIEW PerfPerSeason AS
SELECT t.name, s.weekNum, s.seasonName, s.decadeName, m.Goals, m.Goals_Against, m.numerGames,
    m.Win, m.Shots, m.Shots_On_Target, m.Red_Cards, m.Yellow_Cards
    FROM time_Datamart s JOIN Match_results_Datamart m ON s.idTime = m.idTime
    JOIN Team_Datamart t ON m.idTeam = t.idTeam;
    
CREATE VIEW PerfPerTimeAndPlace AS
SELECT t.name, l.stadiumName, l.stateName, l.countryName, CASE
	WHEN t.name = l.teamName THEN 1
    ELSE 0 END as `Home?`, s.weekNum, s.seasonName, s.decadeName, m.Goals, m.Goals_Against, m.numerGames,
    m.Win, m.Shots, m.Shots_On_Target, m.Red_Cards, m.Yellow_Cards
    FROM Location_Datamart l JOIN Match_results_Datamart m ON l.idPlace = m.idPlace
    JOIN Team_Datamart t ON m.idTeam = t.idTeam 
    JOIN Time_Datamart s ON s.idTime = m.idTime;

