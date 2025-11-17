{{ config(materialized="table") }}

select
    transaction_id,
    date as transaction_date,
    initcap(merchant) as merchant,
    amount::number(12,2) as amount,
    currency,
    current_timestamp() as sanitized_at
from {{ ref('stg_bank_transactions') }}
-- working for internal