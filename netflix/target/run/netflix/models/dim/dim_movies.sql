
  
    

        create or replace transient table NETFLIX.DEV.dim_movies
         as
        (WITH src_movies AS (
    SELECT * FROM NETFLIX.DEV.src_movies
)

SELECT 
    movie_id,
    initcap(trim(title)) AS movie_title,
    SPLIT(genres, '|') AS genre_array,
    genres
FROM src_movies
        );
      
  