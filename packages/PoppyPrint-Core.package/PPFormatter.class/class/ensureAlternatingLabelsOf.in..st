helper
ensureAlternatingLabelsOf: aString in: aDictionary

	| labelMode cleanLabelPositions previousKey |
	labelMode := 0.
	"labelCounter := stopCount - startCount."
	cleanLabelPositions := Dictionary new.
	previousKey := aDictionary keysInOrder first.
	aDictionary keysInOrder do: [:key |
		labelMode == 0 & ((aDictionary at: key) == 1)
			ifTrue: [
				cleanLabelPositions add: key -> 1.
				labelMode := 1].
		labelMode == 1 & ((aDictionary at: key) == 2)
			ifTrue: [
				cleanLabelPositions add: key -> 2.
				labelMode := 0]].
	^ cleanLabelPositions