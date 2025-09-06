{{ config(
    materialized='dynamic_table'
    , snowflake_warehouse = 'COMPUTE_WH'
    , target_lag = 'DOWNSTREAM'
    
)}}

With ITEM_DT as 
(
SELECT *,
           ROW_NUMBER() OVER (PARTITION BY CUST_ID ORDER BY PRICE DESC) AS rn
    FROM 
{{ source('pipeline_source', 'ITEM') }} 
)
select * from ITEM_DT where rn=1
