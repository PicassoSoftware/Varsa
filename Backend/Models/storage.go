package model

import "github.com/jinzhu/gorm"

type Storage struct {
	gorm.Model
	VKN          string
	BranchNo     int
	ProductId    int
	ProductCount int
}