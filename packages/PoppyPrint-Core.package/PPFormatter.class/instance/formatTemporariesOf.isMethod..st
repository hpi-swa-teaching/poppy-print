printing
formatTemporariesOf: aNode isMethod: isMethodBlock

	| temporaries |
	temporaries := isMethodBlock
		ifTrue: [(self parentFor: aNode) temporaries]
		ifFalse: [aNode temporaries select: [:t | t scope ~= -2]].
	temporaries ifNotEmpty: [:temps |
		isMethodBlock ifFalse: [
			config formatTemporaryVariablesInLoopsInNewline
				ifTrue: [
					self newLine.
					stream next: indent put: Character tab]
				ifFalse: [stream space]].
		stream nextPutAll: '| '.
		temps do: [:temp | stream nextPutAll: temp name] separatedBy: [stream space].
		stream nextPutAll: ' |'.
		isMethodBlock 
			ifTrue: [self newLine]
			ifFalse: [stream next: indent put: Character tab]]