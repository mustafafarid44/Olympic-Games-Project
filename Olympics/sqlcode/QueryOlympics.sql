SELECT * FROM athlete_events$
SELECT*FROM noc_regions$
--CHECKING FOR NULL VALUES
SELECT COUNT(*) FROM athlete_events$
WHERE Medal IS NULL
WHERE NAME IS NULL
--JOINING REGION COLUMN FROM NOC TABLE TO ATHLETE EVENTS TABLE THROUGH THE FORGEIN KEY NOC
CREATE VIEW [MYVIEW] AS  
SELECT A.NAME, A.SEX, A.NOC FROM athlete_events$ A JOIN noc_regions$ N ON A.NOC = N.NOC

ALTER VIEW [MYVIEW] AS SELECT A.ID, A.NAME, A.SEX, A.AGE, A.HEIGHT, A.TEAM, A.NOC , A.GAMES, A.YEAR, A.SEASON, A.CITY, A.SPORT, A.EVENT, A.MEDAL, N.region FROM athlete_events$ A
JOIN noc_regions$ N ON A.NOC = N.NOC
SELECT*FROM MYVIEW

SELECT Year FROM MYVIEW
WHERE YEAR IS NULL
--ANALYZING DATA
--HOW MANY SUMMER OLYMPIC COMPETITION HAVE BEEN HELD
SELECT count( DISTINCT Year) FROM MYVIEW
WHERE Season LIKE 'Summer'

--FOR EACH SPORT IN HOW MANY SEASONS THEY HAVE BEEN PLAYED IN
SELECT SPORT, COUNT(DISTINCT YEAR) AS CNT FROM MYVIEW
GROUP BY SPORT
ORDER BY CNT DESC

--TOP 5 ATHLETES THAT WON GOLD MEDALS
SELECT TOP 5 NAME, COUNT(MEDAL) AS CNT FROM MYVIEW 
WHERE MEDAL LIKE 'Gold'
GROUP BY NAME
ORDER BY CNT DESC
-- COUNT EACH MEDAL BY COUNTRY
create view view1 as
SELECT region, [Gold], [Silver], [Bronze] FROM ( SELECT region, medal FROM MYVIEW) AS L
PIVOT(COUNT([medal]) FOR medal IN ([Gold],[Silver],[Bronze])) AS T






