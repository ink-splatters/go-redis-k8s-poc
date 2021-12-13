package main

import (
	_ "context"
	_ "github.com/go-redis/redis/v8"
)

var (
	// Version (set via LDFLAGS)
	Version = "<version>"

	// Build (set via LDFLAGS)
	Build = "<build>"

	// AppName (set via LDFLAGS)
	AppName = "<appname>"
)

func main() {
}
