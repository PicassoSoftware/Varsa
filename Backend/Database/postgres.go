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

func (m Posgres) AddProductToStore(storage_data *model.Storage, product *model.Product) error {

	err := m.GormDB.Create(product).Error

	if err != nil {
		println(product)
		println("product eklenirken sorun oluştu")
		return err
	}

	storage_data.ProductId = product.ID

	err = m.GormDB.Create(storage_data).Error
	if err != nil {
		println("storage data eklenirken sorun oldu")
	}
	return err
}

func (m Posgres) CreateBranch(branch *model.Branchoffice) error {
	return m.GormDB.Create(branch).Error
}

func (m Posgres) FindStore(store *model.Store, vkn string) error {
	return m.GormDB.First(&store, "vkn=?", vkn).Error
}

func (m Posgres) FindBranchProduct(storage_datas *[]model.Storage, vkn string, branch_no string) error {
	return m.GormDB.Find(&storage_datas, "vkn=?", vkn, "branch_no=?", branch_no).Error
}

func (m Posgres) FindCartDatas(cart_datas *[]model.Cart, udid string, is_reserved string) error {
	var code_exist string

	if is_reserved == "0" {
		code_exist = "code is NOT NULL "
	} else {
		code_exist = "code is NULL"
	}

	return m.GormDB.Where(code_exist).Find(&cart_datas, "ud_id=?", udid).Error
}

func (m Posgres) FindProductInfo(product *model.Product, id string) error {
	return m.GormDB.First(&product, "id=?", id).Error
}

func (m Posgres) CreateCart(cart *model.Cart) error {
	return m.GormDB.Create(&cart).Error
}

func (d Posgres) InitialMigration() {
	d.GormDB.AutoMigrate(model.Store{})
	d.GormDB.AutoMigrate(model.Branchoffice{})
	d.GormDB.AutoMigrate(model.Product{})
	d.GormDB.AutoMigrate(model.Cart{})
	d.GormDB.AutoMigrate(model.Storage{})
}
