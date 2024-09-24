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
Given the ongoing economic uncertainties and frequent layoffs in the tech industry, the relevant dataset would be an interesting topic of exploration. 

<br />

In this project, I cleaned a dataset that contains 2361 tech layoffs reported from when COVID-19 was declared a pandemic (11 March 2020) to Present (20 July 2024) using SQL.  I also used Power BI to create high-resolution visualizations of the SQL outputs with enhanced aesthetics."

<br />

<p align="center">
	<img src="https://github.com/NahyeMoon/DataAnalyticsPortfolio/blob/main/Tech%20Layoffs/layoff_overview.jpg"alt="Alt text" width="700"/>
	<br />
	Overview of the Dataset
</p>

<br />

## Procedure

### 1) Remove Duplicates
I created a DataFrame named layoff_staging by duplicating the original DataFrame and adding a new column, row_num, which tracks the occurrence count of each row. As shown in the image below, the top five rows have a row_num of 2, indicating that there was a duplicate rows at a previous index for each of them. 

<p align="center">
	<img src="https://github.com/NahyeMoon/DataAnalyticsPortfolio/blob/main/Tech%20Layoffs/layoff_staging.jpg" alt="Alt text" width="700"/>
	<br />
	layoff_staging with descending row_num
</p>

<br />
<br />

I removed the duplicates from the DataFrame by removing all rows with row_num of 2 and verified that the job was done properly by checking the rows for the company Casper as a reference. You can see that the row with row_num of 2 was successfully removed.

<br />

<p align="center">
	<img src="https://github.com/NahyeMoon/DataAnalyticsPortfolio/blob/main/Tech%20Layoffs/layoff_casper.jpg" alt="Alt text" width="700"/>
	<br />
	Before: rows for the company Casper
</p>

<br />

<p align="center">
	<img src="https://github.com/NahyeMoon/DataAnalyticsPortfolio/blob/main/Tech%20Layoffs/layoff_casper_clean.jpg" alt="Alt text" width="700"/>
	<br />
	After: rows for the company Casper
</p>

<br />

### 2) Standardization of Data

As the very first step in standardizing the data, I trimmed all the entries in each string column to remove any unnecessary spaces. Then, I checked each column to see if anything could be standardized.
<br /> <br />

industry: 
<br />
I noticed that there are Crypto, Crypto Currency, and CryptoCurrency, which all represent the same industry; I standardized them to Crypto. I also noticed None and NULL but those are addressed later in the next step, 3) Null Values or Blank Values.
<br /><br />

location:
<br />
There are some locations that contain non-alphabets such as 'DÃ¼sseldorf', 'MalmÃ¶', and 'FlorianÃ³polis'. I did some research and they were 'Düsseldorf', 'Malmö', and 'Florianópolis', respectively, but encoded wrong.

