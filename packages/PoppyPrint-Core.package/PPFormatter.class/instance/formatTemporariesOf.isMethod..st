printing
formatTemporariesOf: aNode isMethod: isMethodBlock

	| temporaries |
	temporaries := isMethodBlock
		ifTrue: [(self parentFor: aNode) temporaries]
		ifFalse: [
			aNode temporaries select: [:t | t scope ~= -2]].
	temporaries ifNotEmpty: [:temps |
		isMethodBlock ifFalse: [self stream space].
		self stream nextPutAll: '| '.
		temps do: [:temp | self stream nextPutAll: temp name] separatedBy: [self stream space].
		self stream nextPutAll: ' |'.
		isMethodBlock ifTrue: [self newLine]]