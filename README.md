# Spotify Business Analysis

## Understanding the Factors Associated With Track Popularity

This project analyzes Spotify track, artist, album, genre, and release
information to identify measurable characteristics associated with track
popularity and translate those findings into practical insights for
music release and content strategy.

The analysis combines data loading, cleaning, exploratory analysis,
statistical and business analysis, feature engineering, machine
learning, visualization, SQL-ready data preparation, and stakeholder
interpretation.

The objective is not simply to identify statistically significant
relationships. The project also evaluates the **magnitude, practical
relevance, predictive usefulness, limitations, and business
implications** of the observed relationships.

> **Important:** The findings describe associations in the available
> Spotify data. They should not be interpreted as evidence that changing
> a particular characteristic will cause a track to become more popular.

------------------------------------------------------------------------

# 1. Business Problem

Music performance is associated with many interconnected factors,
including artist market position, audience reach, release format, genre,
timing, and track characteristics.

For artists, labels, and music strategy teams, the challenge is
determining which measurable characteristics provide useful information
about track popularity and which relationships are too weak to support
practical decisions.

This project investigates those relationships and evaluates whether the
available variables can support prediction of both:

-   continuous Spotify track popularity; and
-   a project-defined high-popularity classification target.

------------------------------------------------------------------------

# 2. Business Goal

To identify measurable characteristics associated with Spotify track
popularity and develop evidence-based insights that can support release
planning, artist benchmarking, segmentation, promotional prioritization,
and performance monitoring.

------------------------------------------------------------------------

# 3. Stakeholders

The analysis may support:

-   artists;
-   record labels;
-   artist management teams;
-   music marketing teams;
-   content strategy teams;
-   streaming and playlist analysts;
-   music business researchers.

The results are intended to support analytical decision making rather
than provide a formula for creating a successful track.

------------------------------------------------------------------------

# 4. Research Objectives

## General Objective

To analyze track, artist, genre, album, and release characteristics
associated with Spotify track popularity and translate the findings into
practical business insights.

## Specific Objectives

1.  Determine the relationship between artist popularity and track
    popularity.
2.  Examine whether artist follower count is associated with track
    popularity.
3.  Compare popularity between explicit and non explicit tracks.
4.  Determine whether track duration is associated with track
    popularity.
5.  Compare track popularity across album types.
6.  Examine the relationship between album size and track popularity.
7.  Identify genre groups associated with stronger average track
    popularity.
8.  Examine how track popularity varies across release periods.
9.  Identify artists demonstrating strong popularity performance with
    sufficient track representation.
10. Identify the highest-popularity tracks in the dataset.
11. Engineer relevant track, artist, release, and categorical features
    for predictive modelling.
12. Evaluate regression and classification performance.
13. Compare predictive performance with and without artist market
    information.
14. Identify which features contribute most to predictive performance.

------------------------------------------------------------------------

# 5. Research Questions

### RQ1

What is the relationship between artist popularity and track popularity?

### RQ2

What is the relationship between artist follower count and track
popularity?

### RQ3

Is there a difference in track popularity between explicit and non
explicit tracks?

### RQ4

How is track duration associated with track popularity?

### RQ5

Does track popularity differ across album types?

### RQ6

Does track popularity differ according to album size?

### RQ7

Which genre groups have the highest average track popularity?

### RQ8

How does track popularity vary across release periods?

### RQ9

Which artists demonstrate the highest average track popularity among
artists with sufficient track representation?

### RQ10

Which tracks have the highest Spotify popularity scores in the dataset?

------------------------------------------------------------------------

# 6. Machine Learning Questions

### MLQ1: Regression

How accurately can Spotify track popularity be predicted from track and
release characteristics, and how much does predictive performance
improve when artist market information is added?

**Evaluation:** MAE, RMSE, and R², compared with a baseline mean
prediction.

### MLQ2: Classification

How reliably can tracks be classified into the project's high-popularity
and lower-popularity groups using track, release, and artist
characteristics?

**Evaluation:** Accuracy, Precision, Recall, F1 score, and ROC AUC,
compared with a baseline classifier.

