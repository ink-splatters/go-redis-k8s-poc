package main

import (
	"bytes"
	"context"
	_ "context"
	"github.com/go-redis/redis/v8"
	_ "github.com/davecgh/go-spew/spew"
)
type Address struct {
	Street string `redis:"street"`
	House int `redis:"house"`
}

type Phone struct {
	Type string  `redis:"type"`
	Number string `redis:"number"`
}

type Contact struct {
	Address `redis:"address"`
	Phone	`redis:"phone"`
}

type  Person struct {
	Id int64 `redis:"name"`
	Name string `redis:"name"`
	Surname string `redis:"surname"`
	Age int8 `redis:"age"`
	Primary Contact `redis:"primary"`
	Secondary []Contact `redis:"secondary"`
}


var (
	// Version (set via LDFLAGS)
	Version = "<version>"

	// Build (set via LDFLAGS)
	Build = "<build>"

	// AppName (set via LDFLAGS)
	AppName = "<appname>"
)

func main() {
	rdb := redis.NewClient(&redis.Options{
		Addr: ":6379",
	})

	p := Person{
		Id: 1,
		Name: "Peter",
		Surname: "A",
		Age: 1,
		Primary: Contact{
			Address{
				Street: "street",
				House: 1,
			},
			Phone{
				Type: "landline",
				Number: "123",
			},
		},
	}

	rdb.H
}
