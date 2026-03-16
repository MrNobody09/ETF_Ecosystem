# etf-agent-os

ETF Agent OS is a monorepo for an AI-powered ETF research platform with a FastAPI backend, Next.js frontend, and PostgreSQL database.

## Setup Instructions

1. Copy environment variables:
   ```bash
   cp .env.example .env
   ```
2. (Optional local backend run) Create a Python virtual environment and install dependencies:
   ```bash
   cd backend
   python -m venv .venv
   source .venv/bin/activate
   pip install -r requirements.txt
   ```
3. (Optional local frontend run) Install Node dependencies:
   ```bash
   cd frontend
   npm install
   ```

## Run with Docker

From the `etf-agent-os` directory:

```bash
docker compose up --build
```

Services:
- Frontend: http://localhost:3000
- Backend API: http://localhost:8000
- Health endpoint: http://localhost:8000/health
- PostgreSQL: localhost:5432

## Backend Notes

- FastAPI entrypoint: `backend/api/main.py`
- Health endpoint: `GET /health` returns `{ "status": "ok" }`
- SQLAlchemy session setup: `backend/database/session.py`
- Alembic config:
  - `backend/alembic.ini`
  - `backend/database/migrations/env.py`

## Testing

Run backend tests:

```bash
cd backend
pytest
```

## Project Structure

```text
etf-agent-os/
├── frontend/
│   ├── app/
│   │   ├── agents/
│   │   ├── compare/
│   │   └── search/
│   ├── components/
│   ├── services/
│   └── utils/
├── backend/
│   ├── api/
│   │   ├── controllers/
│   │   ├── routes/
│   │   └── schemas/
│   ├── agents/
│   │   ├── comparison_agent/
│   │   ├── discovery_agent/
│   │   ├── ranking_agent/
│   │   └── research_agent/
│   ├── tools/etf_tools/
│   ├── services/
│   │   ├── etf_service/
│   │   └── scoring_service/
│   ├── core/
│   │   ├── config/
│   │   ├── logging/
│   │   └── orchestration/
│   ├── database/
│   │   ├── migrations/
│   │   └── models/
│   ├── data/seed_etfs/
│   ├── scripts/ingestion/
│   ├── docs/
│   └── tests/
├── .env.example
├── docker-compose.yml
└── README.md
```
