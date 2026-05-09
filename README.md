# US Malaria Surveillance — Exploratory Data Analysis
### State and County-Level Distribution | 2016 vs. 2017

*Data Analytics Portfolio Project · Python · Power BI · Epidemiological Surveillance*

---

## Overview

Malaria cases reported in the United States are almost exclusively travel-associated, making their geographic distribution a reflection of international travel patterns, access to healthcare, and diagnostic infrastructure. This project uses CDC county-level surveillance data to identify which states and counties reported the highest malaria burden in 2016 and 2017, and quantifies year-over-year changes in reported cases.

Python was used for data cleaning, aggregation, and exploratory analysis. Power BI was used to build an interactive dashboard for geographic visualization and dynamic filtering.

---

## Objectives

1. Identify states and counties with the highest reported malaria burden in 2016 and 2017
2. Compare disease distribution between both years at state and county level
3. Quantify absolute and relative year-over-year changes to detect emerging trends
4. Flag data quality considerations across years
5. Deliver an interactive dashboard for exploratory surveillance analysis

---

## Tools & Stack

| Layer | Tool |
|---|---|
| Data cleaning & analysis | Python (pandas, matplotlib, numpy) |
| Notebook environment | Jupyter Notebook / Google Colab |
| Interactive visualization | Power BI |

---

## Data Source

**Centers for Disease Control and Prevention (CDC)** — Number of Reported Malaria Cases by County, United States (2016 & 2017)

---

## Key Insights

| # | Finding |
|---|---|
| 1 | **Concentrated burden:** A small number of states account for the vast majority of U.S. malaria cases, clustering around major urban international travel hubs. New York leads with 292 cases in 2016 and 280 in 2017. |
| 2 | **Stable national total:** Total reported cases remained similar across both years (2016: ~1,093 / 2017: ~1,078), suggesting stable surveillance rather than an emerging outbreak. |
| 3 | **Year-over-year shifts:** Absolute and relative change analysis reveals that states with growing burden are not always the highest-volume states, relative increases in smaller states may signal emerging clusters or improved reporting. |
| 4 | **County-level concentration:** Within high-burden states, cases are further concentrated in specific counties, consistent with urban centers serving as major international travel hubs with greater access to diagnostic services. |
| 5 | **Data coverage gaps:** Not all states appear in both years, limiting direct year-over-year comparisons. Analysis was restricted to common states to ensure comparability. |
| 6 | **Travel-associated context:** U.S. malaria cases are almost exclusively imported. Geographic patterns reflect international travel routes, access to diagnostic services, and healthcare-seeking behavior rather than local transmission. |

---

## Dashboard Preview

![US Malaria Dashboard](images/malaria_dashboard.png)
*Figure 1. Interactive Power BI dashboard showing malaria case distribution across U.S. states (2016–2017).*

---

## Analytical Approach

- Loaded and standardized raw CDC CSV datasets (2016 and 2017);
- Renamed and unified case columns; added year identifier;
- Combined datasets into a single long-format table for analysis;
- Performed data quality checks: identified states present in only one year;
- Aggregated cases at state and county level for both years;
- Calculated absolute and relative year-over-year change;
- Filtered analysis to states present in both years for valid comparisons;
- Exported clean wide and long-format datasets for Power BI dashboard development.

---

## Notebook

[View the full Python analysis →](notebooks/malaria_analysis.ipynb)

---

## Author

**Dr. Maria Julia Judson, DVM, MSc**  
Wildlife Veterinarian · Data Analyst · PhD Student in Health Technology

*Open to data analytics roles in public health, epidemiology, biotech, and health technology.*
