
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select relevance_score
from NETFLIX.DEV.fct_genome_score
where relevance_score is null



  
  
      
    ) dbt_internal_test