select
    string_field_0 as customer_id,
    string_field_1 as customer_name
from {{ source('raw_data', 'raw_customers') }}
where string_field_0 != 'ID'