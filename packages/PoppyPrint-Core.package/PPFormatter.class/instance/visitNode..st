printing
visitNode: aNode

	| needsParens |
	needsParens := self needsParenthesisFor: aNode.
	needsParens ifTrue: [self stream nextPut: $(].
	
	self preFormatCache
		at: aNode
		ifPresent: [:pair | self stream nextPutAll: (self reindent: pair)]
		ifAbsent: [aNode accept: self].
	
	needsParens ifTrue: [self stream nextPut: $)]