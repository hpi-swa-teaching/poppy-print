printing
visitNode: aNode

	| needsParens |
	self addCommentsOf: aNode.
	
	needsParens := self needsParenthesisFor: aNode.
	needsParens ifTrue: [stream nextPut: $(].
	
	preFormatCache at: aNode ifPresent: [:pair | stream nextPutAll: (self reindent: pair)] ifAbsent: [aNode accept: self].
	
	needsParens ifTrue: [stream nextPut: $)]