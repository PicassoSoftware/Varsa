package model

import (
	"time" 

)

 
type Product struct {
	ID  				int
	Name 				string
	Stock	 			int
	Photo 				string
	ExpirationDate   	time.Time 
	Price   			int
	DetailedInfo 		int

}