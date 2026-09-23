compose:
    docker compose up -d

decompose:
    docker compose down

restart:
    docker compose down -v
    docker compose up -d
    just migrate


migrate:
    docker compose logs migrate
    
connect-to-postgres:
    docker compose exec db psql -U papirates-user-dev -d papirates-dev
    # alternatively, `psql -h localhost -p 5432 -U papirates-user-dev -d papirates-dev`


update-orm:
    cd server && direnv exec . gleam run -m squirrel

get-new-server-key:
    openssl rand -hex 64

start directory:
    cd {{directory}} && direnv exec . gleam run -m lustre/dev start

shell directory:
    cd {{directory}} && direnv exec . gleam shell

test directory:
    cd {{directory}} && direnv exec . gleam test

unmigrate:
    docker compose run --rm migrate \
    -path /migrations \
    -database 'postgres://papirates-user-dev:papirates-dev-p@ssw0rd@db:5432/papirates-dev?sslmode=disable' \
    down