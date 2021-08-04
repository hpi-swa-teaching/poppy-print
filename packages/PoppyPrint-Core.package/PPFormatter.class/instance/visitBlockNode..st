visiting
visitBlockNode: aNode

	| isMethodBlock startWithNewLine |
	isMethodBlock := (self parentFor: aNode) isKindOf: MethodNode.
	startWithNewLine := isMethodBlock not and: [self blockStartWithNewLine: aNode].
	
	isMethodBlock
		ifFalse: [self printBlockStart: aNode startWithNewLine: startWithNewLine].
	
	self formatTemporariesOf: aNode isMethod: isMethodBlock.
	
	self indent: (startWithNewLine ifTrue: [1] ifFalse: [0]) around: [
		startWithNewLine ifTrue: [self newLine].
		
		self printBlockComment: aNode.
		self evaluateBlockStatements: aNode].
	
	isMethodBlock ifFalse: [stream nextPut: $]]