### MLQ3: Feature Importance

Which features contribute most to the predictive performance of the
regression and classification models?

**Evaluation:** Permutation importance for the final regression and
classification models.

### MLQ4: Artist Market Information

How much does predictive performance improve when artist popularity and
follower information are added to intrinsic track and release
characteristics?

**Evaluation:** Comparison of Model A and Model B using holdout and
cross-validation performance.

------------------------------------------------------------------------

# 7. Analytical Workflow

``` text
Business Understanding
        ↓
Data Loading
        ↓
Data Cleaning and Validation
        ↓
Exploratory Data Analysis
        ↓
Business and Statistical Analysis
        ↓
Feature Engineering
        ↓
Machine Learning
        ↓
Model Evaluation
        ↓
Visualization and Stakeholder Insights
        ↓
Business Interpretation
        ↓
Recommendations
```

The notebooks are intentionally separated by analytical stage so that
each part of the workflow has a clear purpose and can be reproduced
independently.

------------------------------------------------------------------------

# 8. Dataset

The final cleaned track-level dataset contains **8,775 tracks**.

Key analytical fields include:

-   track popularity;
-   track duration;
-   explicit-content status;
-   artist name;
-   artist popularity;
-   artist followers;
-   artist genres;
-   album type;
-   album size;
-   release year.

## Data Quality Summary

-   **Rows:** 8,775
-   **Duplicate rows:** 0
-   **Track popularity range:** 0 to 100
-   **Release years:** 1952 to 2025
-   **Album:** 6,022 tracks
-   **Single:** 2,245 tracks
-   **Compilation:** 508 tracks
-   **Tracks with genre information:** 4,283
-   **Tracks missing genre information:** 4,492

Genre missingness is an important limitation and is considered when
interpreting genre-level findings.

------------------------------------------------------------------------

# 9. Data Files

## Raw Data

``` text
data/raw/
```

Raw source data are preserved separately from cleaned and analytical
datasets.

## Cleaned and Analytical Data

``` text
data/clean/
├── spotify_final.csv
├── spotify_features.csv
└── spotify_mysql.csv
```

-   `spotify_final.csv` is the primary cleaned dataset used for
    exploratory, statistical, business, and visualization analysis.
-   `spotify_features.csv` contains feature-engineered data prepared for
    machine learning.
-   `spotify_mysql.csv` is prepared for relational SQL/MySQL analysis.

## Tableau Data

Where generated for the visualization layer:

``` text
data/tableau/
├── spotify_tableau_final.csv
├── spotify_model_performance.csv
└── spotify_feature_importance.csv
```

------------------------------------------------------------------------

# 10. Data Cleaning and Validation

The cleaning workflow includes:

-   structural inspection;
-   data-type validation;
-   duplicate checking;
-   missing-value analysis;
-   popularity-range validation;
-   release-year extraction and validation;
-   album-category validation;
-   genre-coverage assessment;
-   preservation of raw and cleaned datasets;
-   creation of reusable analytical fields.

Detailed cleaning decisions are documented in `02_data_cleaning.ipynb`.

------------------------------------------------------------------------

# 11. Exploratory Analysis

Exploratory analysis was completed before inferential testing and
machine learning.

The investigation includes:

-   descriptive statistics;
-   distributions;
-   missingness;
-   outlier assessment;
-   univariate analysis;
-   bivariate relationships;
-   correlation analysis;
-   artist segmentation;
-   genre segmentation;
-   album analysis;
-   release-period analysis;
-   unusual and contradictory cases.

Track popularity has a mean of approximately **52.3** and a median of
approximately **58**, with substantial variation across observations.

------------------------------------------------------------------------

# 12. Statistical and Business Findings

## 12.1 Artist Popularity

Artist popularity has a **moderate positive relationship** with track
popularity:

**Pearson r ≈ 0.454**

Tracks associated with more popular artists tend to have higher
popularity scores, although substantial variation remains.

### Business Implication

Artist market position provides meaningful context for track evaluation.
It should be considered alongside release and track characteristics
rather than treated as a guarantee of individual track performance.

