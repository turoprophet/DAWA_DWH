The script supplied here only cares for changing the date into information we want:

	Our raw contains information of the actual day, month and year of a particular match. In our
	use case we only care to map that particular day to the corresponding "Match week".
	"Match week" refers, as in many sports leagues, to a round of matches, where teams face another
	team and earn or not the respective points that will add up to the statistics of posterior rounds
	to define a winner.
	
	The german bundesliga has 34 "match weeks", so teams face 2 times each other, one as a home team, one as the away team.
	There are in total 9 matches per match week. We assign the same match week number to matches in groups of 9 then.

The tables for seasons have to be previously imported from the csv files supplied in the Data folder.

Execute this script for every season_xxxx.csv file. Be mindful of the database naming.