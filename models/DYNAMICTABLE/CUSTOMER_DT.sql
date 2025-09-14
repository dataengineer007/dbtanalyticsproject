{{ config(
    materialized='dynamic_table'
    , snowflake_warehouse = 'COMPUTE_WH'
    , target_lag = 'DOWNSTREAM'
    
)}}

With Customers_DT as 
(
select cust_id,cust_name,outstanding_amt,CRID,location,CUST_CREATED from 
{{ source('RAWLAYER', 'STG_CUSTOMER') }} qualify row_number() 
over (partition by cust_id  order by cust_created desc) = 1
)
select * from Customers_DT