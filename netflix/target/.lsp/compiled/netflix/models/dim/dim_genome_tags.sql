WITH src_genome_tags AS (
    SELECT * FROM NETFLIX.DEV.src_genome_tags
)

SELECT 
    tag_id,
    INITCAP(TRIM(tag)) AS tag_name
FROM src_genome_tags