------------------------------------------------------------------------

## 12.2 Artist Followers

Artist followers have a **weak positive relationship** with track
popularity:

**Pearson r ≈ 0.226**

Follower count therefore contains some information about audience reach,
but it is considerably less informative than artist popularity.

### Business Implication

Raw follower count should not be used as a standalone proxy for expected
track popularity.

------------------------------------------------------------------------

## 12.3 Explicit vs Non Explicit Tracks

Average popularity:

  Content Type     Mean Popularity   Median Popularity
  -------------- ----------------- -------------------
  Explicit                   57.54                  64
  Non explicit               50.49                  55

The mean difference is approximately **7.05 popularity points**.

A two-sided Mann-Whitney U test found a statistically significant
difference:

-   **U:** 8,575,157.5
-   **p:** 3.60 × 10⁻⁴⁰

### Business Implication

Explicit tracks have higher observed popularity in this dataset, but the
result does not establish that explicit content causes higher
popularity. Explicit status may be associated with genre, artist
profile, audience characteristics, and release strategy.

------------------------------------------------------------------------

## 12.4 Track Duration

Track duration has a **very weak positive relationship** with
popularity:

**Pearson r ≈ 0.105**

The relationship is statistically significant, but its magnitude is very
small.

Typical duration is concentrated around 3 to 4 minutes:

-   **Mean:** 3.50 minutes
-   **Median:** 3.45 minutes

### Business Implication

Track duration alone provides little practical information about
expected popularity. Statistical significance should not be confused
with business significance.

------------------------------------------------------------------------

## 12.5 Album Type

Average popularity differs across album types:

  Album Type      Mean Popularity   Median Popularity
  ------------- ----------------- -------------------
  Album                     55.53                  61
  Single                    46.11                  51
  Compilation               40.51                  44

A Kruskal-Wallis test found evidence of differences among the groups:

-   **H ≈ 417.65**
-   **p ≈ 2.04 × 10⁻⁹¹**

The omnibus test indicates that at least one group differs. It does not
by itself establish that every pair differs.

### Business Implication

Release format provides useful context, but it should not be interpreted
as a causal driver of popularity.

------------------------------------------------------------------------

## 12.6 Album Size

Album size has a **negligible negative linear relationship** with track
popularity:

**Pearson r ≈ -0.048**

The association is statistically significant because of the dataset
size, but its practical magnitude is negligible.

Interestingly, album size later contributes useful information to the
Random Forest models, suggesting that its predictive contribution may
involve nonlinear patterns or interactions rather than a simple linear
relationship.

------------------------------------------------------------------------

## 12.7 Genre

Genre information is available for **4,283 of 8,775 tracks**.

The source genre field is multi-label. A single track can therefore
contribute to more than one genre after the field is expanded. Because
this violates the independence assumption required for a standard
between-group Kruskal-Wallis comparison, the final genre analysis is
treated primarily as **descriptive segmentation**.

Among genres with at least 30 observed associations, leading
average-popularity groups include:

  Genre                  Average Popularity
  -------------------- --------------------
  trap latino                         73.53
  urbano latino                       73.05
  reggaeton                           71.26
  post-grunge                         69.78
  indie                               68.74
  gangster rap                        68.09
  latin                               67.47
  west coast hip hop                  66.78
  hyperpop                            66.35
  k-pop                               66.17

### Business Implication

Genre is useful for segmentation and benchmarking, but the ranking
should not be interpreted as a universal ranking of music genres because
genre coverage is incomplete and multi-label.

------------------------------------------------------------------------

## 12.8 Release Timing

Average popularity across recent decades is relatively stable:

  Decade     Mean Popularity
  -------- -----------------
  1990s                51.05
  2000s                53.09
  2010s                51.96
  2020s                51.99

Earlier decades contain much smaller samples.

### Business Implication

The dataset does not support a simple conclusion that newer tracks are
automatically more popular on average. Release timing should be
interpreted in the context of Spotify's current popularity measure and
the unequal representation of release periods.

