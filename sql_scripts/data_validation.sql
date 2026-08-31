USE spotify_db;

-- RQ1
SELECT DATABASE();

SELECT COUNT(*) AS total_rows
FROM spotify_tracks;

SELECT *
FROM spotify_tracks
LIMIT 1000;

SELECT
    track_name,
    artist_name,
    track_popularity,
    album_name,
    release_year
FROM spotify_tracks
LIMIT 20;

USE spotify_db;

-- RQ2
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

-- RQ3
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

-- RQ4
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
GROUP BY duration_group
ORDER BY
    CASE duration_group
        WHEN 'Short' THEN 1
        WHEN 'Standard' THEN 2
        WHEN 'Long' THEN 3
        WHEN 'Very Long' THEN 4
    END;
    
    -- RQ5
    SELECT
    album_type,
    COUNT(*) AS track_count,
    ROUND(AVG(track_popularity), 2) AS average_popularity
FROM spotify_tracks
GROUP BY album_type
ORDER BY average_popularity DESC;
    
-- RQ6
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

-- RQ7
SELECT VERSION();

-- RQ8
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

-- RQ 9
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

-- RQ10
SELECT
    track_name,
    artist_name,
    track_popularity,
    album_name,
    release_year
FROM spotify_tracks
ORDER BY track_popularity DESC
LIMIT 10;







