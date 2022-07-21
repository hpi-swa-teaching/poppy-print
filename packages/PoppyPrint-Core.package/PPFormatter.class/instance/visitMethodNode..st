visiting
visitMethodNode: aNode

	aNode selector isUnary 
		ifTrue: [stream nextPutAll: aNode selector] 
		ifFalse: [self printAndVisitPartsSeperateBySpace: aNode].
		
	self printMethodComment: aNode.
	self printPragmas: aNode.
	self newLine.
	self indent: 1 around: [
		self newLine.
		self visitNode: aNode block]