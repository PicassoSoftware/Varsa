package controllers

import (
	"net/http"
	database "varsa/Database"
)

type CustomerController struct {
    DB database.Posgres
}

func NewCustomerController(_DB database.Posgres) CustomerController{
	c := CustomerController{}
	c.DB = _DB
	return c
}

func (c*CustomerController) NearbyProducts(w http.ResponseWriter, r *http.Request) {

}
func (c*CustomerController) GetProduct(w http.ResponseWriter, r *http.Request) {

}
func (c*CustomerController) AddProductToCart(w http.ResponseWriter, r *http.Request) {

}
func (c*CustomerController) ReserveProduct(w http.ResponseWriter, r *http.Request) {
	println(r.Body)
}
func (c*CustomerController) GetCart(w http.ResponseWriter, r *http.Request) {

}
func (c*CustomerController) DeleteProductFromCart(w http.ResponseWriter, r *http.Request) {

}
