select
    sku,
    name as product_name,
    type as product_type,
    price,
    description
from {{ source('raw_data', 'raw_products') }}
