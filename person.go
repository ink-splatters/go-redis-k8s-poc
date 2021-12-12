package main

import (
	//"context"
	_ "github.com/go-redis/redis/v8"
)

type Person struct {
	FirstName  string   `redis:"person:first"`
	SecondName string   `redis:"person:second"`
	Age        int      `redis:"person:age"`
	Phone	   string 	`redis:"person:phone"`
	Address	   string	 `redis:"person:address"`
	Ignored    struct{} `redis:"-"` // https://github.com/go-redis/redis/blob/master/example/scan-struct/main.go
}
