
select
    orders.store_id,
    stores.store_name,

    count(distinct orders.order_id) as total_orders,
    sum(orders.subtotal) as total_sales_before_tax,
    sum(orders.total_items) as total_units_sold,

    round(avg(orders.subtotal), 2) as average_order_value

from {{ ref('fct_orders') }} as orders

left join {{ ref('stg_stores') }} as stores
    on orders.store_id = stores.store_id

group by
    orders.store_id,
    stores.store_name
