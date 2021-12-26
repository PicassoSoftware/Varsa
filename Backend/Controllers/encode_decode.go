package controller

import (
    "encoding/json"
    "net/http"
)

func decode(r *http.Request, w http.ResponseWriter, v interface{}) bool {
    err := json.NewDecoder(r.Body).Decode(v)
    println("decodayım")
    println(err)
    if err != nil {
        w.WriteHeader(http.StatusUnprocessableEntity)
        return false
    }

    return true
}

func encode(w http.ResponseWriter, v interface{}) bool {
    err := json.NewEncoder(w).Encode(v)

    if err != nil {
        w.WriteHeader(http.StatusInternalServerError)
        return false
    }

    return true
}