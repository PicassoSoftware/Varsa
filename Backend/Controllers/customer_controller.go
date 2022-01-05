package controller

import (
	"github.com/gorilla/mux"
	"net/http"
	"strconv"
	"time"
	"varsa/database"
	dto "varsa/dtos"
	model "varsa/models"
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
	params := mux.Vars(r)
	var branchoffice []model.Branchoffice

	if err := c.DB.NearbyProducts(&branchoffice, params["city"], params["town"], params["district"]); err != nil {
		w.WriteHeader(http.StatusInternalServerError)
		return
	}

	var branch_datas []model.Storage
	var all_datas []model.Storage

	for _, s := range branchoffice {
		if err := c.DB.FindBranchProduct(&branch_datas, s.VKN, strconv.Itoa(s.BranchNo)); err != nil {
			println("hata")
			w.WriteHeader(http.StatusInternalServerError)
			return
		}

		all_datas = append(all_datas, branch_datas...)

	}
	var product = make([]model.Product, len(all_datas))
	var product_for_card = make([]dto.ProductForCard, len(all_datas))

	for i, s := range all_datas {
		if err := c.DB.FindProductInfo(&product[i], strconv.Itoa(s.ProductId)); err != nil {
			println("hata")
			w.WriteHeader(http.StatusInternalServerError)
			return
		}
	}

	for i, s := range product {
		product_for_card[i].ID = s.ID
		product_for_card[i].Name = s.Name
		product_for_card[i].Stock = s.AvailableStock
		product_for_card[i].Photo = s.Photo
		product_for_card[i].Days_For_Expiration = int(s.ExpirationDate.Sub(time.Now())/time.Hour) / 24
		product_for_card[i].Price = s.Price
	}

	if ok := encode(w, &product_for_card); !ok {
		return
	}

}

func (c *CustomerController) GetProduct(w http.ResponseWriter, r *http.Request) {
	params := mux.Vars(r)
	var storage model.Storage

	if err := c.DB.FindProductFromStorage(&storage, params["product_id"]); err != nil {
		w.WriteHeader(http.StatusInternalServerError)
		return
	}

	if ok := encode(w, &storage); !ok {
		return
	}

}
func (c *CustomerController) AddProductToCart(w http.ResponseWriter, r *http.Request) {
	var cart_data model.Cart

	if ok := decode(r, w, &cart_data); !ok {
		return
	}
	cart_data.Code = "cart"
	if err := c.DB.CreateCart(&cart_data); err != nil {
		w.WriteHeader(http.StatusInternalServerError)
		return
	}

	if ok := encode(w, &cart_data); !ok {
		return
	}
}
func (c *CustomerController) ReserveProduct(w http.ResponseWriter, r *http.Request) {
	params := mux.Vars(r)

	if err := c.DB.ReserveProduct(params["udid"]); err != nil {
		w.WriteHeader(http.StatusInternalServerError)
		return
	}

}

func (c *CustomerController) GetCart(w http.ResponseWriter, r *http.Request) {
	params := mux.Vars(r)
	var cart_datas []model.Cart
	if err := c.DB.FindCartDatas(&cart_datas, params["udid"], params["is_reserved"]); err != nil {
		w.WriteHeader(http.StatusInternalServerError)
		return
	}

	if ok := encode(w, &cart_datas); !ok {
		return
	}
	println("bitti...")
}
func (c *CustomerController) DeleteProductFromCart(w http.ResponseWriter, r *http.Request) {
	params := mux.Vars(r)

	if err := c.DB.DeleteProductFromCart(params["code"]); err != nil {
		w.WriteHeader(http.StatusInternalServerError)
		return
	}
}
func (c *CustomerController) GetProductInfo(w http.ResponseWriter, r *http.Request) {

	params := mux.Vars(r)
	var product model.Product
	var product_detail dto.ProductDetail
	var storage_data model.Storage
	var store model.Store

	if err := c.DB.FindProductInfo(&product, params["id"]); err != nil {
		w.WriteHeader(http.StatusInternalServerError)
		return
	}
	if err := c.DB.FindProductFromStorage(&storage_data, params["id"]); err != nil {
		w.WriteHeader(http.StatusInternalServerError)
		return
	}
	if err := c.DB.FindStoreFromStorage(&store, storage_data.VKN); err != nil {
		w.WriteHeader(http.StatusInternalServerError)
		return
	}

	product_detail.ExpirationDate = int(product.ExpirationDate.Sub(time.Now())/time.Hour) / 24
	product_detail.ID = product.ID
	product_detail.ProductName = product.Name
	product_detail.DetailedInfo = product.DetailedInfo
	product_detail.BranchName = store.BranchName
	product_detail.Photo = product.Photo
	product_detail.Price = product.Price

	if ok := encode(w, &product_detail); !ok {
		return

	}

}
