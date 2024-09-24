<link rel="stylesheet" type="text/css" href="styles.css">
	
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

<p align="center">
<img src="https://github.com/NahyeMoon/DataAnalyticsPortfolio/blob/main/Tech%20Layoffs/layoff_overview.jpg"alt="Alt text" width="700"/>
</p>

<p align="center">
  Overview of the Dataset
</p>

## Procedure

### 1) Remove Duplicates
I created a DataFrame named layoff_staging by duplicating the original dataframe and adding a new column, row_num that tracks the number of occurrence of each row.
As you can see, the top five rows in the image below have row_num of 2, which means the dataframe contains duplicates of them.

<p align="center">
	<img src="https://github.com/NahyeMoon/DataAnalyticsPortfolio/blob/main/Tech%20Layoffs/layoff_staging.jpg" alt="Alt text" width="700"/>
</p>

<p align="center">
  layoff_staging with descending row_num
</p>
											
