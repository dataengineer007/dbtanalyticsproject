{{config(materialized='table')}}

with cte as 
(Select * from Snowflake_sample_data.Tpch_sf1.Nation
)
Select * from cte 