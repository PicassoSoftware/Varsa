package controller

import (
	"net/http"
	"varsa/database"
	model "varsa/models"

	"github.com/gorilla/mux"
)

type CustomerController struct {
	DB database.Posgres
}

func NewCustomerController(_DB database.Posgres) CustomerController {
	c := CustomerController{}
	c.DB = _DB
	return c
}

func (c *CustomerController) NearbyProducts(w http.ResponseWriter, r *http.Request) {

}
func (c *CustomerController) GetProduct(w http.ResponseWriter, r *http.Request) {

}
func (c *CustomerController) AddProductToCart(w http.ResponseWriter, r *http.Request) {
	var cart_data  model.Cart

	if ok := decode(r, w, &cart_data); !ok {
		return
	}

	if err := c.DB.CreateCart(&cart_data); err != nil {
		w.WriteHeader(http.StatusInternalServerError)
		return
	}

	if ok := encode(w, &cart_data); !ok {
		return
	}
}
func (c *CustomerController) ReserveProduct(w http.ResponseWriter, r *http.Request) {
	println(r.Body)
}
func (c *CustomerController) GetCart(w http.ResponseWriter, r *http.Request) {
	params := mux.Vars(r)
	var cart_datas[] model.Cart
	if err := c.DB.FindCartDatas(&cart_datas, params["udid"], params["is_reserved"]); err != nil {
		w.WriteHeader(http.StatusInternalServerError)
		return
	}

	if ok := encode(w, &cart_datas); !ok {
		return
	}

}
func (c *CustomerController) DeleteProductFromCart(w http.ResponseWriter, r *http.Request) {

}
func (c *CustomerController) GetProductInfo(w http.ResponseWriter, r *http.Request) {

	params := mux.Vars(r)
	var product model.Product
	if err := c.DB.FindProductInfo(&product, params["id"]); err != nil {
		w.WriteHeader(http.StatusInternalServerError)
		return
	}

	if ok := encode(w, &product); !ok {
		return
	}



}


