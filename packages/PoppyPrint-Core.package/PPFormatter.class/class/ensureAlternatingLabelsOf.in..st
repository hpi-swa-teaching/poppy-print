helper
ensureAlternatingLabelsOf: aString in: aDictionary

	| labelMode cleanLabelPositions |
	labelMode := 2.
	"labelCounter := stopCount - startCount."
	cleanLabelPositions := Dictionary new.
	
	aDictionary keysInOrder do: [:key |
		labelMode == 2 & ((aDictionary at: key) == 1)
			ifTrue: [cleanLabelPositions add: key -> 1].
		labelMode == 1 & ((aDictionary at: key) == 2)
			ifTrue: [cleanLabelPositions add: key -> 2].
		(aDictionary at: key) == 1 ifTrue: [labelMode := 1].
		(aDictionary at: key) == 2 ifTrue: [labelMode := 2]].
	
	^ cleanLabelPositions