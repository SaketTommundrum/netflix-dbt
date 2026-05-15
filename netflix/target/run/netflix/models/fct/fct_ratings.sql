-- back compat for old kwarg name
  
  begin;
    

        insert into NETFLIX.DEV.fct_ratings ("USER_ID", "MOVIE_ID", "RATING", "RATING_TIMESTAMP")
        (
            select "USER_ID", "MOVIE_ID", "RATING", "RATING_TIMESTAMP"
            from NETFLIX.DEV.fct_ratings__dbt_tmp
        );
    commit;