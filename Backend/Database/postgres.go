package database

import (
	"fmt"
	model "varsa/models"
	"gorm.io/driver/postgres"
	"gorm.io/gorm"
)

type Posgres struct {
	GormDB *gorm.DB
}

func ConnStr(host, port, unm, pwd, db string) string {
	return fmt.Sprintf("host=%s user=%s password=%s dbname=%s port=%s", host, port, unm, pwd, db)
}

func NewPosgres(connstr string) (Posgres, error) {
	db, err := gorm.Open(postgres.Open(connstr), &gorm.Config{})

	if err != nil {
		return Posgres{}, err
	}

	return Posgres{
		GormDB: db,
	}, nil
}

func (m Posgres) Close() error {
	db, err := m.GormDB.DB()
	if err != nil {
		return err
	}
	return db.Close()
}

func (m Posgres) CreateStore(store *model.Store) error {
	return m.GormDB.Create(store).Error
}

func (d Posgres) InitialMigration() {

	d.GormDB.AutoMigrate(model.Store{})
	d.GormDB.AutoMigrate(model.Branchoffice{})
	d.GormDB.AutoMigrate(model.Product{})
	d.GormDB.AutoMigrate(model.Cart{})
	d.GormDB.AutoMigrate(model.Storage{})
}
