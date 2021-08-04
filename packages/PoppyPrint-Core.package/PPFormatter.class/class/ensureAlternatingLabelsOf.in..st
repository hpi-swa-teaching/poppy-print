helper
ensureAlternatingLabelsOf: aString in: aDictionary

	| labelMode cleanLabelPositions |
	labelMode := 0.
	"labelCounter := stopCount - startCount."
	cleanLabelPositions := Dictionary new.
	
	aDictionary keysInOrder do: [:key |
		labelMode == 0 & ((aDictionary at: key) == 1)
			ifTrue: [
				cleanLabelPositions add: key -> 1.
				labelMode := 1].
		labelMode == 1 & ((aDictionary at: key) == 0)
			ifTrue: [
				cleanLabelPositions add: key -> 0.
				labelMode := 0]].
	^ cleanLabelPositions