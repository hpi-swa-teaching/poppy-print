parsing-public
nextUnsignedIntegerOrNilBase: aRadix
	"Form an unsigned integer with incoming digits from sourceStream.
	Answer this integer, or nil if no digit found.
	Count the number of digits and the position of lastNonZero digit and store them in instVar"

	| nPackets high nDigitsHigh lastNonZeroHigh low inLeadingZeros |
	self leadingZerosSettled
		ifFalse: [self leadingZeroAmount: 0].
	inLeadingZeros := true.
	"read no more digits than one elementary LargeInteger"
	high := self nextElementaryLargeIntegerBase: aRadix.
	nDigits = 0 ifTrue: [^ nil].
	
	"Not enough digits to form a LargeInteger, stop iteration"
	high isLarge ifFalse: [^ high].
	
	"We now have to engage arithmetic with LargeInteger
	Decompose the integer in a high and low packets of growing size:"
	nPackets := 1.
	nDigitsHigh := nDigits.
	lastNonZeroHigh := lastNonZero.
	[
		low := self nextLargeIntegerBase: aRadix nPackets: nPackets.
		low == 0
			ifTrue: [
				(inLeadingZeros and: [self leadingZerosSettled not])
					ifTrue: [self leadingZeroAmount: self leadingZeroAmount + 1]]
			ifFalse: [inLeadingZeros := false].
		high := high * (aRadix raisedToInteger: nDigits) + low.
		lastNonZero = 0
			ifFalse: [lastNonZeroHigh := lastNonZero + nDigitsHigh].
		nDigitsHigh := nDigitsHigh + nDigits.
		low isLarge] whileTrue: [nPackets := nPackets * 2].
	
	nDigits := nDigitsHigh.
	lastNonZero := lastNonZeroHigh.
	^ high