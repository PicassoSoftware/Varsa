package main

import (
	"fmt"
	"net/http"
	c "varsa/Controllers"
	d "varsa/Database"

	"github.com/gorilla/mux"
)

func initializeRouter(generalController c.GeneralController) {
	r := mux.NewRouter()
	println("Router çalıştı")

	r.HandleFunc("/storage", c.AddProductToStorage).Methods("Post")
	r.HandleFunc("/storage/{city}/{town}/{district}", c.NearbyProducts).Methods("Get")
	r.HandleFunc("/storage/{product_id}", c.GetProduct).Methods("Get")
	r.HandleFunc("/storage/{vkn}/{branch_no}", c.GetBranchProducts).Methods("Get")
	r.HandleFunc("/cart", c.AddProductToCart).Methods("Post")
	r.HandleFunc("/cart/{udid}", c.ReserveProduct).Methods("Get")
	r.HandleFunc("/cart/{udid}/{is_reserved}", c.GetCart).Methods("Get")
	r.HandleFunc("/cart/{code}", c.DeleteProductFromCart).Methods("Get")
	r.HandleFunc("/branch", generalController.NewBranch).Methods("Post")
	r.HandleFunc("/store", generalController.NewStore).Methods("Post")

	err := http.ListenAndServe(":5001", r)

	if (err == nil) {
		fmt.Println("nil geldi")
	}
	println(err.Error())
}

func main() {
	fmt.Println("Program başladı")
	connstr := d.ConnStr("ec2-54-160-35-196.compute-1.amazonaws.com", "vrwefgmxgaoqnt", "3f7b39c9726f848771b97ccac65e53bad3b28e6a8f2f8c71265e5e92d750bcd6", "d1s7p6c803bq6n", "5432")
	posgres, err := d.NewPosgres(connstr)
	

	if err != nil {
		panic("gg")
	}
	
	generalController := c.NewGeneralController(posgres)
	initializeRouter(generalController)
	// use mysql
}
