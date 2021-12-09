package model

import "github.com/jinzhu/gorm"

type Storage struct {
	gorm.Model
	VKN          	string		
	BranchNo     	int
	ProductId    	int				`gorm:"primaryKey"`
	ProductCount 	int

	Branchoffice 	Branchoffice 	`gorm:"foreignKey:VKN,BranchNo;references:VKN,BranchNo"`
	Product 		Product 		`gorm:"foreignKey:ProductId;references:ID"`
}