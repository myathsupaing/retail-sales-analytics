
select
    customer_id,
    customer_name,

    date_diff(
        date '2016-09-17',
        date(most_recent_order),
        day
    ) as recency_days,

    total_orders as frequency,

    total_spend_before_tax as monetary_value,

    case
        when date_diff(
            date '2016-09-17',
            date(most_recent_order),
            day
        ) <= 3 then 'Recent'
        when date_diff(
            date '2016-09-17',
            date(most_recent_order),
            day
        ) <= 7 then 'Moderate'
        else 'Less Recent'
    end as recency_segment,

    case
        when total_orders >= 7 then 'Frequent'
        when total_orders >= 4 then 'Regular'
        else 'Occasional'
    end as frequency_segment,

    case
        when total_spend_before_tax >= 10000 then 'High Value'
        when total_spend_before_tax >= 5000 then 'Medium Value'
        else 'Low Value'
    end as monetary_segment

from {{ ref('mart_customer_performance') }}
