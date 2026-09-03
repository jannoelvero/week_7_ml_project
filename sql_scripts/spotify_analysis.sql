-- ============================================================
-- Spotify Track Popularity Analytics
-- SQL Business Analysis
-- Author: Jan Noel Vero
-- Database: spotify_db
-- ============================================================

USE spotify_db;

-- ============================================================
-- 1. DATASET OVERVIEW
-- ============================================================

SELECT
    COUNT(*) AS total_tracks
FROM spotify_tracks;


-- ============================================================
-- 2. AVERAGE TRACK POPULARITY
-- ============================================================

SELECT
    ROUND(AVG(track_popularity), 2) AS average_track_popularity,
    MIN(track_popularity) AS minimum_track_popularity,
    MAX(track_popularity) AS maximum_track_popularity
FROM spotify_tracks;


-- ============================================================
-- 3. ARTIST POPULARITY AND TRACK PERFORMANCE
-- ============================================================

SELECT
    artist_name,
    ROUND(AVG(artist_popularity), 2) AS average_artist_popularity,
    ROUND(AVG(track_popularity), 2) AS average_track_popularity,
    COUNT(*) AS number_of_tracks
FROM spotify_tracks
WHERE artist_name IS NOT NULL
GROUP BY artist_name
HAVING COUNT(*) >= 10
ORDER BY average_track_popularity DESC
LIMIT 10;


-- ============================================================
-- 4. ARTIST FOLLOWERS
-- ============================================================

SELECT
    artist_name,
    MAX(artist_followers) AS artist_followers,
    ROUND(AVG(track_popularity), 2) AS average_track_popularity,
    COUNT(*) AS number_of_tracks
FROM spotify_tracks
WHERE artist_name IS NOT NULL
GROUP BY artist_name
HAVING COUNT(*) >= 10
ORDER BY artist_followers DESC
LIMIT 10;


-- ============================================================
-- 5. EXPLICIT VS NON EXPLICIT TRACKS
-- ============================================================

SELECT
    explicit,
    COUNT(*) AS number_of_tracks,
    ROUND(AVG(track_popularity), 2) AS average_track_popularity
FROM spotify_tracks
GROUP BY explicit
ORDER BY average_track_popularity DESC;


-- ============================================================
-- 6. POPULARITY BY ALBUM TYPE
-- ============================================================

SELECT
    album_type,
    COUNT(*) AS number_of_tracks,
    ROUND(AVG(track_popularity), 2) AS average_track_popularity
FROM spotify_tracks
GROUP BY album_type
ORDER BY average_track_popularity DESC;


-- ============================================================
-- 7. TRACK DURATION AND POPULARITY
-- ============================================================

SELECT
    CASE
        WHEN track_duration_min < 2 THEN 'Under 2 Minutes'
        WHEN track_duration_min < 3 THEN '2 to Under 3 Minutes'
        WHEN track_duration_min < 4 THEN '3 to Under 4 Minutes'
        WHEN track_duration_min < 5 THEN '4 to Under 5 Minutes'
        ELSE '5 Minutes or More'
    END AS duration_group,
    COUNT(*) AS number_of_tracks,
    ROUND(AVG(track_popularity), 2) AS average_track_popularity
FROM spotify_tracks
GROUP BY duration_group
ORDER BY average_track_popularity DESC;


-- ============================================================
-- 8. POPULARITY BY RELEASE DECADE
-- ============================================================

SELECT
    CONCAT(FLOOR(release_year / 10) * 10, 's') AS release_decade,
    COUNT(*) AS number_of_tracks,
    ROUND(AVG(track_popularity), 2) AS average_track_popularity
FROM spotify_tracks
GROUP BY release_decade
ORDER BY release_decade;


-- ============================================================
-- 9. TOP GENRE GROUPS
-- Minimum representation: 30 tracks
-- ============================================================

SELECT
    artist_genres,
    COUNT(*) AS number_of_tracks,
    ROUND(AVG(track_popularity), 2) AS average_track_popularity
FROM spotify_tracks
WHERE artist_genres IS NOT NULL
  AND artist_genres <> ''
GROUP BY artist_genres
HAVING COUNT(*) >= 30
ORDER BY average_track_popularity DESC
LIMIT 10;


-- ============================================================
-- 10. TOP ARTISTS
-- Minimum representation: 10 tracks
-- ============================================================

SELECT
    artist_name,
    COUNT(*) AS number_of_tracks,
    ROUND(AVG(track_popularity), 2) AS average_track_popularity
FROM spotify_tracks
WHERE artist_name IS NOT NULL
GROUP BY artist_name
HAVING COUNT(*) >= 10
ORDER BY average_track_popularity DESC
LIMIT 10;


-- ============================================================
-- 11. HIGH POPULARITY TRACKS
-- Popularity threshold: 90+
-- ============================================================

SELECT
    track_name,
    artist_name,
    track_popularity,
    release_year,
    album_type
FROM spotify_tracks
WHERE track_popularity >= 90
ORDER BY track_popularity DESC,
         release_year DESC;


-- ============================================================
-- 12. HIGH POPULARITY TRACKS BY RELEASE YEAR
-- ============================================================

SELECT
    release_year,
    COUNT(*) AS high_popularity_tracks
FROM spotify_tracks
WHERE track_popularity >= 90
GROUP BY release_year
ORDER BY release_year;


-- ============================================================
-- 13. RECENT RELEASE CONCENTRATION
-- ============================================================

SELECT
    COUNT(*) AS total_high_popularity_tracks,
    SUM(
        CASE
            WHEN release_year IN (2024, 2025) THEN 1
            ELSE 0
        END
    ) AS recent_high_popularity_tracks,
    ROUND(
        100.0 *
        SUM(
            CASE
                WHEN release_year IN (2024, 2025) THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        1
    ) AS recent_release_percentage
FROM spotify_tracks
WHERE track_popularity >= 90;


-- ============================================================
-- 14. ALBUM SIZE AND TRACK POPULARITY
-- ============================================================

SELECT
    album_total_tracks,
    COUNT(*) AS number_of_tracks,
    ROUND(AVG(track_popularity), 2) AS average_track_popularity
FROM spotify_tracks
GROUP BY album_total_tracks
HAVING COUNT(*) >= 10
ORDER BY album_total_tracks;


-- ============================================================
-- 15. BUSINESS SUMMARY
-- ============================================================

SELECT
    COUNT(*) AS total_tracks,
    ROUND(AVG(track_popularity), 2) AS overall_average_popularity,

    ROUND(
        AVG(
            CASE
                WHEN explicit = 1 THEN track_popularity
            END
        ),
        2
    ) AS explicit_average_popularity,

    ROUND(
        AVG(
            CASE
                WHEN explicit = 0 THEN track_popularity
            END
        ),
        2
    ) AS non_explicit_average_popularity,

    SUM(
        CASE
            WHEN track_popularity >= 90 THEN 1
            ELSE 0
        END
    ) AS high_popularity_tracks

FROM spotify_tracks;
