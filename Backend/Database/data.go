package database

import (
    m "varsa/Models"
    "github.com/lib/pq"
    "os"
    "github.com/jinzhu/gorm"
)

func OpenDb(){
    url := os.Getenv("postgres://vrwefgmxgaoqnt:3f7b39c9726f848771b97ccac65e53bad3b28e6a8f2f8c71265e5e92d750bcd6@ec2-54-160-35-196.compute-1.amazonaws.com:5432/d1s7p6c803bq6n")
    connection, _ := pq.ParseURL(url)
    connection += " sslmode=require"

    db, err := gorm.Open("postgres", connection)
    if err != nil {
        println(err)
    }

    defer db.Close()
    db.AutoMigrate(m.Store{})
    db.AutoMigrate(m.Storage{})
    db.AutoMigrate(m.Branchoffice{})
    db.AutoMigrate(m.Cart{})
    db.AutoMigrate(m.Rezervation{})
    db.AutoMigrate(m.Product{})
    

}