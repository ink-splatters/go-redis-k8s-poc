//go:generate stringer -type=PhoneType -trimprefix=pt
package model


type PhoneType = int

const (
	ptHome PhoneType = iota
	ptCell
	ptWork
)

type Person struct {
	FirstName  string `redis:"person:first"`
	SecondName string `redis:"person:second"`
	Age        int8   `redis:"person:age"`
	Sex        string `redis:"person:age"`

	Address struct {
		Country  string
		City     string
		Zip      int32
		Street   string
		HouseNum int32
		Addition string
	} `redis:"person:address"`

	Phones []struct {
		Type   PhoneType
		Number string
	} = {
		struct{
			Type:
			}
	}

	Extra [][]map

}

func NewPerson(firstName string, secondName string, Age string) *Person {
	return &Person{
		FirstName:,
	}
}
