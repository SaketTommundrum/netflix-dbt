
  
    

        create or replace transient table NETFLIX.DEV.dim_movies
         as
        (SELECT 
    movie_id,
    initcap(trim(title)) AS movie_title,
    SPLIT(genres, '|') AS genre_array,
    genres
FROM NETFLIX.DEV.src_movies
        );
      
  