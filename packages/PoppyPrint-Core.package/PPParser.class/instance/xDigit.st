multi-character scans
xDigit
	"Form a number."
	"based on: Scanner >> xDigit"

	| numberParser number |
	tokenType := #number.
	aheadChar == DoItCharacter
		ifTrue: [
			source skip: -1
			"Read off the end last time"]
		ifFalse: [source skip: -2].
	"modification"
	numberParser := PPSqNumberParser on: source.
	number := numberParser
		failBlock: [:errorString :position | self notify: errorString at: position];
		nextNumber.
	token := PPNumberWithBase new
		base: numberParser base;
		number: number;
		leadingZeroAmount: numberParser leadingZeroAmount;
		yourself.
		"end of modification"
	self
		step;
		step