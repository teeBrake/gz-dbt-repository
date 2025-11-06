/* Create finance_campaigns_day.sql Mart Model */

/* The model should create a view with the following columns:

    date
    ads_margin
    average_basket
    operational_margin
    ads_cost
    ads_impression
    ads_clicks
    quantity
    revenue
    purchase_cost
    margin
    shipping_fee
    log_cost
    ship_cost
*/

SELECT

    f.date_date
,   (f.total_operational_margin - c.ads_cost) as ads_margin
,   f.Average_Basket    as average_basket
,   f.total_operational_margin  as operational_margin
,   c.ads_cost  as ads_cost
,   c.impression as ads_impression
,   c.click as ads_clicks
,   f.total_quantity_of_products_sold as quantity
,   f.Total_revenue as revenue
,   f.total_purchase_cost as purchase_cost
,   f.Total_revenue-f.total_purchase_cost as margin
,   f.total_shipping_fee as shipping_fee
,   f.total_log_cost    as log_cost
,   f.ship_cost   as ship_cost


FROM {{ ref('finance_days') }} as f
JOIN {{ ref('int_campaigns_day') }} as c
USING(date_date)