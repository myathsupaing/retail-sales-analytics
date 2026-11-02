select
	id as supply_id,
	name as supply_name,
	cost,
	perishable,
	sku as product_sku
from {{ source('raw_data', 'raw_supplies') }}
