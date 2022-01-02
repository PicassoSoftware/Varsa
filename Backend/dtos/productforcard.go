package dto

type ProductForCard struct
{
	ID 						int				`json:"id"`
	Name 					string			`json:"name"`
	Stock					int 			`json:"stock"`
	Photo 					string    		`json:"photo"`
	Price 					float32		 	`json:"price"`
	Days_For_Expiration		int 			`json:"days_for_expiration"`
	
}