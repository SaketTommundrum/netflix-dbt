# netflix — dbt project

Brief learning/example dbt project that transforms MovieLens CSVs into staged
models and marts for analytics.

## Quick start

1. Clone the repo:
   ```bash
   git clone <https://github.com/SaketTommundrum/netflix-dbt>
   cd netflix-dbt
   ```
2. Create and activate a virtual environment (Windows):
   ```powershell
   python -m venv netflix-dbt-env
   /aws_chunking_ratings.py
   ```

# Netflix — dbt MovieLens pipeline

Production-style ELT pipeline (learning/example) that ingests MovieLens raw
data and transforms it into clean, tested, and documented analytical models.

🛠️ Tech stack
| Tool | Purpose |
| ---- | ------- |
| dbt Core 1.11 | Transformations, tests, docs |
| Warehouse (configure in profiles.yml) | Target database/schema (example: `NETFLIX.RAW`) |
| Python 3.x | Virtual environment and helper scripts |
| Git + GitHub | Version control |

📁 Project structure (key files)

```
models/
├── staging/
│   ├── src_movies.sql          # Reads RAW_MOVIES -> selects movie_id, title, genres
│   ├── src_ratings.sql         # Source model for ratings
│   ├── src_tags.sql
│   ├── src_links.sql
│   ├── src_genome_tags.sql
│   └── src_genome_score.sql
├── dim/
│   ├── dim_users.sql          # Distinct users from ratings and tags
│   ├── dim_movies.sql
│   └── dim_genome_tags.sql
└── marts/
    ├── fct_ratings.sql        # Incremental fact table of ratings
    └── fct_genome_score.sql   # Genome score fact table
```

Other important files:

- `dbt_project.yml` — project config and default materializations.
- `macros/`, `seeds/`, `snapshots/`, `analyses/`, `tests/` — dbt conventions.
- `aws_chunking_ratings.py` — helper to upload MovieLens CSVs to S3 (not part of dbt).

📊 Data models

stg (staging) models (views)

- `stg` / `src_*` models normalize and standardize raw columns from your
  `RAW` schema and filter out clearly invalid rows.

Fact model — `fct_ratings` (Incremental table)

- Aggregates/cleans rating events and is materialized as `incremental`.
- Uses `rating_timestamp` to append only newer rows during incremental runs.

Dimension models — `dim_movies`, `dim_users`, `dim_genome_tags`

- Provide lookup tables for joining to facts and for downstream analytics.

✅ Data quality tests

- Project includes a `tests/` directory for model-level custom tests and
  assertions (e.g., non-null keys, positive fares/ratings). Run `dbt test`
  to execute all configured tests.

🚀 How to run

Prerequisites

- Python 3.x
- dbt installed in your virtualenv (see `requirements.txt`)
- `profiles.yml` configured at `~/.dbt/profiles.yml` for your target warehouse

Setup

```powershell
# clone
git clone <your-repo-url>
cd netflix-dbt

# create/activate venv (Windows)
python -m venv netflix-dbt-env
.\netflix-dbt-env\Scripts\Activate.ps1

# install deps
python -m pip install -r requirements.txt
```

Run the pipeline

```powershell
# full refresh (first run)
dbt run --full-refresh

# incremental runs (new data only)
dbt run

# run tests
dbt test

# docs
dbt docs generate
dbt docs serve
```

📈 Pipeline architecture

Raw source tables (e.g., `NETFLIX.RAW.*`) → `models/staging/src_*` (views) →
`models/dim/*` and `models/marts/*` (tables/facts). `fct_ratings` is incremental
and designed to append new rating events by `rating_timestamp`.

## Security & git

Make sure `.gitignore` contains:

```
netflix-dbt-env/
logs/
netflix-dbt-user_accessKeys.csv
.env
/aws_chunking_ratings.py
```

If sensitive files were previously committed, rotate credentials immediately
and consider history cleanup with `git filter-repo` or BFG.

---

If you want, I can:

- Commit this README change for you
- Add a `profiles.yml` example for Snowflake/BigQuery
- Pin `requirements.txt` directly from your virtualenv

```powershell
python -m venv netflix-dbt-env
.\netflix-dbt-env\Scripts\Activate.ps1
```

2. Install dependencies:
   ```bash
   python -m pip install -r requirements.txt
   ```
3. Run dbt models:
   - Run all models: `dbt run`
   - Run a specific model: `dbt run -s models/marts/fct_ratings.sql` or
     `dbt run -m marts.fct_ratings`
   - Run tests: `dbt test`

Tip: `fct_ratings` is incremental and will append rows where
`rating_timestamp` is greater than the current table max.

## Development / VS Code

- Select the workspace Python interpreter: use
  `netflix-dbt-env\Scripts\python.exe` (Ctrl+Shift+P → `Python: Select Interpreter`).
- If the dbt VS Code extension reports "dbt not found", point the extension's
  Python/dbt path to the same interpreter or activate the venv in the integrated
  terminal before starting VS Code.
