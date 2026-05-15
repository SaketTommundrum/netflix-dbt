__dbt__cte__dim_movie_w_tags as (


WITH movies AS (
    SELECT * FROM NETFLIX.DEV.dim_movies
),
tags AS (
    SELECT * FROM NETFLIX.DEV.dim_genome_tags
),
scores AS (
    SELECT * FROM NETFLIX.DEV.fct_genome_score
)

SELECT 
    m.movie_title,
    m.genre_array,
    t.tag_name,
    s.relevance_score
FROM movies m 
LEFT JOIN scores s ON m.movie_id = s.movie_id
LEFT JOIN tags t ON s.tag_id = t.tag_id

)