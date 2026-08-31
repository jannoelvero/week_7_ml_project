CREATE DATABASE IF NOT EXISTS spotify_db;

USE spotify_db;

CREATE TABLE IF NOT EXISTS spotify_tracks (
    track_id VARCHAR(50) PRIMARY KEY,
    track_name VARCHAR(255),
    track_number INT,
    track_popularity INT,
    explicit BOOLEAN,
    artist_name VARCHAR(255),
    artist_popularity DECIMAL(5,2),
    artist_followers BIGINT,
    artist_genres TEXT,
    album_id VARCHAR(50),
    album_name VARCHAR(255),
    album_release_date VARCHAR(10),
    album_total_tracks INT,
    album_type VARCHAR(50),
    track_duration_min DECIMAL(6,2),
    release_year INT
);

SELECT COUNT(*) AS total_rows
FROM spotify_tracks;

INSERT INTO artists (
    artist_name,
    artist_popularity,
    artist_followers
)
SELECT
    artist_name,
    MAX(artist_popularity),
    MAX(artist_followers)
FROM spotify_tracks
WHERE artist_name IS NOT NULL
GROUP BY artist_name;
SELECT COUNT(*) AS total_artists
FROM artists;

INSERT INTO albums (
    album_id,
    album_name,
    album_release_date,
    release_year,
    album_total_tracks,
    album_type,
    artist_id
)
SELECT
    s.album_id,
    MAX(s.album_name),
    MAX(s.album_release_date),
    MAX(s.release_year),
    MAX(s.album_total_tracks),
    MAX(s.album_type),
    MAX(a.artist_id)
FROM spotify_tracks s
LEFT JOIN artists a
    ON s.artist_name = a.artist_name
GROUP BY s.album_id;

SELECT COUNT(*) AS total_albums
FROM albums;

INSERT INTO tracks (
    track_id,
    track_name,
    track_number,
    track_popularity,
    explicit,
    track_duration_min,
    album_id,
    artist_id
)
SELECT
    s.track_id,
    s.track_name,
    s.track_number,
    s.track_popularity,
    s.explicit,
    s.track_duration_min,
    s.album_id,
    a.artist_id
FROM spotify_tracks s
LEFT JOIN artists a
    ON s.artist_name = a.artist_name;
    
    SELECT COUNT(*) AS total_tracks
FROM tracks;

SELECT
    SUM(album_id IS NULL) AS missing_album_id,
    SUM(artist_id IS NULL) AS missing_artist_id
FROM tracks;

INSERT IGNORE INTO genres (genre_name)

WITH RECURSIVE genre_split AS (
    SELECT
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
        TRIM(SUBSTRING_INDEX(remaining_genres, ',', 1)),
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

SELECT DISTINCT genre
FROM genre_split
WHERE genre IS NOT NULL
AND genre <> '';

SELECT COUNT(*) AS total_genres
FROM genres;
SELECT *
FROM genres
LIMIT 20;

SELECT DISTINCT artist_genres
FROM spotify_tracks
WHERE artist_genres LIKE '%,%'
AND artist_genres REGEXP ',[^ ]';

SELECT
    genre_id,
    genre_name,
    LENGTH(genre_name) AS name_length
FROM genres
ORDER BY genre_name;
SELECT *
FROM genres
WHERE TRIM(genre_name) = '';

SELECT genre_name, COUNT(*) AS occurrences
FROM genres
GROUP BY genre_name
ORDER BY genre_name;

SELECT genre_name
FROM genres
WHERE genre_name IS NULL
   OR TRIM(genre_name) = ''
   OR genre_name LIKE '%[%'
   OR genre_name LIKE '%]%'
   OR genre_name LIKE '%''%';

WITH RECURSIVE genre_split AS (
    SELECT
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
        TRIM(SUBSTRING_INDEX(remaining_genres, ',', 1)),
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

SELECT COUNT(DISTINCT genre) AS distinct_genres
FROM genre_split
WHERE genre IS NOT NULL
AND genre <> '';

INSERT IGNORE INTO track_genres (track_id, genre_id)

WITH RECURSIVE genre_split AS (
    SELECT
        track_id,
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
    gs.track_id,
    g.genre_id
FROM genre_split gs
JOIN genres g
    ON gs.genre = g.genre_name
WHERE gs.genre IS NOT NULL
AND gs.genre <> '';

SELECT COUNT(*) AS total_track_genre_links
FROM track_genres;

SELECT
    SUM(t.track_id IS NULL) AS missing_track,
    SUM(g.genre_id IS NULL) AS missing_genre
FROM track_genres tg
LEFT JOIN tracks t
    ON tg.track_id = t.track_id
LEFT JOIN genres g
    ON tg.genre_id = g.genre_id;
    
    SELECT COUNT(*) AS total_albums
FROM albums;

SELECT *
FROM albums
WHERE album_id = '4piJq7R3gjUOxnYs6lDCTg';

SELECT COUNT(*) AS total_albums
FROM albums;
SELECT *
FROM albums
WHERE album_id = '4piJq7R3gjUOxnYs6lDCTg';