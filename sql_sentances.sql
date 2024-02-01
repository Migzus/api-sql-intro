-- Core ------------------

CREATE TABLE movies(
    id SERIAL,
    title TEXT,
    genre TEXT,
    release_year INTEGER,
    score INTEGER,
    UNIQUE (title)
)

INSERT INTO movies (title, genre, release_year, score)
VALUES 
    ('The Shawshank Redemption', 'Drama', 1994, 9),
	('The Godfather', 'Crime', 1972, 9),
	('The Dark Knight', 'Action', 2008, 9),
	('Alien', 'SciFi', 1979, 9),
	('Total Recall', 'SciFi', 1990, 8),
	('The Matrix', 'SciFi', 1999, 8),
	('The Matrix Resurrections', 'SciFi', 2021, 5),
	('The Matrix Reloaded', 'SciFi', 2003, 6),
	('The Hunt for Red October', 'Thriller', 1990, 7),
	('Misery', 'Thriller', 1990, 7),
	('The Power Of The Dog', 'Western', 2021, 6),
	('Hell or High Water', 'Western', 2016, 8),
	('The Good the Bad and the Ugly', 'Western', 1966, 9),
	('Unforgiven', 'Western', 1992, 7)

SELECT * FROM movies
SELECT * FROM movies ORDER BY score DESC
SELECT * FROM movies ORDER BY release_year ASC
SELECT * FROM movies WHERE score >= 8
SELECT * FROM movies WHERE score < 8
SELECT * FROM movies WHERE release_year = 1990
SELECT * FROM movies WHERE release_year <= 2000
SELECT * FROM movies WHERE release_year > 1990
SELECT * FROM movies WHERE release_year BETWEEN 1990 AND 1999 
SELECT * FROM movies WHERE genre = 'SciFi'
SELECT * FROM movies WHERE genre = 'SciFi' OR genre = 'Western'
SELECT * FROM movies WHERE genre != 'SciFi'
SELECT * FROM movies WHERE genre = 'Western' AND release_year < 2000
SELECT * FROM movies WHERE title LIKE('%Matrix%')

-- Extension 1 --------------------------

SELECT AVG(score) FROM movies 
SELECT COUNT(title) FROM movies 
SELECT AVG(score), genre FROM movies GROUP BY genre

-- Extension 2 --------------------------

CREATE TABLE directors(
    directorID SERIAL,
    name TEXT,
    PRIMARY KEY (directorID)
)

-- Including the new updated version of the movies table

CREATE TABLE movies(
    id SERIAL,
    title TEXT,
    genre TEXT,
    release_year INTEGER,
    score INTEGER,
    directorID INTEGER,
    UNIQUE (title),
    FOREIGN KEY (directorID) REFERENCES directors(directorID)
)

SELECT id, directors.name, title, genre
FROM movies
INNER JOIN directors ON movies.directorID=directors.directorID

-- Extension 3 --------------------------

SELECT COUNT(title), directors.name
FROM movies
INNER JOIN directors ON movies.directorID=directors.directorID
GROUP BY directors.name