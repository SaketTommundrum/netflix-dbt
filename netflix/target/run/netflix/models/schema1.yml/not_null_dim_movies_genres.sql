
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select genres
from NETFLIX.DEV.dim_movies
where genres is null



  
  
      
    ) dbt_internal_test