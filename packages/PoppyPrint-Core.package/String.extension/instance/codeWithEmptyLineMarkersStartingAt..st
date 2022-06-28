*PoppyPrint-Core
codeWithEmptyLineMarkersStartingAt: aNumber
	" insert #ppEmptyLine symbols where double newlines are found, for later use by e.g. a formatter. Insert no markers earlier than aNumber "

	| ranges crPositions write lastWasStatement |
	ranges := Array streamContents: [:stream |
		Scanner new
			scanTokenPositionsIn: self
			into: [:start :end | start <= end ifTrue: [stream nextPut: (start to: end)]]].
	ranges := self mergeConsecutiveComments: ranges.
	lastWasStatement := false.
	crPositions := Array streamContents: [:stream | | numberOfNewLines |
		numberOfNewLines := 0.
		stream nextPut: {1. numberOfNewLines}.
		ranges overlappingPairsDo: [:first :second |
			numberOfNewLines := (self copyFrom: first stop + 1 to: second start) occurrencesOf: Character cr.
			(
				(
					(first size = 1 and: [(self at: first start) = $.]) 
					or: 
					[lastWasStatement and: [(self at: first stop) = $"]]
				) and: 
					[numberOfNewLines > 0]
			) ifTrue: [
				stream nextPut: {
					((self copyFrom: first stop + 1 to: second start) lastIndexOf: Character cr) + first stop.
					numberOfNewLines}].
			lastWasStatement := (self at: first start) = $..]].
	write := '' writeStream.
	crPositions overlappingPairsDo: [:startPair :endPair | | start end |
		start := startPair first.
		end := endPair first.
		write nextPutAll: (self copyFrom: start to: end - 1).
		end > aNumber ifTrue: [
			(endPair second = 1) 
				ifTrue: [write nextPutAll: '#ppOptionalNewLine.'.]
				ifFalse: [
					write nextPutAll: '#ppEmptyLine.'.
					endPair second - 2 timesRepeat: [write nextPutAll: '#ppOptionalEmptyLine.']]]].
	write nextPutAll: (self copyFrom: crPositions last first to: self size).
	^ write contents