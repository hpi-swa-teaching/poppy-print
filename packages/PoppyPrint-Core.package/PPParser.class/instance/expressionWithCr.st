as yet unclassified
expressionWithCr
	(hereType == #word
	 and: [tokenType == #leftArrow]) ifTrue:
		[^self assignment: self variable].
	self primaryExpressionWithCr ifFalse:
		[^false].
	((self messagePart: 3 repeat: true)
	 and: [hereType == #semicolon]) ifTrue:
		[self cascade].
	^true