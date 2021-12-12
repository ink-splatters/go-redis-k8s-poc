package contacts


type Contact struct {
	Address Address `redis:"contact:address"`
	Phone   Phone   `redis:"contact:address"`
}

type Contacts struct {
	Home  *Contact  `redis:"person:contacts:primary:home"`
	Work  *Contact  `redis:"person:contacts:primary:work:"`
	Extra []Contact `redis:"person:contacts:extra"`
}
