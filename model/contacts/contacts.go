//go:generate stringer -type=ContactFlags -trimprefix=cf
//go:generate stringer -type=PhoneType -trimprefix=pt
package contacts

type ContactFlags = uint8

const (
	cfNone ContactFlags = 1 << iota
	cfPrimary
	fSecondary
	cfHome
	cfWork
)

type PhoneType = uint8

const (
	ptLandLine PhoneType = iota
	ptMobile
)

type Contact struct {
	Address Address `redis:"contact:address"`
	Phone   Phone   `redis:"contact:address"`
}

type Contacts struct {
	Home  *Contact  `redis:"person:contacts:primary:home"`
	Work  *Contact  `redis:"person:contacts:primary:work:"`
	Extra []Contact `redis:"person:contacts:extra"`
}
