select
    orders.order_id,
    orders.customer_id,
    orders.store_id,
    orders.ordered_at,

    orders.subtotal,
    orders.tax_paid,
    orders.order_total,

    count(items.item_id) as total_items

from {{ ref('stg_orders') }} as orders

left join {{ ref('int_order_items') }} as items
    on orders.order_id = items.order_id

group by
    orders.order_id,
    orders.customer_id,
    orders.store_id,
    orders.ordered_at,
    orders.subtotal,
    orders.tax_paid,
    orders.order_total