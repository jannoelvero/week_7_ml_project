CREATE TABLE IF NOT EXISTS `artists` (
	`artist_id` INT NOT NULL AUTO_INCREMENT,
	`artist_name` VARCHAR(255) NOT NULL,
	`artist_popularity` DECIMAL NOT NULL,
	`artist_follower` BIGINT NOT NULL,
	PRIMARY KEY(`artist_id`)
);


CREATE TABLE IF NOT EXISTS `albums` (
	`album_id` VARCHAR(255) NOT NULL,
	`album_name` VARCHAR(255) NOT NULL,
	`album_release_date` VARCHAR(255) NOT NULL,
	`release_year` INT NOT NULL,
	`album_total_tracks` INT NOT NULL,
	`album_type` VARCHAR(255) NOT NULL,
	`artit_id` INT NOT NULL,
	PRIMARY KEY(`album_id`)
);


CREATE TABLE IF NOT EXISTS `tracks` (
	`track_id` VARCHAR(255) NOT NULL,
	`track_name` VARCHAR(255) NOT NULL,
	`track_number` INT NOT NULL,
	`track_popularity` INT NOT NULL,
	`explicit` BOOLEAN NOT NULL,
	`track_duration_min` DECIMAL NOT NULL,
	`album_id` VARCHAR(255) NOT NULL,
	`artist_id` INT NOT NULL,
	PRIMARY KEY(`track_id`)
);


CREATE TABLE IF NOT EXISTS `genres` (
	`genre_id` INT NOT NULL AUTO_INCREMENT,
	`genre_naame` VARCHAR(255) NOT NULL,
	PRIMARY KEY(`genre_id`)
);


CREATE TABLE IF NOT EXISTS `track_genres` (
	`track_id` VARCHAR(255) NOT NULL,
	`genre_id` INT NOT NULL,
	PRIMARY KEY(`track_id`)
);


ALTER TABLE `artists`
ADD FOREIGN KEY(`artist_id`) REFERENCES `albums`(`artit_id`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `albums`
ADD FOREIGN KEY(`album_id`) REFERENCES `tracks`(`album_id`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `tracks`
ADD FOREIGN KEY(`track_id`) REFERENCES `track_genres`(`track_id`)
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE `track_genres`
ADD FOREIGN KEY(`genre_id`) REFERENCES `genres`(`genre_id`)
ON UPDATE NO ACTION ON DELETE NO ACTION;