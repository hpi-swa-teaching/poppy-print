as yet unclassified
xDigit
	"Form a number."

	| numberParser number |
	tokenType := #number.
	aheadChar == DoItCharacter
		ifTrue: [
			source skip: -1
			"Read off the end last time"]
		ifFalse: [source skip: -2].
		
	numberParser := PPSqNumberParser on: source.
	number := numberParser
		failBlock: [:errorString :position | self notify: errorString at: position];
		nextNumber.
	token := PPNumberWithBase new
		base: numberParser base;
		number: number;
		leadingZeroAmount: numberParser leadingZeroAmount;
		yourself.
	self
		step;
		step