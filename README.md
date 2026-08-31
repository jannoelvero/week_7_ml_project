# Spotify Track Popularity Analytics

## Project Overview

Spotify Track Popularity Analytics is an end to end data analytics project that investigates the factors associated with track popularity.

The project combines **Python, MySQL, relational database design, SQL, and Tableau** to transform raw Spotify data into business focused insights and an interactive analytics dashboard.

The central analytical question is:

> **What factors are associated with track popularity on Spotify?**

The analysis examines artist popularity, artist followers, explicit content, track duration, album characteristics, genres, release periods, artist performance, and individual track performance.

---

## Project Workflow

```text
Raw Spotify Data
        ↓
Python Data Inspection
        ↓
Data Cleaning and Transformation
        ↓
Exploratory Data Analysis
        ↓
Research Questions
        ↓
MySQL Database
        ↓
SQL Analysis and Validation
        ↓
Database Normalization
        ↓
Entity Relationship Diagram
        ↓
Tableau Dashboard
        ↓
Business Insights
```

---

## Technology Stack

| Technology | Purpose |
| --- | --- |
| Python | Data cleaning, transformation, EDA, and statistical analysis |
| Pandas | Data manipulation and aggregation |
| NumPy | Numerical operations |
| Matplotlib | Data visualization |
| Seaborn | Exploratory visualization |
| Jupyter Notebook | Interactive Python analysis |
| MySQL | Data storage and SQL analysis |
| MySQL Workbench | Database management and ERD development |
| SQLAlchemy | Python to MySQL integration |
| PyMySQL | MySQL database driver |
| Tableau Desktop | Dashboard development |
| Git | Local version control |
| GitHub | Repository and portfolio documentation |
| uv | Python dependency and environment management |

---

# Dataset

The source data contains Spotify track, artist, and album information.

Important variables include:

```text
track_id
track_name
track_number
track_popularity
track_duration_ms
explicit
artist_name
artist_popularity
artist_followers
artist_genres
album_id
album_name
album_release_date
album_total_tracks
album_type
```

After data cleaning and validation, the final analytical dataset contained:

**8,775 tracks**

Additional analytical fields were created, including:

```text
track_duration_min
release_year
```

---

# Data Cleaning and Preparation

Python and Pandas were used to inspect, clean, transform, and validate the source data.

The cleaning workflow included:

1. Inspecting dataset dimensions and column structures
2. Reviewing data types
3. Identifying missing values
4. Investigating duplicate records
5. Validating track and album identifiers
6. Standardizing analytical columns
7. Converting track duration from milliseconds to minutes
8. Validating release dates
9. Creating release year
10. Cleaning artist and genre information
11. Checking popularity measures
12. Preparing the final dataset for MySQL and Tableau

Missing information was not automatically replaced with invented values. Where source information was genuinely unavailable, null values were retained when appropriate.

---

# Exploratory Data Analysis

Exploratory Data Analysis was conducted before developing the final business conclusions.

The analysis examined:

* Track popularity
* Artist popularity
* Artist followers
* Explicit content
* Track duration
* Album type
* Album size
* Artist genres
* Release periods
* Artist performance
* Individual track performance

The exploratory analysis was then structured into ten research questions.

---

# Research Questions and Results

## RQ1: Artist Popularity vs Track Popularity

**Question**

Is artist popularity associated with track popularity?

**Result**

Correlation:

**r = 0.45**

**Finding**

Artist popularity shows a moderate positive relationship with track popularity.

Tracks from more popular artists tend to have higher popularity scores, although artist popularity alone does not explain track performance.

---

## RQ2: Artist Followers vs Track Popularity

**Question**

Is artist follower count associated with track popularity?

**Result**

Correlation:

**r = 0.23**

**Finding**

Artist followers show a weak positive relationship with track popularity.

The comparison between RQ1 and RQ2 suggests that artist popularity is more strongly associated with individual track popularity than raw follower count.

| Variable | Correlation with Track Popularity |
| --- | ---: |
| Artist Popularity | 0.45 |
| Artist Followers | 0.23 |

---

## RQ3: Explicit Content vs Track Popularity

**Question**

Do explicit and non explicit tracks differ in average popularity?

| Content Type | Track Count | Average Popularity |
| --- | ---: | ---: |
| Non Explicit | 6,584 | 50.49 |
| Explicit | 2,191 | 57.54 |

**Finding**

Explicit tracks recorded approximately **7.05 points higher average popularity** than non explicit tracks in this dataset.

This represents an association and should not be interpreted as evidence that explicit content causes higher popularity.

