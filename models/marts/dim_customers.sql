{{ config(materialized='table') }}

select
    CUSTOMER_ID,
    CUSTOMER_NAME,
    EMAIL,
    COUNTRY
from {{ ref('stg_customers') }}