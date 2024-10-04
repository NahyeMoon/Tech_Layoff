<link rel="stylesheet" type="text/css" href="style.css">	

# Global Tech Layoff Data Cleaning in SQL
<p align="center">
	<img src="https://github.com/NahyeMoon/DataAnalyticsPortfolio/blob/67eaf22920c9d0f3be1e6ed9636e3e664d7b69d0/Tech%20Layoffs/layoff.jpg" alt="Alt text" width="700"/>
</p>

<p align="center
  <a href="https://www.forbes.com/sites/richardnieva/2022/12/23/what-tech-layoffs-mean-for-2023/">Forbes</a>
</p>


## Introduction

During the pandemic, lockdowns and anti-pandemic measures triggered the Great Layoff in March and April 2020. 
This unprecedented surge in layoffs and discharges resulted in about 22 million workers losing their jobs in only two months. 
The labour force dropped dramatically and the global economy slowed down, and even in 2024, the labour force drop is only partially recovered. 
ech firms around the globe are fighting the economic slowdown and theyhave started laying employees off. 
Given the ongoing economic uncertainties and frequent layoffs in the tech industry, the relevant dataset would be an interesting topic of exploration. (<a href="https://cepr.org/voxeu/columns/layoffs-retirement-and-post-pandemic-inflation">CEPR</a>, 
<a href="https://www.kaggle.com/datasets/swaptr/layoffs-2022">Data Source</a>)
<br /><br />
In the first part of the project, a dataset that contains 2,361 tech layoffs reported was cleaned using <strong><em>SQL</strong></em> and visualziations the <strong><em>SQL</strong></em> outputs were created using <strong><em>PowerBI</strong></em>. The data was collected from the onset of the COVID-19 pandemic (March 11, 2020) to March 6th, 2023. <strong>Table 1</strong> shows top rows of the dataset, and most of the columns in the dataset represent their names while'stage' refers to the stage of funding. The meaning of the stages are explained on <a href="https://www.indeed.com/career-advice/career-development/startup-funding-stages">Indeed</a>. The SQL code for this project can be found here: <a href="https://github.com/NahyeMoon/DataAnalyticsPortfolio/blob/main/Tech%20Layoffs/Global%20Tech%20Layoff%20Cleaning.sql">SQL code</a>
<br /><br />
<p align="center">
	<strong>Table 1.</strong>Top Rows in the Dataset
	<br />
	<img src="https://github.com/NahyeMoon/DataAnalyticsPortfolio/blob/main/Tech%20Layoffs/layoff_overview.jpg"alt="Alt text" width="700"/>

</p>

<br />

## Procedure

### 1) Remove Duplicates
The dataset was copied to create a working dataframe (layoff_staging) and a new column called row_num that tracks the occurrence count of each row was added. As <strong>Table 2</strong> shows, the top five rows have a row_num of 2, indicating that there was a duplicate rows at a previous index for each of them. 

<p align="center">
	<strong>Table 2.</strong> layoff_staging with descending row_num
	<br />
	<img src="https://github.com/NahyeMoon/DataAnalyticsPortfolio/blob/main/Tech%20Layoffs/layoff_staging.jpg" alt="Alt text" width="700"/>

</p>

<br />
<br />

The duplicates from layoff_staging was removed by removing all rows with row_num of 2 and the result was verified by checking the rows for the company Casper as a reference. In <strong>Table 4</strong> (after), the row with company Casper and row_num of 2 was successfully removed from <strong>Table 3</strong> (before).

<br />

<p align="center">
	<strong>Table 3.</strong> Rows for Casper before removing duplicates
	<br />
	<img src="https://github.com/NahyeMoon/DataAnalyticsPortfolio/blob/main/Tech%20Layoffs/layoff_casper.jpg" alt="Alt text" width="700"/>	
</p>

<br />

<p align="center">
	<strong>Table 4.</strong> Rows for Casper after removing duplicates
	<br />
	<img src="https://github.com/NahyeMoon/DataAnalyticsPortfolio/blob/main/Tech%20Layoffs/layoff_casper_clean.jpg" alt="Alt text" width="700"/>
