package main

import (
	"fmt"
	"net/http"
	controllers "varsa/controllers"
	"varsa/database"

	"github.com/gorilla/mux"
)

func initializeRouter(generalController controllers.GeneralController, customerController controllers.CustomerController, branchController controllers.BranchOfficeController) {
	r := mux.NewRouter()
	println("Router çalıştı")

	r.HandleFunc("/storage", branchController.AddProductToStorage).Methods("Post")
	r.HandleFunc("/storage/{city}/{town}/{district}", customerController.NearbyProducts).Methods("Get")
	r.HandleFunc("/storage/{product_id}", customerController.GetProduct).Methods("Get")
	r.HandleFunc("/storage/{vkn}/{branch_no}", branchController.GetBranchProducts).Methods("Get")
	r.HandleFunc("/cart", customerController.AddProductToCart).Methods("Post")
	r.HandleFunc("/cart/{udid}", customerController.ReserveProduct).Methods("Get")
	r.HandleFunc("/cart/{udid}/{is_reserved}", customerController.GetCart).Methods("Get")
	r.HandleFunc("/cart/{code}", customerController.DeleteProductFromCart).Methods("Get")
	r.HandleFunc("/branch", generalController.NewBranch).Methods("Post")
	r.HandleFunc("/store", generalController.NewStore).Methods("Post")

	err := http.ListenAndServe(":5001", r)

	if err == nil {
		fmt.Println("nil geldi")
	}
	println(err.Error())
}

func main() {
	fmt.Println("Program başladı")
	connstr := database.ConnStr("ec2-54-160-35-196.compute-1.amazonaws.com", "vrwefgmxgaoqnt", "3f7b39c9726f848771b97ccac65e53bad3b28e6a8f2f8c71265e5e92d750bcd6", "d1s7p6c803bq6n", "5432")
	posgres, err := database.NewPosgres(connstr)

	if err != nil {
		panic("gg")
	}
	branchController := controllers.NewBranchOfficeController(posgres)
	customerController := controllers.NewCustomerController(posgres)
	generalController := controllers.NewGeneralController(posgres)
	initializeRouter(generalController, customerController, branchController)
	// use mysql

}
