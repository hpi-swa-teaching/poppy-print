visiting
visitMessageNode: aNode

	| multiLine isInCascade |
	isInCascade := ((self parentFor: aNode) isKindOf: CascadeNode) and: [(self parentFor: aNode) originalReceiver ~= aNode].
	isInCascade ifFalse: [self visitNode: aNode originalReceiver].
	
	aNode originalSelector isUnary ifTrue: [
		isInCascade ifFalse: [self stream space].
		^ self stream nextPutAll: aNode originalSelector].
	
	multiLine := self isMultiLineMessage: aNode.
	
	aNode originalSelector isBinary
		ifTrue: [^ self printBinaryMessage: aNode multiLine: multiLine].
	
	self printKeywordMessage: aNode inCascade: isInCascade multiLine: multiLine