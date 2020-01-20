USE dawa_dm;

DROP VIEW IF EXISTS PerfPerLocation;
-- View performance per location
CREATE VIEW PerfPerLocation AS
SELECT t.name as Team, l.stadiumName as Stadium, l.stateName as State, l.countryName as Country, m.Goals, m.Goals_Against as `Goals against`, m.numerGames as Matches,
    m.Win, m.Shots, m.Shots_On_Target as `Shots on target`, m.Red_Cards as `Red cards`, m.Yellow_Cards as `Yellow cards`
    FROM Location_Datamart l JOIN Match_results_Datamart m ON l.idPlace = m.idPlace
    JOIN Team_Datamart t ON m.idTeam = t.idTeam;
    
DROP VIEW IF EXISTS PerfPerSeason;
-- View performance per time dimension
CREATE VIEW PerfPerSeason AS
SELECT t.name as Team, s.weekNum as `Match week`, s.seasonName as Season, s.decadeName as Decade, m.Goals, m.Goals_Against as `Goals against`, m.numerGames as Matches,
    m.Win, m.Shots, m.Shots_On_Target as `Shots on target`, m.Red_Cards as `Red cards`, m.Yellow_Cards as `Yellow cards`
    FROM time_Datamart s JOIN Match_results_Datamart m ON s.idTime = m.idTime
    JOIN Team_Datamart t ON m.idTeam = t.idTeam;

DROP VIEW IF EXISTS PerfPerTimeAndPlace;
-- View performance per time and place
CREATE VIEW PerfPerTimeAndPlace AS
SELECT t.name as Team, l.stadiumName as Stadium, l.stateName as State, l.countryName as Country,
	s.weekNum as `Match week`, s.seasonName as Season, s.decadeName as Decade, m.Goals, m.Goals_Against as `Goals against`, m.numerGames as Matches,
    m.Win, m.Shots, m.Shots_On_Target as `Shots on target`, m.Red_Cards as `Red cards`, m.Yellow_Cards as `Yellow cards`
    FROM Location_Datamart l JOIN Match_results_Datamart m ON l.idPlace = m.idPlace
    JOIN Team_Datamart t ON m.idTeam = t.idTeam 
    JOIN Time_Datamart s ON s.idTime = m.idTime;

