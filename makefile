postgres:
	sudo docker run --name some -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=root -d postgres:12-alpine

create_db:
	sudo docker exec -it some createdb --username=root --owner=root simplebank

drop_db:
	sudo docker exec -it some dropdb simplebank

migrate_up:
	migrate -path db/migration -database "postgres://root:root@localhost:5432/root?sslmode=disable" -verbose up

sqlc:
	sqlc generate

migrate_down:
	migrate -path db/migration -database "postgres://root:root@localhost:5432/root?sslmode=disable" -verbose down

.PHONY: postgres create_db drop_db migrate_up migrate_down