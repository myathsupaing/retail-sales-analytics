select
    string_field_0 as item_id,
    string_field_1 as order_id,
    string_field_2 as product_sku
from {{ source('raw_data', 'raw_items') }}
where string_field_0 != 'id'