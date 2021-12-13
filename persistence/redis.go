package persistence

import (
	"context"
	"github.com/go-redis/redis/v8"
)

func NewClient() {

}
func main() {
	ctx := context.Background()

	rdb := redis.NewClient(&redis.Options{
		Addr:	  "localhost:6379",
		Password: "", // no password set
		DB:		  0,  // use default DB
	})