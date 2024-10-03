-- Exploratory Data Analysis

SELECT *
FROM layoffs_staging;

# maximum total_laid_off and percentage_laid_off
SELECT MAX(total_laid_off), MAX(percentage_laid_off)
FROM layoffs_staging;

# the period of the data collected
SELECT MIN(`date`), MAX(`date`)
FROM layoffs_staging;

# 6. Correlation between fund_raised_millions and 
SELECT *
FROM layoffs_staging
WHERE percentage_laid_off = 1
ORDER BY funds_raised_millions DESC;

# 2. Checking each variable
## total_laid_off histogram bins
SELECT 
  CASE 
    WHEN total_laid_off BETWEEN 0 AND 250 THEN '0-250'
    WHEN total_laid_off BETWEEN 251 AND 500 THEN '251-500'
    WHEN total_laid_off BETWEEN 501 AND 750 THEN '501-750'
    WHEN total_laid_off > 750 THEN '750+'
  END AS bin,
  COUNT(*) AS count
FROM layoffs_staging
GROUP BY bin
ORDER BY bin;

## percentage_laid_off histogram bins
SELECT 
  CASE 
    WHEN percentage_laid_off BETWEEN 0 AND 0.2 THEN '0-20%'
    WHEN percentage_laid_off > 0.2 AND percentage_laid_off <= 0.4 THEN '21-40%'
    WHEN percentage_laid_off > 0.4 AND percentage_laid_off <= 0.6 THEN '41-60%'
	WHEN percentage_laid_off > 0.6 AND percentage_laid_off <= 0.8 THEN '61-80%'
    WHEN percentage_laid_off > 0.8 THEN '81-100%'
  END AS bin,
  COUNT(*) AS count
FROM layoffs_staging
GROUP BY bin
ORDER BY bin;

## fund_raised_millions histogram bins
SELECT 
  CASE 
    WHEN funds_raised_millions BETWEEN 0 AND 250 THEN '0-250'
    WHEN funds_raised_millions > 250 AND funds_raised_millions <= 750 THEN '251-750'
    WHEN funds_raised_millions > 750 AND funds_raised_millions <= 1500 THEN '751-1500'
    WHEN funds_raised_millions > 1500 THEN '1501+'
  END AS bin,
  COUNT(*) AS count
FROM layoffs_staging
GROUP BY bin
ORDER BY bin;

# 3. top total_laid_offs in variables
## company
### top 10 table
SELECT company, industry, SUM(total_laid_off)
FROM layoffs_staging
GROUP BY company, industry
ORDER BY 3 DESC
LIMIT 10;

### company pie chart
/*
WITH RankedCompanies AS (
    SELECT 
        company, industry,
        SUM(total_laid_off) AS total_laid_off,
        ROW_NUMBER() OVER (ORDER BY SUM(total_laid_off) DESC) AS rnk
    FROM 
        layoffs_staging
    GROUP BY 
        company, industry
)
SELECT 
    CASE 
        WHEN rnk <= 10 THEN company
        ELSE 'Others'
    END AS company_group,
	CASE 
        WHEN rnk <= 10 THEN industry
        ELSE 'Others'
    END AS industry_group,
    SUM(total_laid_off) AS total_laid_off
FROM 
    RankedCompanies
GROUP BY
    CASE 
        WHEN rnk <= 10 THEN company
        ELSE 'Others' 
    END,
	CASE 
        WHEN rnk <= 10 THEN industry
		ELSE 'Others'
    END
ORDER BY 
    total_laid_off DESC;
*/

## industry
### top 10 table
SELECT industry, SUM(total_laid_off) 
FROM layoffs_staging
GROUP BY industry
ORDER BY 2 DESC;

### pie chart
WITH RankedIndustries AS (
    SELECT 
        industry, 
        SUM(total_laid_off) AS total_laid_off,
        ROW_NUMBER() OVER (ORDER BY SUM(total_laid_off) DESC) AS rnk
    FROM 
        layoffs_staging
    GROUP BY 
        industry
)
SELECT 
    CASE 
        WHEN rnk <= 10 THEN industry 
        ELSE 'Others' 
    END AS industry_group,
    SUM(total_laid_off) AS total_laid_off
FROM 
    RankedIndustries
