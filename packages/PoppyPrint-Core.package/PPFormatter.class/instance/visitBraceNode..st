visiting
visitBraceNode: aNode

	| length multiLine |
	length := self getBraceNodeLength: aNode.
	multiLine := length > self maxLineLength or: [self braceNodeHasMultiLineParts: aNode].
	multiLine ifTrue: [
		aNode elements removeAllSuchThat: [:element | self isNewLineMarker: element]].
	
	stream nextPut: ${.
	
	self indent: (multiLine ifTrue: [1] ifFalse: [0]) around: [
		multiLine ifTrue: [self newLine].
		self evaluateBraceStatements: aNode multiLine: multiLine].
	
	stream nextPut: $}