package model

import "github.com/jinzhu/gorm"

type Cart struct {
	gorm.Model
	UDID         string
	ProductId    int
	ProductCount int
}