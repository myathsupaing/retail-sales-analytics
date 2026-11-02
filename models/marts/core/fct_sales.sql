select
    item_id,
    order_id,
    customer_id,
    store_id,
    ordered_at,
    product_sku,
    product_name,
    product_type,
    price as product_price,

    -- Revenue at item level
    price as item_revenue

from {{ ref('int_order_items') }}