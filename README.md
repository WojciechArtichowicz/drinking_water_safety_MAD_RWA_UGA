# Uganda, Rwanda and Madagascar water sources data analysis

This project was the data analysis and visualization part for paper [Drinking water safety evaluation in the selected sub-Saharan African countries: Case Study of Madagascar, Uganda, and Rwanda](https://doi.org/10.1016/j.scitotenv.2024.174496).

## In case the notebook rendering is not valid, please use [nbviewer](https://nbviewer.org/:)
 - [chemical_data1.ipynb](https://nbviewer.org/github/WojciechArtichowicz/drinking_water_safety_MAD_RWA_UGA/blob/main/chemical_data1.ipynb)
 - [chemical_data2.ipynb](https://nbviewer.org/github/WojciechArtichowicz/drinking_water_safety_MAD_RWA_UGA/blob/main/chemical_data2.ipynb)
 - [chemical_data3.ipynb](https://nbviewer.org/github/WojciechArtichowicz/drinking_water_safety_MAD_RWA_UGA/blob/main/chemical_data3.ipynb)
 - [geo_data.ipynb](https://nbviewer.org/github/WojciechArtichowicz/drinking_water_safety_MAD_RWA_UGA/blob/main/geo_data.ipynb)
 - [population_data.ipynb](https://nbviewer.org/github/WojciechArtichowicz/drinking_water_safety_MAD_RWA_UGA/blob/main/population_data.ipynb)

## 1. Preparation of the water quality data
Water quality data is an original data collected by Małgorzata Szopińska. Due to the copyrights **it is not included in the repository.** The file is empty.

Data was obtained in the form of an MS Excel file and was transformed to a long data format `data/chemical_data.xlsx`

The analysis of the chemical data is given in three parts:
 - [chemical_data1.ipynb](chemical_data1.ipynb) - general part of the analysis of the chemical data is given in this file,
 - [chemical_data2.ipynb](chemical_data2.ipynb) - the extended analysis (PCA, $Na^+$ vs. $Cl^-$ regression and correlation, Kendall $\tau$ correlation analysis, etc.),
 - [chemical_data3.ipynb](chemical_data3.ipynb) - computation of water quality index and its analysis

## 2. Obtaining and preparing geographical data
One of the parts of the project was gathering geographical data for region visualization of Uganda, Rwanda and Madagascar. The data was obtained in shp format, and exported to csv files using WKT format with QGIS software. Then it was processed using R. Original data sources:
 - [Madagascar administrative boundaries (CC0; source: The Humanitarian Data Exchange)](https://data.humdata.org/dataset/26fa506b-0727-4d9d-a590-d2abee21ee22/resource/ed94d52e-349e-41be-80cb-62dc0435bd34)
 - [Rwanda administrative boundaries (CC4.0; source: The World Bank Data Catalog)](https://datacatalog.worldbank.org/search/dataset/0041453/Rwanda-Admin-Boundaries-and-Villages)
 - [Uganda administrative boundaries (CC0; source data.world)](https://data.world/ocha-rosea/6d6d1495-196b-49d0-86b9-dc9022cde8e7)

Detailed information and dataset preparation is given in the file [geo_data.ipynb](geo_data.ipynb)

## 3. Obtaining and preparing population data
The population data was obtained from the following sources:
 - [National Institute of Statistics of Rwanda](https://www.statistics.gov.rw/) - direct data link: [May 2023 KEY TRENDS: 5th Rwanda Population and Housing Census PHC - Kinyarwanda](https://www.statistics.gov.rw/publication/key-trends-5th-rwanda-population-and-housing-census-phc-kinyarwanda)
 - [Uganda Bureau of Statistics](https://www.ubos.org/) - direct data link: [Census data and projections](https://www.ubos.org/wp-content/uploads/statistics/Census_Population_counts_(2002_and_2014)_by_Region,_District_and_Mid-Year_Population_projections_(2015-2021).xlsx)
 - [INSTAT Madagascar](https://www.instat.mg/); also data can be found at [citypopulation](http://www.citypopulation.de/en/madagascar/admin/)

The analysis of the population data is given in the file [population_data.ipynb](population_data.ipynb).



