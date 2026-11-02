
select
    orders.customer_id,
    customers.customer_name,

    count(distinct orders.order_id) as total_orders,

    sum(orders.subtotal) as total_spend_before_tax,

    round(avg(orders.subtotal), 2) as average_order_value,

    max(orders.ordered_at) as most_recent_order

from {{ ref('fct_orders') }} as orders

left join {{ ref('stg_customers') }} as customers
    on orders.customer_id = customers.customer_id

group by
    orders.customer_id,
    customers.customer_name
