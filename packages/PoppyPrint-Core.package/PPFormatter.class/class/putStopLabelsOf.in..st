helper
putStopLabelsOf: aString in: aDictionary

	| index |
	index := 1.
	
	[index > 0] whileTrue: [
		index := aString findString: self stopLabel startingAt: index.
		index > 0
			ifTrue: [
				index := index + self stopLabel size.
				aDictionary add: index -> 0]
			ifFalse: [aDictionary add: aString size -> 0]]