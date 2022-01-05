package dto

type ProductDetail struct {
	ID             int     `json:"id"`
	ProductName    string  `json:"productname"`
	Photo          string  `json:"photo"`
	ExpirationDate int     `json:"expirationdate"`
	Price          float32 `json:"price"`
	DetailedInfo   string  `json:"detailedinfo"`
	BranchName     string  `json:"branchname"`
}
