package contacts

import (
	"github.com/ink-splatters/go-redis-k8s-poc/model/flags"
)

type Phone struct {
	Flags      flags.Flags `redis:"person:phone:flags"`
	PhoneFlags flags.Flags `redis:"person:phone:phone_flags"`
	Number     string      `redis:"person:phone:number"`
}

func makePrimaryPhone() Phone {
	return Phone{
		Flags: flags.FPrimary,
	}
}