---

## RQ4: Track Duration vs Popularity

Tracks were grouped into four duration categories.

| Duration Group | Track Count | Average Popularity |
| --- | ---: | ---: |
| Short | 434 | 38.38 |
| Standard | 6,146 | 52.61 |
| Long | 2,026 | 54.53 |
| Very Long | 169 | 47.53 |

**Finding**

Long tracks recorded the highest average popularity at **54.53**.

Short tracks showed substantially lower average popularity at **38.38**.

---

## RQ5: Album Type vs Track Popularity

| Album Type | Average Popularity |
| --- | ---: |
| Album | 55.53 |
| Single | 46.11 |
| Compilation | 40.51 |

**Finding**

Tracks classified as part of albums recorded the highest average popularity.

Compilation tracks showed the lowest average popularity.

---

## RQ6: Album Size vs Track Popularity

Albums were grouped according to their number of tracks.

| Album Size | Average Popularity |
| --- | ---: |
| Small | 46.01 |
| Medium | 56.34 |
| Large | 56.15 |
| Very Large | 47.09 |

**Finding**

Medium and large releases recorded the highest average track popularity.

Very small and very large releases performed lower on average.

---

## RQ7: Genre Performance

Artist genre information required additional transformation because individual artists may be associated with multiple genres.

The normalized SQL database produced:

**424 unique genres**

and:

**7,660 track to genre relationships**

To reduce distortion from genres represented by very few observations, the main ranking required at least **30 track records per genre**.

| Genre | Track Count | Average Popularity |
| --- | ---: | ---: |
| Trap Latino | 64 | 73.53 |
| Urbano Latino | 74 | 73.05 |
| Reggaeton | 86 | 71.26 |
| Post Grunge | 36 | 69.78 |
| Indie | 54 | 68.74 |
| Gangster Rap | 33 | 68.09 |
| Latin | 98 | 67.47 |
| West Coast Hip Hop | 40 | 66.78 |
| Hyperpop | 34 | 66.35 |
| K Pop | 93 | 66.17 |

**Finding**

Latin oriented genres were strongly represented among the highest popularity categories.

Trap Latino recorded the highest average popularity among genres meeting the minimum observation requirement.

---

## RQ8: Release Decade vs Track Popularity

| Decade | Track Count | Average Popularity | Median Popularity |
| --- | ---: | ---: | ---: |
| 1950 | 7 | 53.57 | 58.0 |
| 1960 | 50 | 52.66 | 57.5 |
| 1970 | 80 | 63.70 | 72.0 |
| 1980 | 100 | 59.68 | 64.0 |
| 1990 | 406 | 51.05 | 58.0 |
| 2000 | 937 | 53.09 | 57.0 |
| 2010 | 3,827 | 51.96 | 58.0 |
| 2020 | 3,368 | 51.99 | 57.0 |

The 1950s were excluded from the main Tableau comparison because only seven tracks were represented.

**Finding**

Among sufficiently represented decades, tracks from the 1970s recorded the highest average popularity.

The dataset is heavily concentrated in the 2010s and 2020s, so comparisons between decades should be interpreted with consideration of unequal sample sizes.

---

## RQ9: Top Performing Artists

Artists were required to have at least **five tracks** in the dataset before being included in the ranking.

| Artist | Track Count | Average Popularity |
| --- | ---: | ---: |
| Alex Warren | 5 | 83.40 |
| Red Hot Chili Peppers | 9 | 80.89 |
| Arctic Monkeys | 10 | 79.80 |
| sombr | 15 | 79.67 |
| Benson Boone | 7 | 79.00 |
| Sabrina Carpenter | 37 | 77.95 |
| XXXTENTACION | 8 | 77.75 |
| Gracie Abrams | 8 | 76.38 |
| Tame Impala | 13 | 75.00 |
| Lola Young | 8 | 74.75 |

**Finding**

Alex Warren recorded the highest average track popularity among artists meeting the minimum five track requirement.

The threshold prevents artists represented by only one unusually popular track from dominating the ranking.

---

## RQ10: Top Tracks

Individual tracks were ranked according to track popularity.

| Track | Artist | Popularity | Release Year |
| --- | --- | ---: | ---: |
| The Fate of Ophelia | Taylor Swift | 100 | 2025 |
| Golden | HUNTR/X | 99 | 2025 |
| Opalite | Taylor Swift | 97 | 2025 |
| Man I Need | Olivia Dean | 95 | 2025 |
| Elizabeth Taylor | Taylor Swift | 95 | 2025 |
| BIRDS OF A FEATHER | Billie Eilish | 94 | 2024 |
| Soda Pop | Saja Boys | 94 | 2025 |
| Father Figure | Taylor Swift | 94 | 2025 |
| CANCELLED! | Taylor Swift | 93 | 2025 |
| Actually Romantic | Taylor Swift | 93 | 2025 |

