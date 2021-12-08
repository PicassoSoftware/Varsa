package database

import (
    "database/sql"
    "github.com/lib/pq"
    "os"
)

func OpenDb(){
    url := os.Getenv("postgres://vrwefgmxgaoqnt:3f7b39c9726f848771b97ccac65e53bad3b28e6a8f2f8c71265e5e92d750bcd6@ec2-54-160-35-196.compute-1.amazonaws.com:5432/d1s7p6c803bq6n")
    connection, _ := pq.ParseURL(url)
    connection += " sslmode=require"

    db, err := sql.Open("postgres", connection)
    if err != nil {
        println(err)
    }

    println("düzeldi: ")
    println(db)
}