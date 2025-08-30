with cte as 
(
    Select * from SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.ORDERS
)
Select * from CTE