
  
    

        create or replace transient table NETFLIX.DEV.fct_ratings
         as
        (

WITH src_ratings AS (
    SELECT * FROM NETFLIX.DEV.src_ratings
)

SELECT 
    user_id,
    movie_id,
    rating,
    rating_timestamp
FROM src_ratings
WHERE rating_timestamp IS NOT NULL


        );
      
  