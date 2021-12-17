package model

import (
	"time"
	"github.com/jinzhu/gorm"
)

type Cart struct {
	gorm.Model
	UDID         	string		`json:"udid" gorm:"primaryKey"`
	ProductId    	int			`json:"productid" gorm:"primaryKey"`
	ProductCount 	int			`json:"productcount"`
	Deadline        time.Time	`json:"deadline"`
	Code            string		`json:"code"`
	Product 		Product 	`gorm:"foreignKey:ProductId;references:ID"`
}