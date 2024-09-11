# Tech Layoffs Data Cleaning in SQL
<p align="center">
	<img src="https://github.com/NahyeMoon/DataAnalyticsPortfolio/blob/67eaf22920c9d0f3be1e6ed9636e3e664d7b69d0/Tech%20Layoffs/layoff.jpg" alt="Alt text" width="700"/>
</p>

<p align="center">
  <a href="https://www.forbes.com/sites/richardnieva/2022/12/23/what-tech-layoffs-mean-for-2023/">Forbes</a>
</p>

## Introduction

During the pandemic, lockdowns and anti-pandemic measures triggered the Great Layoff in March and April 2020. 
This unprecedented surge in layoffs and discharges resulted in about 22 million workers losing their jobs in only two months. 
The labour force dropped dramatically and the global economy slowed down, and even in 2024, the labour force drop is only partially recovered. 
ech firms around the globe are fighting the economic slowdown and theyhave started laying employees off. 
Given the ongoing economic uncertainties and frequent layoffs in the tech industry, the relevant dataset would be an interesting topic of exploration. 

<br />

In this project, I cleaned a dataset that contains 2361 tech layoffs reported from when COVID-19 was declared a pandemic (11 March 2020) to Present (20 July 2024) using SQL.

<p align="center">
<img src="https://raw.githubusercontent.com/NahyeMoon/DataAnalyticsPortfolio/main/Tech%20Layoffs/layoff_chart_overall.jpg"alt="Alt text" width="700"/>
</p>

<p align="center">
  Overview of Dataset
</p>

## Procedure

### 1) Remove Duplicates
The layoff DataFrame was duplicated into a new DataFrame named layoff_staging, which includes an additional column to track the occurrence count of each row.

```
CREATE TABLE `layoffs_staging` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
```

```
INSERT INTO layoffs_staging
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date`,
stage, country, funds_raised_millions) AS row_num
FROM layoffs;
```

<p align="center">
	<img src="https://raw.githubusercontent.com/NahyeMoon/DataAnalyticsPortfolio/main/Tech%20Layoffs/layoff_rownum2.jpg" alt="Alt text" width="700"/>
</p>


											
