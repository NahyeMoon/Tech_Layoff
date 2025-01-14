USE [Tech Layoff]

-- Create a copy of the working table, Table Layoff Working
-- Check for duplicate records and delete them.
-- Result: No duplicate
SELECT *
FROM [Tech Layoff]
WHERE 1 = 0

SELECT *,
ROW_NUMBER() OVER(
	PARTITION BY #, Company, Location_HQ, Region, State, Country, Continent, Laid_Off, 
	Date_layoffs, Percentage, Company_Size_before_Layoffs, Company_Size_after_layoffs, 
	Industry, Stage, Money_Raised_in__mil, Year, latitude, longitude
	ORDER BY #) AS Frequency
INTO [Tech Layoff Working]
FROM [dbo].[Tech Layoff];

DELETE
FROM [Tech Layoff Working]
WHERE Frequency > 1;

ALTER TABLE [Tech Layoff Working]
DROP COLUMN Frequency;

-------------------------------------------------------------------------------------------------------------------------
SELECT *
FROM [Tech Layoff Working]
-------------------------------------------------------------------------------------------------------------------------
-- Check distribution and quality for each column

--- # (record number)
--- Check if # is a a primary key.
--- Result: # is a primary key.
SELECT COUNT(DISTINCT #) AS [Distinct Keys],
COUNT(#) AS [Keys]
FROM [Tech Layoff Working];


--- Region
--- Result: Drop Column Region from the table since it only shows if the company is located in San Francisco Bay Area.
SELECT 
DISTINCT Region,
COUNT(*) AS [Frequency]
FROM [Tech Layoff Working]
GROUP BY Region;

ALTER TABLE [Tech Layoff Working]
DROP COLUMN Region;


--- State
--- Result: Drop Column State from the table since it only shows if the company is located in California.
SELECT
DISTINCT State,
COUNT(*) AS [Frequency]
FROM [Tech Layoff Working]
GROUP BY State;

ALTER TABLE [Tech Layoff Working]
DROP COLUMN State;


--- Location_HQ
--- No standardization needed
SELECT 
DISTINCT Location_HQ,
COUNT(*) AS [Frequency]
FROM [Tech Layoff Working]
GROUP BY Location_HQ
ORDER BY Location_HQ


--- Country
--- Result: No standardization needed
--- Top 10 countries with the most recorded cases: More than half is in the US
SELECT Country,
COUNT(*) AS [Frequency]
FROM [Tech Layoff Working]
GROUP BY Country
ORDER BY Country;

SELECT TOP 10
Country,
COUNT(*) AS [Frequency]
FROM [Tech Layoff Working]
GROUP BY Country
ORDER BY Frequency DESC;


--- Continent
--- No Standardization needed
--- More than 2/3 is in North America
SELECT
Continent,
COUNT(*) AS [Frequency]
FROM [Tech Layoff Working]
GROUP BY Continent
ORDER BY Frequency DESC;


--- Date_layoffs
--- From: 2020-03-12 to 2024-06-28
SELECT
MIN(Date_layoffs) AS [From],
MAX(Date_layoffs) AS [To]
FROM [Tech Layoff Working];


--- Year
--- Most Cases are from later stages of pandemic; Very few (the least) cases reported in 2021
SELECT
Year,
COUNT(Year) AS [Frequency]
FROM [Tech Layoff Working]
GROUP BY Year
ORDER BY Year;

--- Make sure all values in Year matches the year in Date_layoffs
SELECT
Date_layoffs,
Year
FROM [Tech Layoff Working]
WHERE YEAR(Date_layoffs) NOT IN (Year);

UPDATE [Tech Layoff Working]
SET Year = YEAR(Date_layoffs)
WHERE YEAR(Date_layoffs) NOT IN (Year);


--- Money Raised in Million
--- The column quality and distributions were checked using PowerB


--- Latitude and Longitude
--- Removed since it's not informative to the recorded layoffs already given the location, country and continent.
ALTER TABLE [Tech Layoff Working]
DROP COLUMN latitude, longitude;


--- Laid_Off, Company_Size_before_Layoffs, Company_Size_after_layoffs, Percentage
--- Missing values on based on the dataset in PowerBI where possible.


--- Industry
--- Create a new column, Sector that groups similar industries into broader categories
SELECT
DISTINCT Industry,
COUNT(*) AS [Frequency]
FROM [Tech Layoff Working]
GROUP BY Industry
ORDER BY Industry;

ALTER TABLE [Tech Layoff Working]
ADD Sector varchar(50);

UPDATE [Tech Layoff Working]
SET Sector = CASE
	WHEN Industry IN ('AI', 'Cloud', 'Data', 'IT Services', 'SaaS', 'Software Development', 'Hardware', 'Semiconductors', 'Security', 'Fintech') THEN 'Technology & IT'----
	WHEN Industry IN ('Product', 'Retail', 'e-commerce', 'Appliances', 'Food', 'Consumer') THEN 'Consumer & Retail' ---
	WHEN Industry IN ('Gaming', 'Entertainment Providers', 'e-sport',  'Social Posting Site', 'Media') THEN 'Media & Entertainment' ---
    WHEN Industry IN ('Logistics', 'Travel', 'Transportation', 'Hospitality') THEN 'Travel and Transportation' ---
    WHEN Industry IN ('Healthcare', 'Biotechnology Research', 'Fitness') THEN 'Healthcare' ---
    WHEN Industry IN ('Finance', 'Crypto', 'Insurance') THEN 'Finance & Insurannce' ----
    WHEN Industry IN ('Aerospace', 'Manufacturing', 'Motor Vehicle Manufacturing', 'Construction', 'Infrastructure') THEN 'Manufacture and Infrasturcture'----
    WHEN Industry IN ('Energy', 'Environmental Services') THEN 'Energy & Utilities' ---
    WHEN Industry IN ('Telecommunications', 'Translation and Localization') THEN 'Communication Services' ---
    WHEN Industry = 'Real Estate' THEN 'Real Estate'
    WHEN Industry IN ('Business Consulting and Services', 'HR', 'Legal', 'Marketing', 'Sales', 'Support') THEN 'Professional Services' ---
    WHEN Industry = 'Education' THEN 'Education'
    WHEN Industry IN ('Other') THEN 'Other'
    ELSE 'Uncategorized'
END;


--- Stage
--- Create a New column, Stage Group that groups Stage into three broader stages ('Early Stage', 'Growth Stage', and 'Maturity or Exit')
SELECT
DISTINCT Stage, [Stage Group],
COUNT(*) AS [Frequency]
FROM [Tech Layoff Working]
GROUP BY Stage, [Stage Group]
ORDER BY Stage

ALTER TABLE [Tech Layoff Working]
ADD [Stage Group] varchar(50);

UPDATE [Tech Layoff Working]
SET [Stage Group] = CASE 
	WHEN Stage IN ('Seed', 'Series A', 'Series B') THEN 'Early Stage'
	WHEN Stage IN ('Series C', 'Series D', 'Series E', 'Series F', 'Series G', 'Series H', 'Series I', 'Series J') THEN 'Growth Stage'
	WHEN Stage IN ('Private Equity', 'Acquired', 'Post-IPO', 'Subsidiary') THEN 'Maturity or Exit'
	WHEN Stage IN ('Unknown') THEN 'Unknown'
	ELSE 'Other'
END;


-------------------------------------------------------------------------------------------------------------------------
-- Delete records with missing information of both number and percentage laid off
DELETE FROM [Tech Layoff Working]
WHERE
	(Percentage IS NULL OR Percentage = '') AND
	(Laid_Off IS NULL OR Laid_Off = '');


--------------------------------------------------------------------------------------------------------------------------
-- Calculate the percentage of layoffs in each country
WITH TotalLayoffs AS (
    SELECT SUM(Laid_Off) AS Total
    FROM [Tech Layoff Working]
)
SELECT
    Country,
    Continent,
    SUM(Laid_Off) AS layoffs,
    (SUM(Laid_Off) * 100.0 / (SELECT Total FROM TotalLayoffs)) AS Percentage
FROM [Tech Layoff Working]
GROUP BY Country, Continent
ORDER BY SUM(Laid_Off) DESC;

-- Calculate the percentage of layoffs in each continent.
WITH TotalLayoffs AS (
    SELECT SUM(Laid_Off) AS Total
    FROM [Tech Layoff Working]
)
SELECT
    Continent,
    SUM(Laid_Off) AS layoffs,
    (SUM(Laid_Off) * 100.0 / (SELECT Total FROM TotalLayoffs)) AS Percentage
FROM [Tech Layoff Working]
GROUP BY Continent
ORDER BY SUM(Laid_Off) DESC;


-- Find the top 5 companies by the number of layoffs each year.
WITH Company_Year (Company, Industry, Country, Year, Laid_Off) AS
(
SELECT Company, Industry, Country, Year, SUM(Laid_Off)
FROM [Tech Layoff Working]
GROUP BY company, Year, Industry, Country
),
Company_Year_Rank AS
(SELECT *, 
ROW_NUMBER() OVER(PARTITION BY Year ORDER BY Laid_Off DESC) AS Ranking
FROM Company_Year
WHERE Year IS NOT NULL
)
SELECT *
FROM Company_Year_Rank
WHERE Ranking <= 5
;
