helper
findAllNonFormattingLabels: aString
	"Put the index positions of every nonformattinglabel (start & stop)
	in the returned dictionary. The key is the index positions and the value
	is either 1 for startNonFormatting or 2 for stopNonFormatting.
	Go through the entire String until no more occurrences are left."

	| index labelPositions cleanLabelPositions labelMode |
	index := 1.
	labelPositions := Dictionary new.
	
	[index > 0] whileTrue: [
		index := aString findString: self startLabel startingAt: index.
		index > 0 ifTrue: [
			index := index + self startLabel size.
			labelPositions add: index -> 1.
			index := index + self startLabel size]].
	index := 1.
	[index > 0] whileTrue: [
		index := aString findString: self stopLabel startingAt: index.
		index > 0
			ifTrue: [
				index := index + self stopLabel size.
				labelPositions add: index -> 2]
			ifFalse: [labelPositions add: aString size -> 2]].
	
	labelMode := 2.
	"labelCounter := stopCount - startCount."
	cleanLabelPositions := Dictionary new.
	
	labelPositions keysInOrder do: [:key |
		labelMode == 2 & ((labelPositions at: key) == 1) ifTrue: [cleanLabelPositions add: key -> 1].
		labelMode == 1 & ((labelPositions at: key) == 2) ifTrue: [cleanLabelPositions add: key -> 2].
		(labelPositions at: key) == 1 ifTrue: [labelMode := 1].
		(labelPositions at: key) == 2 ifTrue: [labelMode := 2]].
	^ cleanLabelPositions