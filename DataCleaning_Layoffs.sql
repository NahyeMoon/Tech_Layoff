-- 1. Remove Duplicates

SELECT *
FROM layoffs;

# Make a copy of the table to work on and add an extra column to keep track of the number of appearance.
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

SELECT *
FROM layoffs_staging;

INSERT INTO layoffs_staging
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date`,
stage, country, funds_raised_millions) AS row_num
FROM layoffs;

# Pick an example of a duplicate as reference
SELECT *
FROM layoffs_staging
WHERE company = 'Casper';

SELECT *
FROM layoffs_staging
WHERE row_num > 1;

# Delete duplicates
DELETE
FROM layoffs_staging
WHERE row_num > 1;

SELECT *
FROM layoffs_staging;

SELECT COUNT(*)
FROM layoffs_staging;
SELECT COUNT(*)
FROM layoffs;

# Making sure I kept one row from a duplicate without deleting them all.
SELECT *
FROM layoffs_staging
WHERE company = 'Casper';


-- 2. Standardizing data

SELECT *
FROM layoffs_staging;

UPDATE layoffs_staging
SET company = TRIM(company);

# Check each column and standardize if necessary.
SELECT DISTINCT industry
FROM layoffs_staging
ORDER BY 1;

SELECT *
FROM layoffs_staging
WHERE industry LIKE 'Crypto%';

UPDATE layoffs_staging
SET industry = 'Crypto'
WHERE industry LIKE 'Crypto%';

SELECT DISTINCT location
FROM layoffs_staging
ORDER BY 1;

SELECT DISTINCT country
FROM layoffs_staging
ORDER BY 1;

UPDATE layoffs_staging
SET country = TRIM(TRAILING '.' FROM country)
WHERE country LIKE 'United States%';

UPDATE layoffs_staging
SET `date` = STR_TO_DATE(`date`, '%m/%d/%Y');

ALTER TABLE layoffs_staging
MODIFY COLUMN `date` DATE;

SELECT *
FROM layoffs_staging;


-- 3. Null Values or Blank Values

SELECT *
FROM layoffs_staging
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

# Replacing Balnk with Null in industry
SELECT *
FROM layoffs_staging
WHERE industry IS NULL 
OR industry = '';

UPDATE layoffs_staging
SET industry = NULL
WHERE industry = '';

# Update Nulls in Industry with populated rows.
SELECT *
FROM layoffs_staging AS t1
JOIN layoffs_staging AS t2
	ON t1.company = t2.company
    AND t1.location = t2.location
WHERE t1.industry IS NULL
AND t2.industry IS NOT NULL;

UPDATE layoffs_staging AS t1
JOIN layoffs_staging AS t2
	ON t1.company = t2.company
    AND t1.location = t2.location
SET t1.industry = t2.industry
WHERE t1.industry IS NULL
AND t2.industry IS NOT NULL;


-- 4. Remove Any Columns

# Remove data with Nulls in both total_laid_off and percentage_laid_off.
SELECT *
FROM layoffs_staging
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

DELETE
FROM layoffs_staging
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

SELECT *
FROM layoffs_staging;

ALTER TABLE layoffs_staging
DROP COLUMN row_num;

