package rezervation

import (
	"time"
)

type Rezervation struct{
	udid int
	deadline time.Time
	code string
	amount float32
}