//go:generate stringer -type=Flags
//go:generate stringer -type=PhoneFlags

package flags

type Flags = uint8

const (
	FNone Flags = 1 << iota
	FPrimary
	FSecondary
	FHome
	FWork
)

type PhoneFlags = uint8

const (
	PFMobile PhoneFlags = 1 << iota
)
