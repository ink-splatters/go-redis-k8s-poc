package contacts

import (
	"github.com/ink-splatters/go-redis-k8s-poc/model/flags"
)

type Address struct {
	Flags   flags.Flags `redis:"person:address:flags"`
	Country string      `redis:"person:address:country"`
	City        string      `redis:"person:address:city"`
	PostalCode  string      `redis:"person:address:postal_code"`
	StreetName  string      `redis:"person:address:street_name"`
	HouseNumber string      `redis:"person:address:house_number"`
	Addition    string      `redis:"person:address:addition"`
}
