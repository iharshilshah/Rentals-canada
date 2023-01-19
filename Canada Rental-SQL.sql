SELECT * 
FROM [Project]..['Table 1']

--Extracting Provincial Data
SELECT * INTO Provincial_Data 
FROM [Project]..['Table 1']
WHERE [Centre] like '%[10000+]%'

DELETE FROM [Project]..Provincial_Data
WHERE Centre = 'Canada'

UPDATE Provincial_Data SET [Centre] = LEFT([Centre], LEN([Centre])-7)

--Provincial Data
SELECT * FROM [Project]..Provincial_Data


--Extracting City Data
SELECT * INTO City_Data 
FROM [Project]..['Table 1']
WHERE [Centre] like '%CMA%'

DELETE FROM [Project]..City_Data
WHERE Centre = 'Canada'

--Formatting City Names
UPDATE City_Data SET Centre = LEFT(Centre, LEN(Centre)-4)

UPDATE [Project]..City_Data SET Centre = (SUBSTRING(centre, 1, 15))
WHERE Centre = 'Ottawa-Gatineau CMA (Qué. p' or Centre = 'Ottawa-Gatineau CMA (Ont. p'

--City Data
SELECT * FROM [Project]..City_Data


--Increment/decrement of rental properties among provinces(Mobility Change)
SELECT Centre, CONVERT(float,[Vacancy Rates (Nov-21)]) AS Vacancy_2020, CONVERT(float, [Vacancy Rates (Nov-22)]) AS Vacancy_2021,
-1 * (CONVERT(float, [Vacancy Rates (Nov-22)])-CONVERT(float,[Vacancy Rates (Nov-21)])) AS Mobility_Change
FROM [Project]..Provincial_Data 
ORDER BY Mobility_Change DESC

--Increment/decrement of average rent (2 bedroom)
SELECT Centre, [Average Rent Two Bedroom ($) (New and Existing Structures) (01/1] AS Average_Two_Bedroom_rent2021, 
[Average Rent Two Bedroom ($) (New and Existing Structures)(01/11] AS Average_Two_Bedroom_rent2022
FROM [Project]..Provincial_Data

ALTER TABLE [Project]..Provincial_Data
DROP COLUMN [Turnover rates (Nov-21)], [Turnover rates (Nov-22)]

ALTER TABLE [Project]..Provincial_Data
DROP COLUMN [Turnover rates (Nov-22)]

ALTER TABLE [Project]..Provincial_Data
DROP COLUMN [Percentage Change of Average Rent Two Bedroom From Fixed Sample1]

SELECT * 
FROM [Project]..Provincial_Data

SELECT Centre, [Vacancy Rates (Nov-21)], [Vacancy Rates (Nov-22)] INTO Provincial_Vacancy_Rate
FROM [Project]..Provincial_Data

SELECT * 
FROM Provincial_Vacancy_Rate


SELECT Centre, [Average Rent Two Bedroom ($) (New and Existing Structures) (01/1] AS Average_Rent_two_bedroom_Nov2021, 
[Average Rent Two Bedroom ($) (New and Existing Structures)(01/11] AS Average_Rent_two_bedroom_Nov2022, 
[Percentage Change of Average Rent Two Bedroom From Fixed Sample ]
INTO Provincial_Average_Rent
FROM [Project]..Provincial_Data

SELECT * 
FROM Provincial_Average_Rent

ALTER TABLE [Project]..City_Data
DROP COLUMN [Turnover rates (Nov-21)], [Turnover rates (Nov-22)]

ALTER TABLE [Project]..City_Data
DROP COLUMN [Percentage Change of Average Rent Two Bedroom From Fixed Sample1]

SELECT * 
FROM [Project]..City_Data

SELECT Centre, [Vacancy Rates (Nov-21)], [Vacancy Rates (Nov-22)] INTO City_Vacancy_Data
FROM [Project]..City_Data

SELECT * 
FROM City_Vacancy_Data


SELECT Centre, [Average Rent Two Bedroom ($) (New and Existing Structures) (01/1] AS Average_Rent_two_bedroom_Nov2021, 
[Average Rent Two Bedroom ($) (New and Existing Structures)(01/11] AS Average_Rent_two_bedroom_Nov2022, 
[Percentage Change of Average Rent Two Bedroom From Fixed Sample ]
INTO City_Average_Rent
FROM [Project]..City_Data

SELECT * 
FROM City_Average_Rent

SELECT *
FROM [Project]..City_Data


UPDATE [Project]..['Table 1']
SET Centre = SUBSTRING('Canada', 1, 6)
WHERE Centre = 'Canada CMAs'


SELECT Centre, [Vacancy Rates (Nov-21)], [Vacancy Rates (Nov-22)] INTO Canada_vacancy_Rate
FROM [Project]..['Table 1']
WHERE Centre = 'Canada'

SELECT * 
FROM Canada_vacancy_Rate


SELECT Centre, [Average Rent Two Bedroom ($) (New and Existing Structures) (01/1)], [Average Rent Two Bedroom ($) (New and Existing Structures)(01/11)], 
[Percentage Change of Average Rent Two Bedroom From Fixed Sample ] INTO Canada_Average_Rent
FROM [Project]..['Table 1']
WHERE Centre = 'Canada'


SELECT * 
FROM Canada_Average_Rent