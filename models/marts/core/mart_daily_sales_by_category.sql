select
    date(ordered_at) as sales_date,

    product_type,

    count(item_id) as units_sold,

    count(distinct order_id) as total_orders,

    sum(item_revenue) as total_sales,

    round(avg(item_revenue), 2) as average_item_revenue

from {{ ref('fct_sales') }}

group by
    sales_date,
    product_type