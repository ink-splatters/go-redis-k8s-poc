package main

import (
	_ "context"
	"fmt"
	"github.com/SuperPaintman/nice/cli"
	_ "github.com/go-redis/redis/v8"
)

var (
	Version = "<version>"
	Build   = "<build>"
	AppName = "<appname>"
)

func main() {

	app := cli.App{
		Name:  AppName,
		Usage: cli.Usage("PoC of ACID compliant REST CRUD (k8s, reddis for persistence)"),

		Action: cli.ActionFunc(func(cmd *cli.Command) cli.ActionRunner {
			name := cli.StringArg(cmd, "name",
				cli.Usage("Who we say hello to"),
				cli.Optional,
			)
			*name = "Nice" // Default value.

			return func(cmd *cli.Command) error {
				//fmt.Println("Hello, %s!\n", *name)
				return nil
			}
		}),
		CommandFlags: []cli.CommandFlag{
			cli.HelpCommandFlag(),
			cli.VersionCommandFlag(fmt.Sprintf("%s (build %s)", Version, Build)),
		},
	}

	app.HandleError(app.Run())

}
