package model

import "github.com/jinzhu/gorm"

type Branchoffice struct {
	gorm.Model
	VKN       string
	BranchNo  int
	Mobile    string
	Mail      string
	TC        string
	Password  string
	City      string
	Town      string
	Street    string
	No        int
}