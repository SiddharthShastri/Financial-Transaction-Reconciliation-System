🚀 Project Overview

This repository contains a complete Financial Transaction Reconciliation System built using dbt and Snowflake.
The project automates the process of cleaning, standardizing, matching, and preparing financial transaction data coming from multiple systems such as bank feeds and internal ledgers.

The system uses a structured, multi-layered data pipeline to ensure that every transformation step is traceable, repeatable, audit-ready, and environment-specific (Dev, Internal, UAT).

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

If you want to run ALL + TESTS for each target:

DEV
  * dbt build --target dev

INTERNAL
  * dbt build --target internal

UAT
  * dbt build --target uat

🎯 Purpose of the Project
✔ Standardize fragmented transaction data

Bank and ledger files come in different structures.
This pipeline normalizes them so they follow a consistent format.

✔ Automate reconciliation

The system matches internal ledger entries with bank transactions using:

Amount

Date

Merchant

Normalized identifiers

This reduces manual financial reconciliation.

✔ Maintain clean, auditable data

Each layer of the pipeline provides increasing quality and structure:

Staging – Raw ingested data

Sanitized – Cleaned + standardized fields

Conformed – Matched and reconciled transaction pairs

Curated – Final business-friendly tables for reporting

✔ Support isolated environments

Each environment automatically generates its own transformation databases:

Environment	Databases Created
Dev	dev_staging, dev_sanitized, dev_conformed, dev_curated
Internal	internal_staging, internal_sanitized, internal_conformed, internal_curated
UAT	uat_staging, uat_sanitized, uat_conformed, uat_curated

This prevents dataset collisions and ensures safe development/testing.

🧩 What This Project Does

Cleans raw financial datasets

Normalizes inconsistent formats

Reconciles ledger vs. bank transactions

Generates summary-ready curated outputs

Builds isolated Snowflake databases for each environment

Automates all transformations using dbt

🏗 Tech Stack

dbt Core

Snowflake

SQL (Analytical & Transformation logic)

Jinja / dbt Macros

📁 Project Structure
financial_campaign_dbt/
│
├── models/
│   ├── staging/
│   ├── sanitized/
│   ├── conformed/
│   └── curated/
│
├── macros/
│   ├── create_env_db.sql
│   ├── create_env_sanitized.sql
│   ├── create_env_conformed.sql
│   └── create_env_curated.sql
│
├── dbt_project.yml
└── profiles.yml

📊 End-to-End Data Flow
Raw Data → Staging → Sanitized → Conformed → Curated → Analytics

📄 Summary

This project provides a complete, automated financial reconciliation workflow.
It ensures data accuracy, eliminates manual matching, supports clean reporting, and allows multiple environments to operate independently.

A scalable and enterprise-ready foundation for financial data engineering.

### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
