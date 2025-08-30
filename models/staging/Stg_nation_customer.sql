{{ config(materialized='table',transient=false) }}


Select 
* from 
{{ref('stg_customer')}} C
inner join 
{{ref('stg_nation')}} N
ON C.C_NATIONKEY=N.N_NATIONKEY