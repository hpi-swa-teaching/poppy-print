initialize
skipToEndOfFirstWord

	[index <= string size and: [(seperators occurrencesOf: self charAtIndex) = 0]] whileTrue: [
		resultStream nextPut: self charAtIndex.
		lineWidth := lineWidth + 1.
		index := index + 1]