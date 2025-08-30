{{ config(materialized='view',secure=true) }}

WITH CTE AS
(
    Select * FROM SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.NATION

)
Select * from CTE