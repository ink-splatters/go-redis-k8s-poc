package model

import (
	"github.com/ink-splatters/go-redis-k8s-poc/model/contacts"
	"time"
)

type Person struct {
	Id   uint64 `redis:"person:id"` // TODO: check if needed
	Name struct {
		First  string `redis:"person:name:first"`
		Second string `redis:"person:name:second"`
	}

	Age         int8      `redis:"person:age"`
	Sex         string    `redis:"person:sex"`
	DateOfBirth time.Time `redis:"person:date_of_birth"`

	Contacts contacts.Contacts
}
