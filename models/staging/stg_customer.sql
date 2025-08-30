{{ config(materialized='ephemeral') }}

with cte as 
(
    Select * from SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.CUSTOMER
)
SELECT * FROM CTE