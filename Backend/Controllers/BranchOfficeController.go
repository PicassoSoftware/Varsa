package controller

import (
	//mapper "github.com/PeteProgrammer/go-automapper"
	"net/http"
	"varsa/database"
	dto "varsa/dtos"
	model "varsa/models"
)

type BranchOfficeController struct {
	DB database.Posgres
}

func NewBranchOfficeController(_DB database.Posgres) BranchOfficeController {
	b := BranchOfficeController{}
	b.DB = _DB
	return b
}

func (b *BranchOfficeController) AddProductToStorage(w http.ResponseWriter, r *http.Request) {

	var posted_product dto.PostProduct
	var storage_data model.Storage
	var product model.Product

	if ok := decode(r, w, &posted_product); !ok {
		return
	}

	product.Name = posted_product.Name
	product.Stock = posted_product.Stock
	product.Photo = posted_product.Photo
	product.ExpirationDate = posted_product.ExpirationDate
	product.Price = posted_product.Price
	product.DetailedInfo = 123
	storage_data.VKN = posted_product.VKN
	storage_data.BranchNo = posted_product.BranchNo
	storage_data.ProductCount = posted_product.ProductCount

	if err := b.DB.AddProductToStore(&storage_data, &product); err != nil {
		w.WriteHeader(http.StatusInternalServerError)
		return
	}

	w.WriteHeader(http.StatusOK)

}

func (b *BranchOfficeController) GetBranchProducts(w http.ResponseWriter, r *http.Request) {

}
