
  create or replace   view NETFLIX.DEV.src_tags
  
   as (
    WITH raw_tags AS (
    SELECT * FROM NETFLIX.RAW.RAW_TAGS
)

SELECT 
    userId as user_id,
    movieId as movie_id,
    tag,
    to_timestamp_ltz(timestamp) as tag_timestamp
FROM raw_tags
  );

