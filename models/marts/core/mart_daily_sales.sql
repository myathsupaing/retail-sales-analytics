select
    date(ordered_at) as sales_date,

    count(distinct order_id) as total_orders,

    sum(item_revenue) as total_sales,

    count(item_id) as total_units_sold,

    round(
        sum(item_revenue) / count(distinct order_id),
        2
    ) as average_order_value

from {{ ref('fct_sales') }}

group by
    sales_date