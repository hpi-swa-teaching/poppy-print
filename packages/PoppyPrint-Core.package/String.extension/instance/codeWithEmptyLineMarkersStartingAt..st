*PoppyPrint-Core
codeWithEmptyLineMarkersStartingAt: aNumber
	" insert #ppEmptyLine symbols where double newlines are found, for later use by e.g. a formatter. Insert no markers earlier than aNumber "

	| ranges crPositions write lastWasStatement |
	ranges := (Array streamContents: [:stream |
		Scanner new scanTokenPositionsIn: self into: [:start :end | start <= end ifTrue: [stream nextPut: (start to: end)]]]).
	ranges := self mergeConsecutiveComments: ranges.
	
	lastWasStatement := false.
	crPositions := Array streamContents: [:stream |
		stream nextPut: 1.
		ranges overlappingPairsDo: [:first :second |
			(((first size = 1 and: [(self at: first start) = $.]) or: [lastWasStatement and: [(self at: first stop) = $"]])
			and: [((self copyFrom: first stop + 1 to: second start) occurrencesOf: Character cr) > 1]) ifTrue: [
				lastWasStatement := (self at: first start) = $..
				stream nextPut: ((self copyFrom: first stop + 1 to: second start) lastIndexOf: Character cr) + first stop]]].
	
	write := '' writeStream.
	crPositions overlappingPairsDo: [:start :end |
		write nextPutAll: (self copyFrom: start to: end - 1).
		end > aNumber ifTrue: [write nextPutAll: '#ppEmptyLine.']].
	write nextPutAll: (self copyFrom: crPositions last to: self size).
	
	^ write contents