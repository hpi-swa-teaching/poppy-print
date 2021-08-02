parsing-public
nextNumber
	"main method for reading a number.
	This one can read Float Integer and ScaledDecimal"
	"based on: SqNumberParser >> nextNumber"

	| numberOfTrailingZeroInIntegerPart |
	base := 10.
	neg := self peekSignIsMinus.
	"modification"
	
	self leadingZerosSettled: false.
	"end of modification"
	
	integerPart := self nextUnsignedIntegerOrNilBase: base.
	integerPart ifNil: ["This is not a regular number beginning with a digit
		It is time to check for exceptional condition NaN and Infinity"
	^ self readNamedFloatOrFail].
	numberOfTrailingZeroInIntegerPart := nDigits - lastNonZero.
	(sourceStream peekFor: $r) ifTrue: [
		"<base>r<integer>"
		(base := integerPart) < 2 ifTrue: [
			sourceStream skip: -1.
			^ self expected: 'an integer greater than 1 as valid radix'].
		self peekSignIsMinus ifTrue: [neg := neg not].
		integerPart := self nextUnsignedIntegerBase: base.
		numberOfTrailingZeroInIntegerPart := nDigits - lastNonZero].
	"modification"
	
	self leadingZerosSettled: true.
	"end of modification"
	^ (sourceStream peekFor: $.)
		ifTrue: [self readNumberWithFractionPartNumberOfTrailingZeroInIntegerPart: numberOfTrailingZeroInIntegerPart]
		ifFalse: [self makeIntegerOrScaledInteger]