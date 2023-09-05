
--- Life Expectancy project ---

-- Retrieve all data from table
SELECT * FROM `level-facility-394518.Life_expectancy.Life_Expectancy`;

-- Retrieve countries who has a life expectancy greater than 65 
SELECT * FROM `level-facility-394518.Life_expectancy.Life_Expectancy`
WHERE life_expectancy > 65;

-- Retrieve countries who has a life expectancy less than 64 
SELECT * FROM `level-facility-394518.Life_expectancy.Life_Expectancy`
WHERE life_expectancy < 64;


SELECT country
FROM `level-facility-394518.Life_expectancy.Life_Expectancy`
WHERE year = 2000
ORDER BY life_expectancy ASC
LIMIT 1;

SELECT country
FROM `level-facility-394518.Life_expectancy.Life_Expectancy`
WHERE year = 2000
ORDER BY life_expectancy DESC
LIMIT 1;

SELECT country
FROM `level-facility-394518.Life_expectancy.Life_Expectancy`
WHERE year = 2014
ORDER BY life_expectancy ASC
LIMIT 1;

SELECT country
FROM `level-facility-394518.Life_expectancy.Life_Expectancy`
WHERE year = 2014
ORDER BY life_expectancy DESC
LIMIT 1;




------- Understanding the relationship between life expectancy and economic factors 

SELECT country, GDP, life_expectancy
FROM `level-facility-394518.Life_expectancy.Life_Expectancy`
WHERE year = 2014
ORDER BY GDP DESC;

SELECT country, year, GDP, life_expectancy
FROM `level-facility-394518.Life_expectancy.Life_Expectancy`
WHERE country IN ('Sierra Leone', 'Belgium') 
AND year = 2000;

SELECT country, year, GDP, life_expectancy
FROM `level-facility-394518.Life_expectancy.Life_Expectancy`
WHERE country IN ('Sierra Leone', 'Belgium') 
AND year = 2014;

--- Retrieve country with the highest total expenditure 
SELECT * FROM `level-facility-394518.Life_expectancy.Life_Expectancy`
WHERE total_expenditure > 14


--- Which country has the highest life expectancy and GDP
SELECT country
FROM `level-facility-394518.Life_expectancy.Life_Expectancy`
ORDER BY life_expectancy DESC, GDP DESC
LIMIT 1;

--- Which country has the lowest life expectancy and GDP
SELECT country
FROM `level-facility-394518.Life_expectancy.Life_Expectancy`
ORDER BY life_expectancy, GDP
LIMIT 1;

--- GDP in comparisons to adult mortality and infant deaths when ordered by country for year 2000
SELECT country, year, GDP, adult_mortality, infant_deaths
FROM `level-facility-394518.Life_expectancy.Life_Expectancy`
WHERE country IN ('Sierra Leone', 'Belgium') 
AND year = 2000
ORDER BY country;

--- GDP in comparisons to adult mortality and infant deaths when ordered by country for year 2014
SELECT country, year, GDP, adult_mortality, infant_deaths
FROM `level-facility-394518.Life_expectancy.Life_Expectancy`
WHERE country IN ('Sierra Leone', 'Belgium') 
AND year = 2014
ORDER BY country;

--- which country had the highest life expectancy, GDP and total expenditure for year 2000
SELECT country
FROM `level-facility-394518.Life_expectancy.Life_Expectancy`
WHERE year = 2000
ORDER BY life_expectancy DESC, GDP DESC, total_expenditure DESC
LIMIT 1;

--- which country had the highest life expectancy, GDP and total expenditure for year 2014
SELECT country
FROM `level-facility-394518.Life_expectancy.Life_Expectancy`
WHERE year = 2014
ORDER BY life_expectancy DESC, GDP DESC, total_expenditure DESC
LIMIT 1;

----which country had the lowest life expectancy, GDP and total expenditure for year 2000
SELECT country
FROM `level-facility-394518.Life_expectancy.Life_Expectancy`
WHERE year = 2000
ORDER BY life_expectancy, gdp, total_expenditure
LIMIT 1;


----which country had the lowest life expectancy, GDP and total expenditure for year 2014
SELECT country
FROM `level-facility-394518.Life_expectancy.Life_Expectancy`
WHERE year = 2014
ORDER BY life_expectancy, gdp, total_expenditure
LIMIT 1;


SELECT country, year, GDP, income_composition_of_resources
FROM `level-facility-394518.Life_expectancy.Life_Expectancy`
WHERE country IN ('Sierra Leone', 'Belgium') 
AND year = 2014
ORDER BY country;


-------- The relationship between the status of a country and life expectancy 

-- Average, min and max life expectancy by status

SELECT status,AVG(life_expectancy) AS Average_life_expectancy,MIN(life_expectancy) AS Min_life_expectancy, MAX(life_expectancy) AS Max_life_expectancy
FROM `level-facility-394518.Life_expectancy.Life_Expectancy`
GROUP BY  status;


SELECT country, status, adult_mortality, infant_deaths
FROM `level-facility-394518.Life_expectancy.Life_Expectancy`
ORDER BY status, adult_mortality, infant_deaths;


SELECT country, status, percentage_expenditure
FROM `level-facility-394518.Life_expectancy.Life_Expectancy`
WHERE country IN ('Sierra Leone', 'Belgium') 
ORDER BY status, percentage_expenditure;