GROUP BY 
    CASE 
        WHEN rnk <= 10 THEN industry 
        ELSE 'Others' 
    END
ORDER BY 
    total_laid_off DESC;
  
  
## country
### top 10 table
SELECT country, SUM(total_laid_off) 
FROM layoffs_staging
GROUP BY country
ORDER BY 2 DESC;

### pie chart
WITH RankedCountries AS (
    SELECT 
        country,
        SUM(total_laid_off) AS total_laid_off,
        ROW_NUMBER() OVER (ORDER BY SUM(total_laid_off) DESC) AS rnk
    FROM 
        layoffs_staging
    GROUP BY 
        country
)
SELECT 
    CASE 
        WHEN rnk <= 10 THEN country
        ELSE 'Others'
    END AS country_group,
    SUM(total_laid_off) AS total_laid_off
FROM 
    RankedCountries
GROUP BY
    CASE 
        WHEN rnk <= 10 THEN country
        ELSE 'Others' 
    END
ORDER BY 
    total_laid_off DESC;


## year
### table
SELECT YEAR(`date`), SUM(total_laid_off) 
FROM layoffs_staging
GROUP BY YEAR(`date`)
ORDER BY 2 DESC;

## stage
### table
SELECT stage, SUM(total_laid_off) 
FROM layoffs_staging
GROUP BY stage
ORDER BY 2 DESC;

### grouping Series D and beyond together
### rank stage by total_laid_off
### group stages with ranking beyond 8th as others
WITH RankedStages AS (
    SELECT 
        CASE 
			WHEN stage IN ('Series D', 'Series E', 'Series F', 'Series G', 'Series H', 'Series I', 'Series J')
			THEN 'Series D or beyond'
            ELSE stage 
        END AS stage_group,
        SUM(total_laid_off) AS total_laid_off
    FROM 
        layoffs_staging
    GROUP BY 
        CASE 
			WHEN stage IN ('Series D', 'Series E', 'Series F', 'Series G', 'Series H', 'Series I', 'Series J')
			THEN 'Series D or beyond'
            ELSE stage 
        END
),
TopStages AS (
    SELECT
        stage_group,
        total_laid_off,
        ROW_NUMBER() OVER (ORDER BY total_laid_off DESC) AS rnk
    FROM 
        RankedStages
)
SELECT 
    CASE 
        WHEN rnk <= 8 THEN stage_group
        ELSE 'Others'
    END AS stage_group,
    SUM(total_laid_off) AS total_laid_off
FROM 
    TopStages
GROUP BY 
    CASE 
        WHEN rnk <= 8 THEN stage_group
        ELSE 'Others'
    END
ORDER BY 
    total_laid_off DESC;

## date
### total_laid_off by month
SELECT SUBSTRING(`date`, 1, 7) AS `MONTH`, SUM(total_laid_off)
FROM layoffs_staging
WHERE SUBSTRING(`date`, 1, 7) IS NOT NULL
GROUP BY `MONTH`
ORDER BY 1 ASC;

### add rolling total_laid_off
WITH Rolling_Total AS
(
SELECT SUBSTRING(`date`, 1, 7) AS `MONTH`, SUM(total_laid_off) AS total_month
FROM layoffs_staging
WHERE SUBSTRING(`date`, 1, 7) IS NOT NULL
GROUP BY `MONTH`
ORDER BY 1 ASC
)
SELECT `MONTH`, total_month, SUM(total_month) OVER(ORDER BY `MONTH`) AS rolling_total
FROM Rolling_Total;

SELECT company, YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging
GROUP BY company, YEAR(`date`)
ORDER BY 3 DESC;

# Rank company in the order of the largest to smallest total_laid_off in each year
# Show top fives companies each year with columns company, years, total_laid_off and Ranking.
WITH Company_Year (company, years, total_laid_off) AS
(
SELECT company, YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging
GROUP BY company, YEAR(`date`)
),
Company_Year_Rank AS
(SELECT *, 
DENSE_RANK() OVER(PARTITION BY years ORDER BY total_laid_off DESC) AS Ranking
FROM Company_Year
WHERE years IS NOT NULL
)
SELECT *
FROM Company_Year_Rank
WHERE Ranking <= 5
;
