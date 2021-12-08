package model

import (
	"time"

)

type Rezervation struct {
	UDID    int
	Deadline time.Time
	Code string
	Amount   float32
}
