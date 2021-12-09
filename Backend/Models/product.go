package model

import (
	"time"
	"github.com/jinzhu/gorm"
	
)

 
type Product struct {
	gorm.Model
	ID  				int			`gorm:"primaryKey"`
	Name 				string
	Stock	 			int
	Photo 				string
	ExpirationDate   	time.Time 
	Price   			int
	DetailedInfo 		int

}