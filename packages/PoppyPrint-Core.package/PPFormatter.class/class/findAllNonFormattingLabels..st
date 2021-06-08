helper
findAllNonFormattingLabels: aString
	"Put the index positions of every nonformattinglabel (start & stop)
	in the returned dictionary. The key is the index positions and the value
	is either 1 for startNonFormatting or 2 for stopNonFormatting.
	Go through the entire String until no more occurrences are left."
	|index labelPositions |
	
	index := 1.
	labelPositions := Dictionary new.
	
	[index > 0] whileTrue: [
		index := aString findString: self startLabel startingAt: index.
		index > 0 ifTrue: [
			labelPositions add: index->1.
			index := index + self startLabel size.
			].
	].
	index := 1.
	[index > 0] whileTrue: [
		index := aString findString: self stopLabel startingAt: index.
		index > 0 ifTrue: [
			labelPositions add: index->2.
			index := index + self stopLabel size.
			] ifFalse: [labelPositions add: aString size -> 2]
	].

	^labelPositions.