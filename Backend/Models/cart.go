package model

import (
	"time"
	"github.com/jinzhu/gorm"
)

type Cart struct {
	gorm.Model
	UDID         	string		`gorm:"primaryKey"`
	ProductId    	int			`gorm:"primaryKey"`
	ProductCount 	int
	Deadline        time.Time
	Code            string	
	Product 		Product 	`gorm:"foreignKey:ProductId;references:ID"`
}