------------------------------------------------------------------------

## 12.9 Artist Performance

The dataset contains approximately **2,546 unique artists**.

Because many artists are represented by only one or two tracks, the
final artist ranking uses a minimum of **10 unique tracks**, leaving
**155 qualified artists**.

Leading qualified artists include:

  Artist                Tracks   Average Popularity
  ------------------- -------- --------------------
  Arctic Monkeys            10                 79.8
  sombr                     15                 79.7
  Sabrina Carpenter         37                 77.9
  Tame Impala               13                 75.0
  Billie Eilish             61                 73.9
  Chappell Roan             18                 73.6
  Bad Bunny                 56                 73.3

These are rankings within the analyzed dataset, not definitive
Spotify-wide artist rankings.

------------------------------------------------------------------------

## 12.10 Highest-Popularity Tracks

Tracks are ranked using unique Spotify `track_id` values rather than
track names alone.

The highest observed track popularity score in the dataset is **100**.

The ranking is interpreted descriptively because Spotify popularity
represents the observed popularity measure available in the dataset
rather than historical popularity at the original release date.

------------------------------------------------------------------------

# 13. Feature Engineering

Feature engineering prepares the cleaned data for predictive modelling.

Key engineered and analytical features include:

### Numerical

-   artist popularity;
-   log-transformed artist followers;
-   track duration;
-   album total tracks;
-   relative track position;
-   release decade.

### Categorical

-   explicit status;
-   grouped genre;
-   album type.

Categorical variables are encoded within the modelling workflow.
Numerical preprocessing and missing-value handling are performed using
training data to reduce information leakage.

------------------------------------------------------------------------

# 14. Machine Learning

Two modelling perspectives are used.

## Model A

Uses intrinsic track and release characteristics without artist
popularity and follower information.

## Model B

Adds artist market information:

-   artist popularity;
-   artist followers.

This design directly tests whether existing artist market position
improves prediction.

------------------------------------------------------------------------

# 15. Regression Results

The final Random Forest Model B achieved the following holdout
performance:

  Metric      Score
  -------- --------
  MAE        14.087
  RMSE       19.649
  R²          0.322

Five-fold cross-validation produced approximately:

  Metric          Mean ± SD
  -------- ----------------
  MAE        13.987 ± 0.321
  RMSE       19.545 ± 0.299
  R²          0.340 ± 0.017

### Interpretation

The regression model captures meaningful predictive signal but leaves
substantial unexplained variation. An MAE of about 14 popularity points
means the model is not sufficiently precise to predict an individual
track's popularity score with high confidence.

The appropriate use is **decision support and analytical
prioritization**, not precise popularity forecasting.

------------------------------------------------------------------------

# 16. Classification Results

The final Random Forest Model B achieved:

  Metric        Score
  ----------- -------
  Accuracy      0.758
  Precision     0.559
  Recall        0.360
  F1            0.438
  ROC AUC       0.798

Five-fold cross-validation produced approximately:

  Metric            Mean ± SD
  ----------- ---------------
  Accuracy      0.765 ± 0.011
  Precision     0.570 ± 0.023
  Recall        0.366 ± 0.013
  F1            0.446 ± 0.015
  ROC AUC       0.802 ± 0.016

### Interpretation

ROC AUC indicates useful ranking ability, but recall remains limited.
The model identifies only about 36% of actual high-popularity
observations at the evaluated classification threshold.

Therefore, the classifier should not be used as a strict filter that
automatically rejects tracks predicted as lower popularity.

------------------------------------------------------------------------

# 17. Permutation Feature Importance

Permutation importance measures how much predictive performance
deteriorates when a feature is shuffled. It describes **model
reliance**, not causal influence.

## Regression Model B

  Feature                     Increase in MAE When Shuffled
  ------------------------- -------------------------------
  artist_popularity                                   7.709
  album_total_tracks                                  2.314
  log_artist_followers                                2.100
  release_decade                                      0.905
  genre_grouped                                       0.834
  track_duration_min                                  0.519
  relative_track_position                             0.414
  album_type                                          0.184
  explicit                                            0.077

