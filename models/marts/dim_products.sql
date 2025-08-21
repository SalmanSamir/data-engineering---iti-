{{ config(materialized='table') }}

select
    PRODUCT_ID,
    PRODUCT_NAME,
    PRODUCT_PRICE,
    PRODUCT_CATEGORY
from {{ ref('stg_products') }}