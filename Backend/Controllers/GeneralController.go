package controller

import (
	"net/http"
	"varsa/database"
	model "varsa/models"

	"github.com/gorilla/mux"
)

type GeneralController struct {
	DB database.Posgres
}

func NewGeneralController(_DB database.Posgres) GeneralController {
	g := GeneralController{}
	g.DB = _DB
	return g
}

func (g *GeneralController) NewBranch(w http.ResponseWriter, r *http.Request) {

	var branch model.Branchoffice

	if ok := decode(r, w, &branch); !ok {
		return
	}

	if err := g.DB.CreateBranch(&branch); err != nil {
		w.WriteHeader(http.StatusInternalServerError)
		return
	}

	if ok := encode(w, &branch); !ok {
		return
	}
}

func (g *GeneralController) NewStore(w http.ResponseWriter, r *http.Request) {

	var store model.Store

	if ok := decode(r, w, &store); !ok {
		return
	}

	if err := g.DB.CreateStore(&store); err != nil {
		w.WriteHeader(http.StatusInternalServerError)
		return
	}

	if ok := encode(w, &store); !ok {
		return
	}
}

func (g *GeneralController) GetStore(w http.ResponseWriter, r *http.Request) {
	params := mux.Vars(r)
	var store model.Store

	if err := g.DB.FindStore(&store, params["vkn"]); err != nil {
		w.WriteHeader(http.StatusInternalServerError)
		return
	}

	if ok := encode(w, &store); !ok {
		return
	}
}
