package model

import (
	"time"
	"github.com/jinzhu/gorm"
	
)

 
type Product struct {
	gorm.Model
	ID  				int			`json:"id" gorm:"primaryKey"`
	Name 				string		`json:"name"`	
	AvailableStock	 	int			`json:"stock"`
	Photo 				string		`json:"photo"`
	ExpirationDate   	time.Time	`json:"expirationdate"` 
	Price   			float32		`json:"price"`
	DetailedInfo 		string		`json:"detailedinfo"`
}