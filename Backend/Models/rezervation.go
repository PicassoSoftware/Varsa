package model

import (
	"time"
	"github.com/jinzhu/gorm"
)

type Rezervation struct {
	gorm.Model
	UDID            int
	Deadline        time.Time
	Code            string
	Amount          float32
}
