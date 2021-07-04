parsing-public
nextElementaryLargeIntegerBase: aRadix
	"Form an unsigned integer with incoming digits from sourceStream.
	Return this integer, or zero if no digits found.
	Stop reading if end of digits or if a LargeInteger is formed.
	Count the number of digits and the position of lastNonZero digit and store them in instVar."

	| value digit char inLeadingZeros |
	value := 0.
	nDigits := 0.
	lastNonZero := 0.
	inLeadingZeros := true.
	[
		value isLarge ifTrue: [^ value].
		char := sourceStream next ifNil: [^ value].
		((digit := char digitValue) < 0 or: [digit >= aRadix])
			ifTrue: [
				sourceStream skip: -1.
				^ value].
		nDigits := nDigits + 1.
		digit = 0
			ifFalse: [
				lastNonZero := nDigits.
				value := value * aRadix + digit.
				inLeadingZeros := false]
			ifTrue: [
				value := value * aRadix.
				(inLeadingZeros and: [self leadingZerosSettled not])
					ifTrue: [self leadingZeroAmount: self leadingZeroAmount + 1]]] repeat