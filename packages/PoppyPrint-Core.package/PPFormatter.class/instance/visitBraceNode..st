visiting
visitBraceNode: aNode

	| length multiLine |
	length := aNode elements inject: 0 into: [:sum :node | sum + (self preFormat: node) size].
	multiLine := length > self maxLineLength or: [(aNode elements anySatisfy: [:node | (self willBeMultiLine: node) or: [self isEmptyLineMarker: node]]) or: [self isCaseOf: (self parentFor: aNode)]].
	
	stream nextPut: ${.
	
	self indent: (multiLine ifTrue: [1] ifFalse: [0]) around: [
		multiLine ifTrue: [self newLine].
		
		aNode elements do: [:element | | isLast |
			isLast := element = aNode elements last.
			(self isEmptyLineMarker: element) ifFalse: [
				self visitNode: element.
				isLast ifFalse: [
					config spaceBeforePointInArray ifTrue: [stream space].
					stream nextPut: $.]].
			
			isLast ifFalse: [multiLine ifTrue: [self newLine] ifFalse: [stream space]]]].
	
	stream nextPut: $}