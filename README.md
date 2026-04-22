# 📢 The Data Echo

<div align="center">

[![Python](https://img.shields.io/badge/Python-3.9%2B-blue?logo=python)](https://www.python.org/)
[![PySpark](https://img.shields.io/badge/PySpark-3.5%2B-orange?logo=apachespark)](https://spark.apache.org/)
[![Pandas](https://img.shields.io/badge/Pandas-2.0%2B-purple?logo=pandas)](https://pandas.pydata.org/)
[![SQL](https://img.shields.io/badge/SQL-Advanced-lightgrey?logo=postgresql)](https://www.postgresql.org/)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT)

*From Raw Noise to Feature-Ready Signals.*

</div>

## 📖 Executive Summary

**The Data Echo** is a robust, end-to-end **ETL (Extract, Transform, Load)** pipeline designed for data profiling, deep cleaning, and feature engineering. Unlike simple data movement scripts, this project emphasizes *understanding* the data before modifying it. 

It utilizes a dual-engine approach:
- **Pandas:** For rapid prototyping and small-to-medium dataset profiling on local machines.
- **PySpark:** For scalable, distributed processing of large datasets that exceed memory limits.

The workflow follows an **ELT (Extract, Load, Transform)** philosophy for the final stage: data is cleaned, loaded into a structured SQL warehouse, and then transformed into **Feature Models** ready for analytics dashboards or Machine Learning consumption.

## ✨ Core Features

### 1. 🩺 Data Profiling Module
Before any cleaning occurs, the pipeline generates a comprehensive health report.
- **Null Analysis:** Calculates percentage of missing values per column.
- **Statistical Distribution:** Identifies skewness, kurtosis, and unique value counts.
- **Data Type Validation:** Flags mismatches (e.g., numeric columns stored as strings).
- **Output:** Console logs for quick checks or exported HTML/JSON reports (via `pandas-profiling`).

### 2. 🧹 Scalable Cleaning Engine
The project intelligently selects the appropriate engine based on data volume.
- **Pandas Engine (`src/cleaners/pandas_cleaner.py`):** Handles deduplication, string normalization, and standardizing date formats for datasets `< 2GB`.
- **PySpark Engine (`src/cleaners/spark_cleaner.py`):** Parallelizes operations like `fillna`, `dropDuplicates`, and regex string cleaning across clusters.

### 3. 🧠 ELT & Feature Modeling
Once the data is "clean echo," it's loaded into a SQL database (PostgreSQL/MySQL). The project includes a suite of SQL scripts to create **Feature Models**:
- **Aggregation Views:** Pre-calculated sums/averages grouped by time/category.
- **Behavioral Flags:** Binary columns created in SQL (e.g., `is_high_value_customer`).
- **Window Function Features:** Lag features for time-series forecasting.

## 🏗️ Architecture Diagram (ASCII)

```text
+----------------+       +-----------------------+       +-------------------------+
|   RAW DATA     |       |     DATA PROFILING    |       |    CLEANING ENGINE      |
|  (CSV / JSON /  | ----> |  - Null Ratios        | ----> |  - Python (Pandas)      |
|   Database)     |       |  - Outliers           |       |  - PySpark (Big Data)   |
+----------------+       +-----------------------+       +------------+------------+
                                                                      |
                                                                      v
+-------------------------+       +---------------------+       +---------------------+
|   FEATURE MODELS (ELT)  | <---- |   SQL WAREHOUSE     | <---- |   CLEANED DATA       |
|  - Aggregated Views     |       |  (Postgres/MySQL)   |       |  (Parquet / Tables)  |
|  - ML-Ready Features    |       +---------------------+       +---------------------+
+-------------------------+