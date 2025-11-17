{{ config(materialized="table") }}

select
    upper(trim(merchant)) as merchant_name,
    count(*) as total_transactions,
    sum(amount) as total_amount
from {{ ref('conformed_transactions') }}
where merchant is not null
group by 1
-- working for dev