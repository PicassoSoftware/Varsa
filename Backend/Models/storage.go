package model

import "github.com/jinzhu/gorm"

type Storage struct {
	gorm.Model
	VKN          	string			`json:"vkn"`		
	BranchNo     	int				`json:"branchno"`
	ProductId    	int				`json:"productid" gorm:"primaryKey"`
	ProductCount 	int				`json:"productcount"`

	Branchoffice 	Branchoffice 	`gorm:"foreignKey:VKN,BranchNo;references:VKN,BranchNo"`
	Product 		Product 		`gorm:"foreignKey:ProductId;references:ID"`
}