## Classification Model B

  Feature                     F1 Decrease When Shuffled
  ------------------------- ---------------------------
  artist_popularity                               0.132
  album_total_tracks                              0.075
  log_artist_followers                            0.058
  genre_grouped                                   0.046
  release_decade                                  0.040
  relative_track_position                         0.037
  album_type                                      0.035
  track_duration_min                              0.011
  explicit                                        0.005

### Interpretation

The regression and classification models show a consistent pattern.

**Artist popularity is the strongest predictive feature in both tasks.**

Album size and artist follower information also contribute meaningful
predictive information. Genre and release decade provide additional
context, while explicit status and track duration make relatively small
independent contributions after stronger variables are considered.

The importance of album size despite its negligible simple correlation
illustrates why predictive modelling can reveal nonlinear or
interaction-based information that is not visible in a standalone
correlation.

------------------------------------------------------------------------

# 18. Key Stakeholder Insights

1.  **Artist market position is the strongest recurring predictive
    signal.**\
    Artist popularity is associated with track popularity descriptively
    and is the dominant permutation-importance feature in both final
    models.

2.  **Follower count provides useful but weaker information.**\
    Audience size alone does not reliably determine individual track
    performance.

3.  **Release structure matters, but not through simple rules.**\
    Album type differs descriptively across popularity levels, while
    album size has almost no linear relationship with popularity yet
    contributes to Random Forest prediction.

4.  **Explicit status is associated with higher observed popularity but
    is not a causal strategy.**

5.  **Track duration has little practical standalone importance.**

6.  **Genre is useful for segmentation, but missingness and multi-label
    classification limit universal conclusions.**

7.  **Release timing should not be reduced to a simple newer-is-better
    rule.**

8.  **Machine learning provides useful signal but not reliable hit
    prediction.**\
    Regression error remains substantial and classification recall is
    limited.

------------------------------------------------------------------------

# 19. Strategic Recommendations

## Use Artist Market Position as Context

Incorporate artist popularity and audience information when benchmarking
track performance and prioritizing releases, while avoiding the
assumption that established artist visibility guarantees success.

## Evaluate Releases Using Multiple Signals

Combine:

-   artist market position;
-   release structure;
-   genre context;
-   release timing;
-   track characteristics.

Avoid using a single variable as a formula for success.

## Use Genre for Segmentation

Benchmark tracks within relevant genre and artist contexts rather than
relying exclusively on platform-wide averages.

## Do Not Optimize Duration in Isolation

The observed duration-popularity relationship is too weak to justify a
general recommendation to make tracks shorter or longer solely to
improve popularity.

## Treat Explicit Status as Contextual

Explicit tracks have higher observed popularity, but explicit content
should not be adopted as a popularity strategy based on this analysis.

## Use Models for Prioritization

The models can support screening, ranking, scenario analysis, and
analytical discussion. They should not independently determine
promotional investment or predict which tracks will become hits.

------------------------------------------------------------------------

# 20. Limitations

The findings should be interpreted within the following limitations:

-   Spotify popularity reflects the popularity measure observed in the
    dataset, not necessarily popularity at original release.
-   The classification target is project-defined.
-   Genre information is missing for approximately half of the tracks.
-   Genre values are multi-label and are not mutually exclusive.
-   Artist representation is highly uneven.
-   Important external drivers are unavailable.
-   The dataset does not include marketing expenditure, playlist
    exposure, social media activity, radio exposure, or geographic
    audience behavior.
-   Observational and predictive relationships do not establish causal
    effects.
-   Predictive performance is insufficient for deterministic hit
    prediction.

------------------------------------------------------------------------

# 21. Recommended Next Steps

Future analysis could incorporate:

-   longitudinal Spotify popularity;
-   editorial and algorithmic playlist placement;
-   marketing expenditure;
-   social-media engagement;
-   radio exposure;
-   geographic streaming behavior;
-   audience demographics;
-   release campaign data;
-   label and distribution information;
-   time-aware validation.

