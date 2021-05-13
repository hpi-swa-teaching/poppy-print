*PoppyPrint-Core
codeWithEmptyLineMarkersStartingAt: aNumber
	" insert #ppEmptyLine symbols where double newlines are found, for later use by e.g. a formatter. Insert no markers earlier than aNumber "
	
	| ranges crPositions write lastWasStatement inCascade|
	ranges := (Array streamContents: [:stream |
		Scanner new scanTokenPositionsIn: self into: [:start :end | start <= end ifTrue: [stream nextPut: (start to: end)]]]).
	ranges := self mergeConsecutiveComments: ranges.
	
	inCascade := false.
	lastWasStatement := false.
	crPositions := Array streamContents: [:stream |
		stream nextPut: (1 @ false).
		ranges overlappingPairsDo: [:first :second |
			((((first size = 1 and: [(self at: first start) = $.]) or: [lastWasStatement and: [(self at: first stop) = $"]])
				or: [(first size = 1 and: [(self at: first start) = $;])])		
			and: [((self copyFrom: first stop + 1 to: second start) occurrencesOf: Character cr) > 1]) ifTrue: [
				lastWasStatement := (self at: first start) = $..
				inCascade := (self at: first start) = $;.
				stream nextPut: (((self copyFrom: first stop + 1 to: second start) lastIndexOf: Character cr) + first stop @ inCascade) ]]].
	
	write := '' writeStream.
	crPositions overlappingPairsDo: [:start :end |
		write nextPutAll: (self copyFrom: start x to: end x - 1).
		end x > aNumber ifTrue: [
			(end y) ifTrue: [write nextPutAll: 'ppEmptyLine;'] ifFalse: [write nextPutAll: '#ppEmptyLine.']]].
	write nextPutAll: (self copyFrom: crPositions last x to: self size).
	
	^ write contents