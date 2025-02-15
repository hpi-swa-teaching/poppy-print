visiting
visitBlockNode: aNode

	| isMethodBlock startWithNewLine |
	isMethodBlock := (self parentFor: aNode) isKindOf: MethodNode.
	startWithNewLine := isMethodBlock not and: [aNode statements size > 0 and: [aNode statements size > 1 or: [(self willBeMultiLine: aNode statements first) or: [aNode statements first comment notNil]]]].
	
	isMethodBlock ifFalse: [self printBlockStart: aNode startWithNewLine: startWithNewLine].
	
	self formatTemporariesOf: aNode isMethod: isMethodBlock.
	
	self indent: (startWithNewLine ifTrue: [1] ifFalse: [0]) around: [
		startWithNewLine ifTrue: [self newLine].
		
		self printBlockComment: aNode.
		aNode statements do: [:statement |
			(self isEmptyLineMarker: statement) ifTrue: [self newLine] ifFalse: [
				self visitNode: statement.
				(statement ~= aNode statements last or: [config dotAtEndOfMethod and: [isMethodBlock and: [(statement isKindOf: ReturnNode) not]]]) ifTrue: [
					stream nextPut: $..
					statement ~= aNode statements last ifTrue: [self newLine]]].
			self printAllCommentsOf: statement lastStatement: statement = aNode statements last]].
	
	isMethodBlock ifFalse: [stream nextPut: $]].
	