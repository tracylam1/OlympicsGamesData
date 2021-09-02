/* 

Olympic Games Data

*/

--checking data
select *
from portfolio..AthleteEvents

-- Data cleaning/transformation

-- Making Separate Columns for Year and Season of Games
select substring(games, 1, 4) as Year
from portfolio..AthleteEvents

alter table portfolio..AthleteEvents
add Year int

update portfolio..athleteevents
set year = substring(games, 1, 4)

select substring(games, 6, 6) as Season
from portfolio..athleteevents
 
alter table portfolio..AthleteEvents
add Season nvarchar(255)

update portfolio..athleteevents
set Season = substring(games, 6, 6)

--Data Analysis and Exploration focusing on Winter Games

--total amount of athletes participating in the games
select distinct count(ID) as TotalAthletes
from portfolio..athleteevents
where season = 'Winter'

-- total amount of medals obtained through the winter games
select count(medal) as TotalMedals
from portfolio..athleteevents
where season = 'Winter' and (medal = 'Gold' or medal = 'Silver' or medal = 'Bronze')

-- average ages of athletes by sex
select sex, avg(age) as AverageAge
from portfolio..athleteevents
where season = 'Winter'
group by sex

-- all winter games medals by each NOC
select NOC, count(medal) as TotalMedals
from portfolio..athleteevents
where season = 'Winter' and (medal = 'Gold' or medal = 'Silver' or medal = 'Bronze')
group by NOC
order by TotalMedals desc

-- total medals by each athlete and their NOC
select athlete, NOC, count(medal) as TotalMedals
from portfolio..athleteevents
where season = 'Winter' and (medal = 'Gold' or medal = 'Silver' or medal = 'Bronze')
group by athlete, NOC
order by TotalMedals desc

-- total medals by each NOC by years
select NOC, year, count(medal) as TotalMedals
from portfolio..athleteevents
where season = 'Winter' and (medal = 'Gold' or medal = 'Silver' or medal = 'Bronze')
group by NOC, year