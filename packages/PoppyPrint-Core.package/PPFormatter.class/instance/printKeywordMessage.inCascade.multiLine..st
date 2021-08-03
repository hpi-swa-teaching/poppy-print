printing
printKeywordMessage: aNode inCascade: isInCascade multiLine: multiLine

	| newLineAfterReceiver |
	newLineAfterReceiver := multiLine and: [
		aNode originalSelector keywords size > 1 or: [
			#(ifTrue: ifFalse:) includes: aNode originalSelector]].
	
	^ self indent: (newLineAfterReceiver ifTrue: [1] ifFalse: [0]) around: [
		isInCascade ifFalse: [
			newLineAfterReceiver
				ifTrue: [self newLine]
				ifFalse: [self stream space]].
		self
			with: aNode originalSelector keywords
			and: aNode originalArguments
			do: [:keyword :argument |
				self stream nextPutAll: keyword.
				self stream space.
				self visitNode: argument]
			separatedBy: [
				multiLine ifTrue: [self newLine] ifFalse: [self stream space]]]