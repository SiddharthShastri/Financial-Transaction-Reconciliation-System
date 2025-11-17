{{ config(materialized="table") }}

-- Use conformed unified dataset
with base as (
    select
        transaction_id,
        transaction_date,
        merchant,
        amount,
        currency,
        source_system
    from {{ ref('conformed_transactions') }}
)

select
    *,
    sum(amount) over (
        partition by merchant order by transaction_date
    ) as running_merchant_total
from base
-- working for dev