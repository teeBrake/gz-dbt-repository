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

    f.date
,   (f.operational_margin - c.ads_cost)
,   ()



FROM {{ ref('finance_days') }} as f
JOIN {{ ref('int_campaigns') }} as c