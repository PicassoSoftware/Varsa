package dto

import (
	"time"
	
)

 
type PostProduct struct {
	
	
	Name 				string		`json:"name"`	
	Stock	 			int			`json:"stock"`
	Photo 				string		`json:"photo"`
	ExpirationDate   	time.Time	`json:"expirationdate"` 
	Price   			int			`json:"price"`
	DetailedInfo 		string		`json:"detailedinfo"`
	VKN          		string		`json:"vkn"`		
	BranchNo     		int			`json:"branchno"`
	ProductCount 		int			`json:"productcount"`

}