Longitudinal data would help distinguish variables associated with
current popularity from variables that genuinely precede future
performance.

------------------------------------------------------------------------

# 22. Tools and Technologies

## Python

Used for:

-   data loading;
-   cleaning and validation;
-   exploratory analysis;
-   statistical analysis;
-   feature engineering;
-   machine learning;
-   model evaluation;
-   visualization;
-   analytical data preparation.

Primary libraries include:

-   pandas
-   NumPy
-   Matplotlib
-   Seaborn
-   SciPy
-   statsmodels
-   scikit-learn

## SQL / MySQL

Used or prepared as the relational analysis layer through the SQL-ready
Spotify dataset.

## Tableau

Used for interactive visualization, dashboards, analytical storytelling,
and stakeholder communication where included in the project repository.

## Git and GitHub

Used for version control, branch-based collaboration, reproducibility,
and project documentation.

## Jupyter Notebook

Used to structure and document the end-to-end analytical workflow.

------------------------------------------------------------------------

# 23. Repository Structure

``` text
week7_jannoel/
│
├── README.md
├── .gitignore
├── pyproject.toml
├── uv.lock
│
├── data/
│   ├── raw/
│   ├── clean/
│   │   ├── spotify_final.csv
│   │   ├── spotify_features.csv
│   │   └── spotify_mysql.csv
│   └── tableau/
│
├── notebooks/
│   ├── 00_business_background.ipynb
│   ├── 01_data_loading.ipynb
│   ├── 02_data_cleaning.ipynb
│   ├── 03_exploratory_analysis.ipynb
│   ├── 04_business_analysis.ipynb
│   ├── 05_feature_engineering.ipynb
│   ├── 06_machine_learning.ipynb
│   └── 07_visualization.ipynb
│
├── figures/
├── sql/
├── tableau/
└── src/
```

The exact contents of optional output folders may depend on which
project artifacts have been generated and retained.

------------------------------------------------------------------------

# 24. Notebook Execution Order

Run the notebooks sequentially:

``` text
00_business_background.ipynb
        ↓
01_data_loading.ipynb
        ↓
02_data_cleaning.ipynb
        ↓
03_exploratory_analysis.ipynb
        ↓
04_business_analysis.ipynb
        ↓
05_feature_engineering.ipynb
        ↓
06_machine_learning.ipynb
        ↓
07_visualization.ipynb
```

Each notebook has a distinct analytical responsibility. Later notebooks
use outputs generated or validated in earlier stages.

------------------------------------------------------------------------

# 25. Reproducibility

Clone the repository and enter the project directory:

``` bash
git clone <repository-url>
cd <repository-folder>
```

Install project dependencies:

``` bash
uv sync
```

Activate the environment if required:

``` bash
source .venv/bin/activate
```

Launch Jupyter:

``` bash
jupyter lab
```

Run the notebooks in numerical order from `00_business_background.ipynb`
through `07_visualization.ipynb`.

Raw source data should remain unchanged. Cleaned, feature-engineered,
SQL-ready, visualization-ready, and model-output datasets should be
stored separately from the original source data.

------------------------------------------------------------------------

# 26. Final Conclusion

Spotify track popularity cannot be explained by a single track, artist,
genre, album, or release characteristic.

The most consistent finding across descriptive and predictive analysis
is the importance of **artist market position**, particularly artist
popularity. However, artist-level information does not determine
individual track success.

Track duration and album size demonstrate why statistical significance
and simple correlation must be interpreted carefully. Some relationships
are statistically detectable but practically weak, while variables with
negligible linear relationships may still contribute predictive
information through nonlinear patterns and interactions.

The final regression model captures useful signal but retains
substantial prediction error. The final classification model
demonstrates useful ranking ability but limited recall. These results
support the use of machine learning as a **decision-support and
prioritization tool**, not as a standalone hit-prediction system.

Overall, the evidence supports a **multi-factor, segmentation-based, and
data-informed approach** to music release and content strategy that
combines artist market position, release structure, genre context,
timing, and track characteristics while recognizing the limits of
observational and predictive data.
