
{{ config(materialized='table') }}

with orders_items as (
    select
        ITEM_ID,
        ORDER_ID,
        PRODUCT_ID,
        QUANTITY,
        UNIT_PRICE,
        QUANTITY * UNIT_PRICE as TOTAL_PRICE
    from {{ ref('stg_order_items') }}
),

orders as (
    select
        ORDER_ID,
        CUSTOMER_ID,
        ORDER_DATE,
        ORDER_STATUS
    from {{ ref('stg_orders') }}
)

select
    oi.ITEM_ID,
    oi.ORDER_ID,
    o.CUSTOMER_ID,
    oi.PRODUCT_ID,
    o.ORDER_DATE,
    o.ORDER_STATUS,
    oi.QUANTITY,
    oi.UNIT_PRICE,
    oi.TOTAL_PRICE
from orders_items oi
left join orders o
    on o.ORDER_ID = oi.ORDER_ID
