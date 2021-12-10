package model

import (
	"github.com/jinzhu/gorm"
)

type Branchoffice struct {
	gorm.Model
	VKN      string `gorm:"primaryKey"`
	BranchNo int    `gorm:"primaryKey"`
	Mobile   string
	Mail     string
	TC       string
	Password string
	City     string
	Town     string
	District string
	Street   string
	No       int
	Store    Store `gorm:"foreignKey:VKN;references:VKN"`
}