**Finding**

Recent releases dominate the highest popularity rankings in the dataset.

Taylor Swift is particularly prominent among the highest ranked individual tracks.

---

# MySQL Database

After Python cleaning and transformation, the final analytical data was loaded into MySQL.

The primary analytical and staging table is:

```text
spotify_tracks
```

The table contains:

**8,775 records**

SQL was used to validate the Python analysis and reproduce the main business queries.

---

# Database Normalization

The analytical table is convenient for analysis but contains repeated artist, album, and genre information.

The database was therefore normalized into five core relational tables:

```text
artists
albums
tracks
genres
track_genres
```

The original `spotify_tracks` table was retained as the analytical and staging table.

---

## Relational Structure

### Artists

Stores unique artist information.

```text
artist_id
artist_name
artist_popularity
artist_followers
```

### Albums

Stores album information.

```text
album_id
album_name
album_release_date
release_year
album_total_tracks
album_type
artist_id
```

### Tracks

Stores track level information.

```text
track_id
track_name
track_number
track_popularity
explicit
track_duration_min
album_id
artist_id
```

### Genres

Stores unique genre categories.

```text
genre_id
genre_name
```

### Track Genres

Acts as the junction table between tracks and genres.

```text
track_id
genre_id
```

The junction table contains:

**7,660 track to genre relationships**

Relational integrity checks returned:

```text
Missing Track Relationships: 0
Missing Genre Relationships: 0
```

Two track records retained null artist relationships because artist information was unavailable in the source data rather than artificially assigning an artist.

---

# Entity Relationship Diagram

The final normalized ERD contains five core entities:

```text
ARTISTS
   |
   | one to many
   ↓
ALBUMS
   |
   | one to many
   ↓
TRACKS
   |
   | one to many
   ↓
TRACK_GENRES
   |
   | many to one
   ↓
GENRES
```

Artists also have a direct relationship with tracks.

The ERD was generated using MySQL Workbench through database reverse engineering.

The `spotify_tracks` staging table remains in MySQL but was intentionally excluded from the final normalized ERD.

> Add the exported ERD image here after saving it to the `figures` directory.

```markdown
![Spotify ERD](figures/spotify_erd.png)
```

---

# SQL Analysis

SQL was used as a second analytical layer to validate the findings produced in Python.

The SQL analysis covered:

1. Artist popularity and track popularity
2. Artist followers and track popularity
3. Explicit content
4. Track duration
5. Album type
6. Album size
7. Genre performance
8. Release decade
9. Top performing artists
10. Top performing tracks

Using both Python and SQL provided additional validation of the analytical results.

---

# Tableau Dashboard

The final visualization layer was developed in Tableau Desktop using the MySQL database.

The primary Tableau analytical source is:

```text
spotify_tracks
```

A second relational data source was created specifically for genre analysis:

```text
tracks
    ↓
track_genres
    ↓
genres
```

This prevents the many to many genre relationships from unnecessarily duplicating records in the primary analytical source.

---

## Dashboard KPIs

The dashboard contains four headline KPIs:

| KPI | Value |
| --- | ---: |
| Total Tracks | 8,775 |
| Total Artists | 2,546 |
| Average Track Popularity | 52.25 |
| Total Albums | 5,314 |

---

## Dashboard Visualizations

The dashboard includes visualizations for all ten research questions.

### RQ1

Artist Popularity vs Track Popularity

Scatter plot with linear trend line.

### RQ2

Artist Followers vs Track Popularity

Scatter plot with linear trend line.

### RQ3

Explicit vs Non Explicit Track Popularity

Bar chart comparing average popularity.

### RQ4

Track Duration vs Popularity

Ordered as:

```text
Short
Standard
Long
Very Long
```

### RQ5

Album Type vs Popularity

Bar chart comparing average popularity across album types.

### RQ6

Album Size vs Popularity

Ordered as:

```text
Small
Medium
Large
Very Large
```

### RQ7

Top Genres by Average Track Popularity

Genre ranking with a minimum 30 track requirement.

### RQ8

Average Track Popularity by Release Decade

The 1950s were excluded from the primary visualization because of insufficient representation.

### RQ9

Top Artists by Average Track Popularity

Artists required at least five tracks.

### RQ10

