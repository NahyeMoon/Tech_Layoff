<link rel="stylesheet" type="text/css" href="style.css">	

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
Given the ongoing economic uncertainties and frequent layoffs in the tech industry, the relevant dataset would be an interesting topic of exploration. ( <a href="https://cepr.org/voxeu/columns/layoffs-retirement-and-post-pandemic-inflation">CEPR</a>, 
<a href="https://www.kaggle.com/datasets/swaptr/layoffs-2022">Kaggle</a> )

<br />

In the first part of the project, I cleaned a dataset that contains 2361 tech layoffs reported from when COVID-19 was declared a pandemic (March 11th, 2020) to Present (July 20th, 2024) using SQL. I also used Power BI to create high-resolution visualizations of the SQL outputs with enhanced aesthetics.  (Data Soucre: <a href="https://www.kaggle.com/datasets/swaptr/layoffs-2022">Kaggle</a>) (See <a href="https://github.com/NahyeMoon/DataAnalyticsPortfolio/blob/main/Tech%20Layoffs/Tech%20Layoff%20Cleaning.sql">SQL code</a>)
<br /><br />
Table 1 shows top rows of the dataset. Most of the columns in the dataset represent their names, but for clarification, 'stage' refers to the stage of funding.
<br />
<br />
<p align="center">
	<img src="https://github.com/NahyeMoon/DataAnalyticsPortfolio/blob/main/Tech%20Layoffs/layoff_overview.jpg"alt="Alt text" width="700"/>
	<br />
	Table 1.Top Rows in the Dataset
</p>

<br />

## Procedure

### 1) Remove Duplicates
I created a DataFrame named layoff_staging by duplicating the original DataFrame and adding a new column, row_num, which tracks the occurrence count of each row. As Table 2 shows, the top five rows have a row_num of 2, indicating that there was a duplicate rows at a previous index for each of them. 

<p align="center">
	<img src="https://github.com/NahyeMoon/DataAnalyticsPortfolio/blob/main/Tech%20Layoffs/layoff_staging.jpg" alt="Alt text" width="700"/>
	<br />
	Table 2. layoff_staging with descending row_num
</p>

<br />
<br />

I removed the duplicates from the DataFrame by removing all rows with row_num of 2 and verified that the job was done properly by checking the rows for the company 'Casper' as a reference. You can see from Table 3(before) and Table 4(after) that the row with row_num of 2 was successfully removed.

<br />

<p align="center">
	<img src="https://github.com/NahyeMoon/DataAnalyticsPortfolio/blob/main/Tech%20Layoffs/layoff_casper.jpg" alt="Alt text" width="700"/>
	<br />
	Table 3. Rows for Casper before removing duplicates
</p>

<br />

<p align="center">
	<img src="https://github.com/NahyeMoon/DataAnalyticsPortfolio/blob/main/Tech%20Layoffs/layoff_casper_clean.jpg" alt="Alt text" width="700"/>
	<br />
	Table 4. Rows for Casper after removing duplicates
</p>

<br />

### 2) Standardization of Data

As the very first step in standardizing the data, I trimmed all the entries in each string column to remove any unnecessary spaces. Then, I checked each column to see if anything could be standardized.
<br /> <br />

industry: 
<br />
I noticed that there are 'Crypto', 'Crypto Currency', and 'CryptoCurrency', which all represent the same industry; I standardized them to 'Crypto'. I also noticed None and NULL but those are addressed later in the next step, 3) Null Values or Blank Values. Table 5 shows some entires in column industry with those entires highlighted in yellow.
<br />
<p align="center">
	<img src="https://github.com/NahyeMoon/DataAnalyticsPortfolio/blob/main/Tech%20Layoffs/layoff_industry.jpg" alt="Alt text" width="200"/>
	<br />
	Table 5. Column industry with entries that need to be fixed highlighted in yellow.
</p>
<br />

location:
<br />
There are some locations that contain non-alphabet characters, such as 'DÃ¼sseldorf', 'FlorianÃ³polis', and 'MalmÃ¶'. Upon researching, I found that they were intended to be 'Düsseldorf', 'Florianópolis', and 'Malmö', respectively, but were incorrectly encoded; I made the change to the DataFrame accoridngly.
<br />

country: 
I standardized 'United States' and 'United States.' into 'United States' (Table 6).
<br />
<p align="center">
	<img src="https://github.com/NahyeMoon/DataAnalyticsPortfolio/blob/main/Tech%20Layoffs/layoff_country.jpg" alt="Alt text" width="100"/>
	<br />
	Table 6. Column country with entries that represent United States highlgihted in yellow
</p>
<br />

date:
I formatted date to yyyy-mm-dd for legibility (Table 7).
<br />
<p align="center">
	<img src="https://github.com/NahyeMoon/DataAnalyticsPortfolio/blob/main/Tech%20Layoffs/layoff_date.jpg" alt="Alt text" width="200"/>
	<br />
	Table 7. Column date Before and After the formatting
</p>
<br />

### 3) Null Values or Blank Values

I replaced blanks in industry to NULL, updated NULLs with populated rows. For example, there are two rows with company 'Airbnb' in the DataFrame but the industry of the one of them is NULL (Table 8). From the other row (populated row), I knew that industry of 'Airbnb' is Travel and I replaced NULL with 'Airbnb' (Table 9).
<br />
<p align="center">
	<img src="https://github.com/NahyeMoon/DataAnalyticsPortfolio/blob/main/Tech%20Layoffs/layoff_airbnb.jpg" width="700" />
	<br />
	Table 8. Rows with company Airbnb before populating them.
</p>

<br />
<p align="center">
	<img src="https://github.com/NahyeMoon/DataAnalyticsPortfolio/blob/main/Tech%20Layoffs/layoff_airbnb_clean.jpg" width="700"/>
	<br />
	Table 9. rows with company Airbnb after populating them.
</p>
<br />



### 4) Remove Any Columns

I removed rows with NULLs in both total_laid_off and percentage_laid_off because the rows do not give any information about the lay off (Table 10). Finally, I dropped the column row_num because it was initially to help remove duplicate rows.

<br />
<p align="center">
	<img src="https://github.com/NahyeMoon/DataAnalyticsPortfolio/blob/main/Tech%20Layoffs/layoff_nulls.jpg" width="700"/>
	<br />
	Table 10. Rows with NULLs in both total_laid_off and percentage_laid_off
</p>
<br /><br />

## Conclusion
Cleaning the tech layoffs dataset was crucial to making the data reliable and easy to use. I removed duplicates, standardized entries, addressed missing values, and fixed encoding issues to create a clear, organized dataset. The data can be further transformed by filling in the missing total_laid_off and percentage_laid_off values from another dataset.
The cleaned dataset is now ready for exploratory data analysis (EDA), which is the next phase of this project. <a href="https://github.com/NahyeMoon/DataAnalyticsPortfolio/blob/main/Tech%20Layoffs/Tech%20Layoff%20EDA.md">Tech Layoff EDA.md </a>