</p>

<br />

### 2) Standardization of Data

As the very first step in standardizing the data, the entries under the columns with type text were trimmed to remove any unnecessary spaces, then each column was checked if any entries require standardization.
<br /> <br />

industry: 
<br />
'Crypto', 'Crypto Currency', and 'CryptoCurrency' under column was standardized to 'Crypto' since they all represent the same industry(<strong>Table 5</strong>). None and NULL in the whole dataset, including this column, are addressed later in 3) Null Values or Blank Values</strong>.
<br />
<p align="center">
	<strong>Table 5.</strong> Entries in industry
	<br />
	<img src="https://github.com/NahyeMoon/DataAnalyticsPortfolio/blob/main/Tech%20Layoffs/layoff_industry.jpg" alt="Alt text" width="200"/>
</p>
<br />

location:
<br />
Some entries in locations contain non-alphabet characters, such as 'DÃ¼sseldorf', 'FlorianÃ³polis', and 'MalmÃ¶', which were intended to be 'Düsseldorf', 'Florianópolis', and 'Malmö', respectively. The change was made accordingly to fix the encoding issues.
<br />

country: 
'United States.' was standardized into 'United States' (<strong>Table 6</strong>).
<br />
<p align="center">
	<strong>Table 6.</strong> Entries in country
	<br />
	<img src="https://github.com/NahyeMoon/DataAnalyticsPortfolio/blob/main/Tech%20Layoffs/layoff_country.jpg" alt="Alt text" width="100"/>
</p>
<br />

date:
The column date was formatted to yyyy-mm-dd for legibility (<strong>Table 7</strong>).
<br />
<p align="center">
	<strong>Table 7.</strong> Column date Before and After the formatting
	<br />
	<img src="https://github.com/NahyeMoon/DataAnalyticsPortfolio/blob/main/Tech%20Layoffs/layoff_date.jpg" alt="Alt text" width="200"/>
</p>
<br />

stage:
The values 'Unkown' and NULL were merged to 'Unknown'.

### 3) Null Values or Blank Values

The blanks in industry was replaced to NULL whcih were filled with populated rows where possible. For example, the industry of the second rows with company Aribnb in (<strong>Table 8</strong>) is NULL. From the first row (populated row), the industry of Airbnb is Travel and the NULL is replaced with Airbnb.
<br />
<p align="center">
	<strong>Table 8</strong> Rows with company Airbnb before populating them.
	<br />
	<img src="https://github.com/NahyeMoon/DataAnalyticsPortfolio/blob/main/Tech%20Layoffs/layoff_airbnb.jpg" width="700" />
</p>

<br />
<p align="center">
	<strong>Table 9.</strong> rows with company Airbnb after populating them.<br />
	<br />
	<img src="https://github.com/NahyeMoon/DataAnalyticsPortfolio/blob/main/Tech%20Layoffs/layoff_airbnb_clean.jpg" width="700"/>
</p>
<br />



### 4) Remove Any Columns

The rows with NULLs in both total_laid_off and percentage_laid_off were removed because they do not provide meaningful information (<strong>Table 10</strong>). Finally, the column row_num was dropped because it was initially created to remove duplicate rows.

<br />
<p align="center">
	<strong>Table 10.</strong> Rows with NULLs in both total_laid_off and percentage_laid_off
	<br />
	<img src="https://github.com/NahyeMoon/DataAnalyticsPortfolio/blob/main/Tech%20Layoffs/layoff_nulls.jpg" width="700"/>
</p>
<br /><br />

## Conclusion
The global tech layoffs dataset was cleandin in SQL by: removing duplicates, standardizing entries, addressing missing values, and fixing encoding issues to create a clear, organized dataset. If available, the missing values could be filled in using other pieces of data or through research for completeness of the dataset. The cleaned dataset is now ready for exploratory data analysis (EDA), which is the <a href="https://github.com/NahyeMoon/DataAnalyticsPortfolio/blob/main/Tech%20Layoffs/Global%20Tech%20Layoff%20EDA.md">next part</a> of this project.
