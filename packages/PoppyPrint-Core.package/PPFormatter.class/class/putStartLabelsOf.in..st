helper
putStartLabelsOf: aString in: aDictionary

	| index |
	index := 1.
	
	[index > 0] whileTrue: [
		index := aString findString: self startLabel startingAt: index.
		index > 0 ifTrue: [
			index := index + self startLabel size.
			aDictionary add: index -> 1.
			index := index + self startLabel size]]