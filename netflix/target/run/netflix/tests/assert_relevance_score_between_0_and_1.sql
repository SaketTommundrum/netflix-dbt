
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  SELECT * 
FROM NETFLIX.DEV.fct_genome_score
WHERE relevance_score<0 AND relevance_score>1
  
  
      
    ) dbt_internal_test