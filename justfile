compose:
    docker compose up -d

decompose:
    docker compose down

migrate:
    docker compose logs migrate
    
connect_to_postgres:
    docker compose exec db psql -U papirates-user-dev -d papirates-dev
    # alternatively, `psql -h localhost -p 5432 -U papirates-user-dev -d papirates-dev`
