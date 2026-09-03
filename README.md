updated
# Spotify Business Analysis

## Project Status

**Work in Progress | Day 1 to Day 2**

This project is currently in the early stages of development. The current focus is on business understanding, project setup, data loading, and data cleaning.

Further analysis will be added progressively as the project develops.

## Project Overview

This project analyzes Spotify track, artist, album, genre, and release information to identify factors associated with track popularity.

The analysis aims to translate patterns in the data into practical insights that may support music release, artist, and content strategy decisions.

## Business Problem

The objective of this analysis is to identify the factors associated with track popularity and translate the findings into practical insights for music release and content strategy.

Using Spotify track, artist, album, genre, and release information, the analysis will examine which characteristics are associated with stronger track popularity and how these patterns may support data informed decisions.

## Business Goal

To identify measurable characteristics associated with higher track popularity and develop evidence based recommendations for artists, labels, and music strategy teams.

## Current Project Stage

### Day 1: Business Understanding and Project Setup

Current work includes:

1. Defining the business problem
2. Defining the business goal
3. Establishing research objectives
4. Developing research questions
5. Developing statistical hypotheses
6. Setting up the project repository and environment

### Day 2: Data Loading and Data Cleaning

Current work includes:

1. Loading the Spotify datasets
2. Inspecting the dataset structure
3. Reviewing column names and data types
4. Checking missing values
5. Checking duplicate records
6. Cleaning and preparing the data
7. Creating analysis ready datasets

## Current Repository Structure

```text
Week_7_Project/
│
├── data/
│   ├── raw/
│   └── clean/
│
├── figures/
│
├── notebooks/
│   ├── 00_business_background.ipynb
│   ├── 01_data_loading.ipynb
│   └── 02_data_cleaning.ipynb
│
├── src/
│
├── .gitignore
├── config.yaml
├── pyproject.toml
├── README.md
└── uv.lock
```

## Current Notebooks

### 00 Business Background

Defines the business problem, business goal, research objectives, research questions, and hypotheses.

### 01 Data Loading

Loads and inspects the Spotify datasets before data cleaning and analysis.

### 02 Data Cleaning

Cleans and prepares the Spotify data for the next stage of the project.

## Next Stage

The next stage of the project will focus on exploratory data analysis.

Additional statistical analysis, hypothesis testing, SQL analysis, Tableau visualization, and business recommendations will be developed in later stages of the project.

---

**Status: Work in Progress**
spotify_team_sync/
│
├── README.md
├── .gitignore
├── config.yaml
├── pyproject.toml
├── uv.lock
│
├── data/
│   ├── raw/
│   │   ├── spotify_data_clean.csv
│   │   └── track_data_final.csv
│   │
│   ├── clean/
│   │   ├── spotify_final.csv
│   │   ├── spotify_features.csv
│   │   └── spotify_mysql.csv
│   │
│   └── tableau/
│       ├── spotify_tableau_final.csv
│       ├── spotify_model_performance.csv
│       └── spotify_feature_importance.csv
│
├── notebooks/
│   ├── 00_business_background.ipynb
│   ├── 01_data_loading.ipynb
│   ├── 02_data_cleaning.ipynb
│   ├── 03_exploratory_analysis.ipynb
│   ├── 04_business_analysis.ipynb
│   ├── 05_feature_engineering.ipynb
│   ├── 06_machine_learning.ipynb
│   └── 08_visualization.ipynb
│
├── sql_scripts/
│   └── spotify_analysis.sql
│
├── tableau/
│   └── spotify_analysis.twbx
│
└── src/
    └── __init__.py
spotify_team_sync/
│
├── README.md
├── .gitignore
├── config.yaml
├── pyproject.toml
├── uv.lock
│
├── data/
│   ├── raw/
│   │   ├── spotify_data_clean.csv
│   │   └── track_data_final.csv
│   │
│   ├── clean/
│   │   ├── spotify_final.csv
│   │   ├── spotify_features.csv
│   │   └── spotify_mysql.csv
│   │
│   └── tableau/
│       ├── spotify_tableau_final.csv
│       ├── spotify_model_performance.csv
│       └── spotify_feature_importance.csv
│
├── notebooks/
│   ├── 00_business_background.ipynb
│   ├── 01_data_loading.ipynb
│   ├── 02_data_cleaning.ipynb
│   ├── 03_exploratory_analysis.ipynb
│   ├── 04_business_analysis.ipynb
│   ├── 05_feature_engineering.ipynb
│   ├── 06_machine_learning.ipynb
│   └── 08_visualization.ipynb
│
├── sql_scripts/
│   └── spotify_analysis.sql
│
├── tableau/
│   └── spotify_analysis.twbx
│
└── src/
    └── __init__.py
