USE spotify_db;


-- =====================================================
-- RQ1
-- What is the relationship between artist popularity
-- and track popularity?
-- =====================================================

SELECT
    ROUND(
        (
            COUNT(*) * SUM(artist_popularity * track_popularity)
            - SUM(artist_popularity) * SUM(track_popularity)
        )
        /
        SQRT(
            (
                COUNT(*) * SUM(artist_popularity * artist_popularity)
                - POW(SUM(artist_popularity), 2)
            )
            *
            (
                COUNT(*) * SUM(track_popularity * track_popularity)
                - POW(SUM(track_popularity), 2)
            )
        ),
        2
    ) AS correlation
FROM spotify_tracks
WHERE artist_popularity IS NOT NULL;


-- =====================================================
-- RQ2
-- What is the relationship between artist followers
-- and track popularity?
-- =====================================================

SELECT
    ROUND(
        (
            COUNT(*) * SUM(artist_followers * track_popularity)
            - SUM(artist_followers) * SUM(track_popularity)
        )
        /
        SQRT(
            (
                COUNT(*) * SUM(artist_followers * artist_followers)
                - POW(SUM(artist_followers), 2)
            )
            *
            (
                COUNT(*) * SUM(track_popularity * track_popularity)
                - POW(SUM(track_popularity), 2)
            )
        ),
        2
    ) AS correlation
FROM spotify_tracks
WHERE artist_followers IS NOT NULL;


-- =====================================================
-- RQ3
-- Is there a difference in track popularity between
-- explicit and non explicit tracks?
-- =====================================================

SELECT
    CASE
        WHEN explicit = 1 THEN 'Explicit'
        ELSE 'Non Explicit'
    END AS content_type,
    COUNT(*) AS track_count,
    ROUND(AVG(track_popularity), 2) AS average_popularity
FROM spotify_tracks
GROUP BY explicit
ORDER BY average_popularity DESC;


-- =====================================================
-- RQ4
-- How is track duration associated with track popularity?
-- =====================================================

SELECT
    ROUND(
        (
            COUNT(*) * SUM(track_duration_min * track_popularity)
            - SUM(track_duration_min) * SUM(track_popularity)
        )
        /
        SQRT(
            (
                COUNT(*) * SUM(track_duration_min * track_duration_min)
                - POW(SUM(track_duration_min), 2)
            )
            *
            (
                COUNT(*) * SUM(track_popularity * track_popularity)
                - POW(SUM(track_popularity), 2)
            )
        ),
        2
    ) AS correlation
FROM spotify_tracks;


-- RQ4 Duration Group Analysis

SELECT
    CASE
        WHEN track_duration_min < 2 THEN 'Short'
        WHEN track_duration_min < 4 THEN 'Standard'
        WHEN track_duration_min < 6 THEN 'Long'
        ELSE 'Very Long'
    END AS duration_group,
    COUNT(*) AS track_count,
    ROUND(AVG(track_popularity), 2) AS average_popularity
FROM spotify_tracks
GROUP BY duration_group;


-- =====================================================
-- RQ5
-- Does track popularity differ across album types?
-- =====================================================

SELECT
    album_type,
    COUNT(*) AS track_count,
    ROUND(AVG(track_popularity), 2) AS average_popularity
FROM spotify_tracks
GROUP BY album_type
ORDER BY average_popularity DESC;


-- =====================================================
-- RQ6
-- Does track popularity differ according to album size?
-- =====================================================

SELECT
    CASE
        WHEN album_total_tracks <= 5 THEN 'Small'
        WHEN album_total_tracks <= 12 THEN 'Medium'
        WHEN album_total_tracks <= 20 THEN 'Large'
        ELSE 'Very Large'
    END AS album_size_group,
    COUNT(*) AS track_count,
    ROUND(AVG(track_popularity), 2) AS average_popularity
FROM spotify_tracks
GROUP BY album_size_group
ORDER BY average_popularity DESC;


-- =====================================================
-- RQ7
-- Which genres have the highest average track popularity?
-- Minimum 30 tracks per genre
-- =====================================================

WITH RECURSIVE genre_split AS (
    SELECT
        track_id,
        track_popularity,
        TRIM(SUBSTRING_INDEX(artist_genres, ',', 1)) AS genre,
        CASE
            WHEN artist_genres LIKE '%,%'
            THEN SUBSTRING(
                artist_genres,
                LENGTH(SUBSTRING_INDEX(artist_genres, ',', 1)) + 2
            )
            ELSE NULL
        END AS remaining_genres
    FROM spotify_tracks
    WHERE artist_genres IS NOT NULL

    UNION ALL

    SELECT
        track_id,
        track_popularity,
        TRIM(SUBSTRING_INDEX(remaining_genres, ',', 1)) AS genre,
        CASE
            WHEN remaining_genres LIKE '%,%'
            THEN SUBSTRING(
                remaining_genres,
                LENGTH(SUBSTRING_INDEX(remaining_genres, ',', 1)) + 2
            )
            ELSE NULL
        END
    FROM genre_split
    WHERE remaining_genres IS NOT NULL
)

SELECT
    genre,
    COUNT(*) AS track_count,
    ROUND(AVG(track_popularity), 2) AS average_popularity
FROM genre_split
GROUP BY genre
HAVING COUNT(*) >= 30
ORDER BY average_popularity DESC
LIMIT 10;


-- =====================================================
-- RQ8
-- How does track popularity vary across release periods?
-- Minimum 30 tracks per decade
-- =====================================================

SELECT
    FLOOR(release_year / 10) * 10 AS decade,
    COUNT(*) AS track_count,
    ROUND(AVG(track_popularity), 2) AS average_popularity
FROM spotify_tracks
GROUP BY decade
HAVING COUNT(*) >= 30
ORDER BY decade;


-- =====================================================
-- RQ9
-- Which artists demonstrate the highest average
-- track popularity?
-- Minimum 5 tracks per artist
-- =====================================================

SELECT
    artist_name,
    COUNT(*) AS track_count,
    ROUND(AVG(track_popularity), 2) AS average_popularity
FROM spotify_tracks
WHERE artist_name IS NOT NULL
GROUP BY artist_name
HAVING COUNT(*) >= 5
ORDER BY average_popularity DESC
LIMIT 10;


-- =====================================================
-- RQ10
-- Which tracks have the highest popularity scores?
-- =====================================================

SELECT
    track_name,
    artist_name,
    track_popularity,
    album_name,
    release_year
FROM spotify_tracks
ORDER BY track_popularity DESC
LIMIT 10;