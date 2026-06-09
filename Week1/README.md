# Week 1 — Data Engineering and Basic SQL

## Setup

**1. Start the database (If you are using docker for postgres) **

```bash
docker compose up -d
```

**2. Create a virtual environment and install dependencies**

```bash
python3 -m venv .venv
source .venv/bin/activate        # Windows: .venv\Scripts\activate
pip install -r requirements.txt
```

**3. Load the dataset**

```bash
python load.py
```

This creates the `rides` table and bulk-loads `rides.csv` into PostgreSQL. You should see a row count and a breakdown by ride status when it finishes.

**4. Query the data**

```bash
docker exec -it course_postgres psql -U postgres -d ridedb
```

```sql
SELECT * FROM rides LIMIT 10;
```

**5. Stop the container when done**

```bash
docker compose down
```
