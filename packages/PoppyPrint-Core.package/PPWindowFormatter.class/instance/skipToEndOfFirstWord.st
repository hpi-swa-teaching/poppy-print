initialize
skipToEndOfFirstWord

	[index <= string size and: [inString or: [(seperators occurrencesOf: self charAtIndex) = 0]]] whileTrue: [
		resultStream nextPut: self charAtIndex.
		self charAtIndex = $' ifTrue: [inString := inString not].
		lineWidth := lineWidth + 1.
		index := index + 1]