package dto

type PostCart struct {
	ProductId int     `json:"productid"`
	Photo     string  `json:"photo"`
	Name      string  `json:"name"`
	Price     float32 `json:"price"`
}
