{{config(materialized='table')}}

With cte As 
(
Select * from 
Snowflake_sample_data.Tpch_sf1.Customer
)
Select * from cte