Top Tracks by Popularity

Track popularity uses the maximum popularity measure rather than summing popularity values.

> Add the final Tableau dashboard screenshot here after saving it to the `figures` directory.

```markdown
![Spotify Analytics Dashboard](figures/spotify_dashboard.png)
```

---

# Key Business Insights

## Artist Popularity Is More Informative Than Follower Count

Artist popularity has a moderate relationship with track popularity at **0.45**, compared with only **0.23** for artist followers.

Follower count alone therefore provides limited information about the performance of an individual track.

## Explicit Tracks Show Higher Average Popularity

Explicit tracks recorded an average popularity of **57.54**, compared with **50.49** for non explicit tracks.

## Track Duration Shows Performance Differences

Long tracks recorded the highest average popularity at **54.53**.

Short tracks recorded substantially lower average popularity at **38.38**.

## Release Structure Matters

Tracks associated with albums recorded higher average popularity than singles and compilations.

Medium and large albums also showed stronger average track popularity than small and very large releases.

## Genre Performance Varies Considerably

Trap Latino, Urbano Latino, and Reggaeton were among the strongest genres by average track popularity after applying the minimum observation threshold.

## Historical Performance Is Not Linear

The 1970s recorded the highest average popularity among sufficiently represented decades.

However, the dataset contains considerably more tracks from recent decades, which should be considered when interpreting historical comparisons.

---

# Business Applications

The findings could support analytical work involving:

* Music catalog performance
* Artist benchmarking
* Release strategy
* Genre portfolio analysis
* Content performance monitoring
* Playlist strategy
* Marketing prioritization
* Music discovery analysis

The results represent associations within the analyzed dataset and should not be interpreted as proof of causal relationships.

---

# Repository Structure

```text
spotify_project/
│
├── data/
│   ├── raw/
│   └── clean/
│
├── figures/
│
├── notebooks/
│
├── sql_scripts/
│
├── src/
│   └── __init__.py
│
├── .gitignore
├── config.yaml
├── pyproject.toml
├── README.md
├── spotify_project.twb
└── uv.lock
```

Local development directories and the Python virtual environment are intentionally excluded from version control.

---

# Project Setup

## 1. Clone the Repository

```bash
git clone YOUR_REPOSITORY_URL
cd spotify_project
```

## 2. Install Dependencies

The project uses `uv` for Python environment and dependency management.

```bash
uv sync
```

This installs the dependencies defined in:

```text
pyproject.toml
```

using the resolved versions stored in:

```text
uv.lock
```

## 3. Activate the Environment

On macOS or Linux:

```bash
source .venv/bin/activate
```

## 4. Launch Jupyter

```bash
jupyter lab
```

The notebooks can then be opened from the `notebooks` directory.

---

# Database Configuration

Project configuration is stored in:

```text
config.yaml
```

The MySQL configuration uses:

```text
Host: 127.0.0.1
Port: 3306
Database: spotify_db
```

Database passwords and other credentials are intentionally excluded from the repository.

Credentials should be supplied locally rather than stored in source control.

---

# Data and Analytical Considerations

## Unequal Sample Sizes

Genres, decades, and artists have different numbers of observations.

Minimum observation thresholds were therefore applied where appropriate.

## Association Does Not Mean Causation

The relationships identified in the project describe statistical and descriptive associations.

They do not establish that one variable directly causes higher track popularity.

## Popularity Is Time Sensitive

Spotify popularity reflects platform performance and may favor currently active or recently popular music.

This should be considered when comparing tracks from different historical periods.

## Genre Complexity

Artists can be associated with multiple genres.

Genre analysis therefore required a normalized many to many relational structure rather than treating the original genre field as a single category.

---

# Conclusion

This project demonstrates a complete data analytics workflow from raw data preparation to business visualization.

Python was used for data cleaning, transformation, exploratory analysis, and statistical investigation.

MySQL was used for data storage, SQL validation, relational database normalization, and integrity testing.

MySQL Workbench was used to develop the Entity Relationship Diagram.

Tableau was used to transform the analytical results into an interactive dashboard covering ten research questions and four headline KPIs.

The results indicate that Spotify track popularity is associated with multiple factors rather than a single characteristic.

Artist popularity shows a stronger relationship with track popularity than follower count. Explicit content, track duration, album characteristics, genre, release period, and artist performance also show meaningful differences within the analyzed dataset.

The project therefore demonstrates how Python, SQL, relational database design, and business intelligence tools can be integrated into a single end to end analytics workflow.

---

# Author

**Dr. Jan Noel Vero**

