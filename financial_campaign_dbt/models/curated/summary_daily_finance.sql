{{ config(materialized="table") }}

select
    date_trunc('day', transaction_date) as day,
    count(*) as total_transactions,
    sum(amount) as total_amount
from {{ ref('conformed_transactions') }}
group by 1
order by 1
-- working for uat