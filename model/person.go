//go:generate stringer -type=PhoneType -trimprefix=pt
package model

//import "math/rand"

type PhoneType = int
const (
	ptHome = iota // Head = 0
	ptCell
	ptWork
)

type Person struct {
	FirstName  string `redis:"person:first"`
	SecondName string `redis:"person:second"`
	Age        int    `redis:"person:age"`
	Sex        string `redis:"person:age"`

	//Address struct {
	//	Country  string
	//	City     string
	//	Zip      int
	//	Street   string
	//	HouseNum int
	//	Addition string
	//	//HouseNumber
	//} `redis:"person:address"`
	//Phone struct {
	//	Type
	//	Secondary string
	//}
	//
	string 	`redis:"person:phone"`
	//Address	   string	`redis:"person:address"`
	//Zip			int 	`redis:"person:zip"`
	//Addres	   string	`redis:"person:address"`
}

func NewPerson(firstName string, secondName string, Age string) *Person {
	return &Person{
		FirstName:,
	}
}
