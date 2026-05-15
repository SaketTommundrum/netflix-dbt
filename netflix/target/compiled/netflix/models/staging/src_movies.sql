WITH raw_movies AS (
    SELECT * FROM NETFLIX.raw.raw_movies
)

SELECT      
    movieId as movie_id,
    title,
    genres,
FROM raw_movies