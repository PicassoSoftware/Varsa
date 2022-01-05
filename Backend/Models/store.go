package model

import "github.com/jinzhu/gorm"

type Store struct {
	gorm.Model
	TC                string		`json:"tc"`
	VKN               string		`json:"vkn" gorm:"primaryKey"`
	Mobile            string		`json:"mobile"`
	Mail              string		`json:"mail"`
	Password          string		`json:"password"`
	City              string		`json:"city"`
	TaxAdministration string		`json:"taxadmin"`
	BranchName 		  string		`json:"branchname"`
}