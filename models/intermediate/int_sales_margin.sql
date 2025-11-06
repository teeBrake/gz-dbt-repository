-- first intermediate table

select

        sales.*
    ,   product.purchase_price
    ,   sales.quantity * product.purchase_price as purchase_cost
    ,   ROUND(revenue - (sales.quantity * product.purchase_price),2) as margin
    ,   {{ margin_percent('revenue', 'sales.quantity*purchase_price')}} as margin_percent
from {{ ref('stg_raw__sales') }} as sales 
join {{ ref('stg_raw__product') }} as product 
USING(products_id)

