package db

import (
	"database/sql"
	_ "github.com/lib/pq"
	"log"
	"testing"
)

const (
	dbDriver = "postgres"
	dbSource = "postgres://root:root@localhost:5432/root?sslmode=disable"
)

var testQueries *Queries

func TestQueries_CreateAccount(t *testing.T) {
	conn, err := sql.Open(dbDriver, dbSource)
	if err != nil {
		log.Fatal("Canot connect: ", err)
	}

	testQueries = New(conn)

}
