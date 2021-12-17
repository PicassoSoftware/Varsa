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
	District string         `json:"district"`
	Street   string			`json:"street"`
	No       int			`json:"no"`
	Store    Store 			`gorm:"foreignKey:VKN;references:VKN"`
}

