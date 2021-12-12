package controllers

import (
	"net/http"
	database "varsa/Database"
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