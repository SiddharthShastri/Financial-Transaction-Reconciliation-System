🚀 Project Overview

This system simulates an enterprise-grade finance workflow:

1️⃣ Staging Layer (<env>_staging)

Loads raw data from <env>_raw

Performs column cleaning, datatype alignment

Produces:

  * stg_bank_transactions

  * stg_internal_ledger

2️⃣ Sanitized Layer (<env>_sanitized)

Standardizes column formats

Cleans merchant names, dates, numeric precision

Ensures consistent schema across systems

Models:

  * sanitized_bank_transactions

  * sanitized_internal_ledger

3️⃣ Conformed Layer (<env>_conformed)

Merges and aligns data from both sanitized sources

Creates a unified "single version of truth"

Useful for downstream fact/dim modeling

Model:

  * conformed_transactions

4️⃣ Curated Layer (<env>_curated)

Business-ready analytics layer

Includes aggregations, dimensions, fact tables

Models:

  * dim_merchants

  * fact_transactions

summary_daily_finance (daily financial summary report)

🏗️ Automated Environment Database Creation

Using dbt macros, the project automatically creates:

| Environment  | Staging DB         | Sanitized DB         | Conformed DB         | Curated DB         |
| ------------ | ------------------ | -------------------- | -------------------- | ------------------ |
| **dev**      | `dev_staging`      | `dev_sanitized`      | `dev_conformed`      | `dev_curated`      |
| **internal** | `internal_staging` | `internal_sanitized` | `internal_conformed` | `internal_curated` |
| **uat**      | `uat_staging`      | `uat_sanitized`      | `uat_conformed`      | `uat_curated`      |

This requires zero manual Snowflake setup because dbt provisions the required databases automatically.

🛠️ Tech Stack

dbt (Data Build Tool)

Snowflake Cloud Data Warehouse

SQL (Transforms + Modeling)

Jinja (dbt macros)

Welcome to your new dbt project!

### Using the starter project

Try running the following commands:
- dbt run
- dbt test


### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
