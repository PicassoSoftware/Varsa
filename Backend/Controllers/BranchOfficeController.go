package controller

import (
    //mapper "github.com/PeteProgrammer/go-automapper"
    "strconv"
    "net/http"
    "varsa/database"
    dto "varsa/dtos"
    model "varsa/models"

    "github.com/gorilla/mux"
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
    product.DetailedInfo = posted_product.DetailedInfo
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

    params := mux.Vars(r)
    var storage_datas[] model.Storage

    if err := b.DB.FindBranchProduct(&storage_datas, params["vkn"],params["branch_no"]); err != nil {
        w.WriteHeader(http.StatusInternalServerError)
        return
    }
    
    var product = make([]model.Product, len(storage_datas)) 
    
    println("storagede hata yok")
    for i, s := range storage_datas {
        if err := b.DB.FindProductInfo(&product[i],strconv.Itoa(s.ProductId) ); err != nil {
            println("hata")
            w.WriteHeader(http.StatusInternalServerError)
            return
        }
    }

    if ok := encode(w, &product); !ok {
        return
    }
}