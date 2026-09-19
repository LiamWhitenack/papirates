compose:
    docker compose up -d

decompose:
    docker compose down

migrate:
    docker compose logs migrate
    
connect-to-postgres:
    docker compose exec db psql -U papirates-user-dev -d papirates-dev
    # alternatively, `psql -h localhost -p 5432 -U papirates-user-dev -d papirates-dev`


update-orm:
    cd server && direnv exec . gleam run -m squirrel

get-new-server-key:
    openssl rand -hex 64

shell directory=".":
    cd {{directory}} && direnv exec . gleam shell

test directory=".":
    cd {{directory}} && direnv exec . gleam test