----------- To analyse the correlation between expenditure on healthcare and education on life expectancy 

------- total expenditure for Sierra leone in comparison to life expectancy ordered by year 2014
SELECT country, year, total_expenditure, GDP, life_expectancy
FROM `level-facility-394518.Life_expectancy.Life_Expectancy`
WHERE country = 'Sierra Leone' AND year = 2014
ORDER BY life_expectancy DESC;

------- total expenditure for Sierra leone in comparison to life expectancy ordered by year 2000
SELECT country, year, total_expenditure, GDP, life_expectancy
FROM `level-facility-394518.Life_expectancy.Life_Expectancy`
WHERE country = 'Sierra Leone' AND year = 2000
ORDER BY life_expectancy DESC;

----------- total expenditure for Belgium in comparison to life expectancy ordered by year 2000
SELECT country, year, total_expenditure, GDP, life_expectancy
FROM `level-facility-394518.Life_expectancy.Life_Expectancy`
WHERE country = 'Belgium' AND year = 2000
ORDER BY life_expectancy DESC;

----------- total expenditure for Belgium in comparison to life expectancy ordered by year 2014
SELECT country, year, total_expenditure, GDP, life_expectancy
FROM `level-facility-394518.Life_expectancy.Life_Expectancy`
WHERE country = 'Belgium' AND year = 2014
ORDER BY life_expectancy DESC;


SELECT country, year, total_expenditure,schooling, life_expectancy
FROM `level-facility-394518.Life_expectancy.Life_Expectancy`
WHERE country = 'Belgium' AND year = 2014
ORDER BY life_expectancy DESC;

SELECT country, year, GDP, income_composition_of_resources,schooling
FROM `level-facility-394518.Life_expectancy.Life_Expectancy`
WHERE country IN ('Sierra Leone', 'Belgium') 
AND year = 2014
ORDER BY country;

SELECT country, year, total_expenditure, income_composition_of_resources, schooling, life_expectancy
FROM `level-facility-394518.Life_expectancy.Life_Expectancy`
WHERE country IN ('Sierra Leone', 'Belgium') 
AND year = 2014
ORDER BY country;

SELECT country, year, total_expenditure, income_composition_of_resources, schooling, life_expectancy
FROM `level-facility-394518.Life_expectancy.Life_Expectancy`
WHERE year = 2014




----------To analyse the effects of hiv, polio and immunisations on life expectancy 

-----Total infant deaths as a total for year 2000-2014 and order by status
SELECT status, SUM(infant_deaths) AS Total_infant_deaths
FROM `level-facility-394518.Life_expectancy.Life_Expectancy`
WHERE year BETWEEN 2000 AND 2014
GROUP BY status
ORDER BY status;

SELECT status, SUM(adult_mortality) AS Total_adult_deaths
FROM `level-facility-394518.Life_expectancy.Life_Expectancy`
WHERE year BETWEEN 2000 AND 2014
GROUP BY status
ORDER BY status;

---measles death vs life expectancy sort by country of sierra leone and Belgium in the year 2000 and 2014
SELECT country, year, measles, life_expectancy
FROM `level-facility-394518.Life_expectancy.Life_Expectancy`
WHERE country IN ('Sierra Leone', 'Belgium')
AND year = 2000 
ORDER BY country, year;

SELECT country, year, measles, life_expectancy
FROM `level-facility-394518.Life_expectancy.Life_Expectancy`
WHERE country IN ('Sierra Leone', 'Belgium')
AND year = 2014
ORDER BY country, year;

----life expectancy compared with immunisation rates 
SELECT country, life_expectancy, infant_deaths, diphtheria, polio, HIV_AIDS
FROM `level-facility-394518.Life_expectancy.Life_Expectancy`
WHERE year = 2014


SELECT country, life_expectancy, infant_deaths, diphtheria, polio, HIV_AIDS
FROM `level-facility-394518.Life_expectancy.Life_Expectancy`
WHERE country IN ('Sierra Leone', 'Belgium')
AND year = 2014



SELECT country, life_expectancy, infant_deaths, adult_mortality, diphtheria, polio, HIV_AIDS
FROM `level-facility-394518.Life_expectancy.Life_Expectancy`
WHERE country IN ('Sierra Leone', 'Belgium')
AND year = 2014


SELECT country, life_expectancy, diphtheria, HIV_AIDS, polio
FROM `level-facility-394518.Life_expectancy.Life_Expectancy`
WHERE country IN ('Sierra Leone', 'Belgium')
AND year = 2014

----- The life expectancy and infant deaths of sierra leone and Belgium compared with diphtheria HIV_AIDS and polio between year 2000 to 2014
SELECT country,
AVG(life_expectancy) AS Avg_life_expectancy,
AVG(diphtheria) AS Avg_diphtheria,
AVG(HIV_AIDS) AS Avg_HIV_AIDS, AVG(polio) AS Avg_polio
FROM `level-facility-394518.Life_expectancy.Life_Expectancy`
WHERE country IN ('Sierra Leone', 'Belgium')
AND year BETWEEN 2000 AND 2014
GROUP BY country



SELECT country, year, life_expectancy, infant_deaths, diphtheria, HIV_AIDS, polio
FROM `level-facility-394518.Life_expectancy.Life_Expectancy`
WHERE country IN ('Sierra Leone', 'Belgium')
AND year BETWEEN 2000 AND 2014
