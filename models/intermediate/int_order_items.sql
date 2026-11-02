select
    items.item_id,
    items.order_id,
    items.product_sku,
    orders.customer_id,
    orders.ordered_at,
    orders.store_id,
    products.product_name,
    products.product_type,
    products.price

from {{ ref('stg_items') }} as items

left join {{ ref('stg_orders') }} as orders
    on items.order_id = orders.order_id

left join {{ ref('stg_products') }} as products
    on items.product_sku = products.sku