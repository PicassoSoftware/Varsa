package main

import (
	"fmt"
	d "varsa/Database"
	m "varsa/Models"
)

func main() {
	fmt.Println("Program başladı")
	connstr := d.MysqlConnStr("ec2-54-160-35-196.compute-1.amazonaws.com", "vrwefgmxgaoqnt", "3f7b39c9726f848771b97ccac65e53bad3b28e6a8f2f8c71265e5e92d750bcd6", "d1s7p6c803bq6n", "5432")
	db, err := d.NewMysql(connstr)
	if err != nil {
		fmt.Println("Database'e bağlanamadı.")
	}

	db.GormDB.AutoMigrate(m.Store{})
	db.GormDB.AutoMigrate(m.Branchoffice{})
	db.GormDB.AutoMigrate(m.Product{})
	db.GormDB.AutoMigrate(m.Cart{})
	db.GormDB.AutoMigrate(m.Storage{})

	// use mysql
}
