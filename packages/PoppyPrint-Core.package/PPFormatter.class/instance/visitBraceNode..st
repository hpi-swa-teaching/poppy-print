visiting
visitBraceNode: aNode

	| length multiLine |
	length := self getBraceNodeLength: aNode.
	multiLine := length > self maxLineLength or: [self braceNodeHasMultiLineParts: aNode].
	self stream nextPut: ${.
	
	self indent: (multiLine ifTrue: [1] ifFalse: [0]) around: [
		multiLine ifTrue: [self newLine].
		self evaluateBraceStatements: aNode multiLine: multiLine].
	
	self stream nextPut: $}