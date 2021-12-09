package model

import "github.com/jinzhu/gorm"

type Store struct {
	gorm.Model
	TC                string
	VKN               string
	Mobile            string
	Mail              string
	Password          string
	City              string
	TaxAdministration string
}