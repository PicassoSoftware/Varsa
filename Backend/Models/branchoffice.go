package model

import (
	"github.com/jinzhu/gorm"
)

type Branchoffice struct { 
	gorm.Model
	VKN      string 		`json:"vkn" gorm:"primaryKey"`
	BranchNo int    		`json:"brancno" gorm:"primaryKey"`
	Mobile   string			`json:"mobile"`
	Mail     string			`json:"mail"`
	TC       string			`json:"tc"`
	Password string			`json:"password"`
	City     string			`json:"city"`
	Town     string			`json:"town"`
	Street   string			`json:"street"`
	District string         `json:"district"`
	No       int			`json:"no"`
	Store    Store 			`json:"store" gorm:"foreignKey:VKN;references:VKN"`
}

