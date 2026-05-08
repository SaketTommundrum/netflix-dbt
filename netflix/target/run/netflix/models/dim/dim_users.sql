
  
    

        create or replace transient table NETFLIX.DEV.dim_users
         as
        (WITH src_ratings AS (
    SELECT * FROM NETFLIX.DEV.src_ratings
),

src_tags AS (
    SELECT * FROM NETFLIX.DEV.src_tags
)

SELECT DISTINCT user_id 
FROM (
    SELECT * FROM src_ratings
    UNION
    SELECT * FROM src_tags
)
        );
      
  