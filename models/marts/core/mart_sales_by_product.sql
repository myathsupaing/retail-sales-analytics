select
    product_sku,
    product_name,
    product_type,

    count(item_id) as units_sold,
    count(distinct order_id) as number_of_orders,

    sum(item_revenue) as total_sales,
    round(avg(item_revenue), 2) as average_item_price

from {{ ref('fct_sales') }}

group by
    product_sku,
    product_name,
    product_type