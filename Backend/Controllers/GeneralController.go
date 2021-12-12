package controllers

import (
	"net/http"
	database "varsa/Database"
	m "varsa/Models"
)

type GeneralController struct {
    DB database.Posgres
}

func NewGeneralController(_DB database.Posgres) GeneralController{
	g := GeneralController{}
	g.DB = _DB
	return g
}

func (g *GeneralController) NewBranch(w http.ResponseWriter, r *http.Request) {
	
}

func (g *GeneralController) NewStore(w http.ResponseWriter, r *http.Request) {
	var store m.Store

	if ok := decode(r, w, &store) ; !ok {
		return
	}

	if err := g.DB.CreateStore(&store) ; err != nil {
		w.WriteHeader(http.StatusInternalServerError)
		return
	}

	if ok := encode(w, &store) ; !ok {
		return
	}
}

