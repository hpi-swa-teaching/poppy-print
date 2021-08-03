printing
printBinaryMessage: aNode multiLine: multiLine

	aNode originalSelector ~= #, ifTrue: [self stream space].
	self stream
		nextPutAll: aNode originalSelector;
		space.
	self
		indent: (multiLine ifTrue: [1] ifFalse: [0])
		around: [self visitNode: aNode originalArguments first].
	^ self