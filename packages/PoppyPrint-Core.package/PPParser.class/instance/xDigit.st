as yet unclassified
xDigit
	"Form a number."

	| numberParser number base |
	tokenType := #number.
	aheadChar == DoItCharacter
		ifTrue: [
			source skip: -1
			"Read off the end last time"]
		ifFalse: [source skip: -2].
	numberParser := SqNumberParser on: source.
	number := numberParser
		failBlock: [:errorString :position | self notify: errorString at: position];
		nextNumber.
	base := numberParser base.
	token := PPNumberWithBase new
		base: base;
		number: number;
		yourself.
	self
		step;
		step