package contacts

type Phone struct {
	Flags  ContactFlags `redis:"person:phone:flags"`
	Type   PhoneType    `redis:"person:phone:type"`
	Number string       `redis:"person:phone:number"`
}

//func makePrimaryPhone() Phone {
//	return Phone{
//		Flags: flags.FPrimary,
//	}
//}
