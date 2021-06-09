helper
findAllNonFormattingLabels: aString
	"Put the index positions of every nonformattinglabel (start & stop)
	in the returned dictionary. The key is the index positions and the value
	is either 1 for startNonFormatting or 2 for stopNonFormatting.
	Go through the entire String until no more occurrences are left."
	|index labelPositions labelCounter cleanLabelPositions startCount stopCount |
	
	index := 1.
	labelPositions := Dictionary new.
	
	[index > 0] whileTrue: [
		index := aString findString: self startLabel startingAt: index.
		index > 0 ifTrue: [
			index := index + self startLabel size.
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
	startCount := 0.
	stopCount := 0.
	startCount := labelPositions values count: [:e| e==1].
	stopCount := labelPositions values count: [:e| e==2].
	
	labelCounter := 0.
	"labelCounter := stopCount - startCount."
	cleanLabelPositions := Dictionary new.
	
	labelPositions keysInOrder do: [:key |
		((labelPositions at: key) == 1) ifTrue: [
			labelCounter := labelCounter + 1].
		((labelPositions at: key) == 2) ifTrue: [
			labelCounter := labelCounter -1]. 
		(labelCounter <= 1) & ((labelPositions at: key) == 1) ifTrue: [
			cleanLabelPositions add: key -> 1].
		(labelCounter == 0) &((labelPositions at: key) == 2) ifTrue: [
			cleanLabelPositions add: key -> 2].].
	
	Transcript show: startCount.
	Transcript show: ' '.
	Transcript show: stopCount.
	Transcript show: cleanLabelPositions.
	^cleanLabelPositions.