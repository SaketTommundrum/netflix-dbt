
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select rating
from NETFLIX.DEV.fct_ratings
where rating is null



  
  
      
    ) dbt_internal_test