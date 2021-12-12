package controller

import (
	"net/http"
	"varsa/database"
)

type BranchOfficeController struct {
	DB database.Posgres
}

func NewBranchOfficeController(_DB database.Posgres) BranchOfficeController{
	b :=BranchOfficeController {}
	b.DB = _DB
	return b
}


func (b*BranchOfficeController) AddProductToStorage(w http.ResponseWriter, r *http.Request){

}

func (b*BranchOfficeController) GetBranchProducts(w http.ResponseWriter, r *http.Request){

}