package database

import (
	"fmt"

	"gorm.io/driver/postgres"
	"gorm.io/gorm"
)

type Mysql struct {
	GormDB *gorm.DB
}

func MysqlConnStr(host, port, unm, pwd, db string) string {
	return fmt.Sprintf("host=%s user=%s password=%s dbname=%s port=%s", host, port, unm, pwd, db)
}

func NewMysql(connstr string) (Mysql, error) {
	db, err := gorm.Open(postgres.Open(connstr), &gorm.Config{})

	if err != nil {
		return Mysql{}, err
	}

	return Mysql{
		GormDB: db,
	}, nil
}

func (m Mysql) Close() error {
	db, err := m.GormDB.DB()
	if err != nil {
		return err
	}
	return db.Close()
}
