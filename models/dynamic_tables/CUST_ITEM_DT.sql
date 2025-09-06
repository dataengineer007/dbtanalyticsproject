
{{ config(
    materialized='dynamic_table'
    , snowflake_warehouse = 'COMPUTE_WH'
    , target_lag = '1 MINUTES'
    
)}}

With CUST_ITEM_DT as 
(

select c.cust_id,         c.cust_name,         c.crid,         c.location,
         c.cust_created,         I.item_id,
         I.item_category,         I.item_status,
         I.price,         I.counts,
         ROUND(I.price / I.counts,2) AS Price_Per_item
  from {{ref('CUSTOMER_DT')}} c
  inner join 
       {{ ref('ITEM_DT')}} I
  ON c.cust_id = I.cust_id

)
select * from CUST_ITEM_DT 