expression types
expressionWithCr

	"based on: Parser >> expression"
	(hereType == #word and: [tokenType == #leftArrow])
		ifTrue: [^ self assignment: self variable].
	"modification"
	self primaryExpressionWithCr ifFalse: [^ false].
	"end of modification"
	((self messagePart: 3 repeat: true) and: [hereType == #semicolon])
		ifTrue: [self cascade].
	^ true