helper
getNextWord

	| i |
	i := index + 1.
	wordWidth := 0.
	wordStream reset.

	[i <= string size and: [(seperators occurrencesOf: (self charAt: i)) = 0]] whileTrue: [
		wordStream nextPut: (self charAt: i).
		wordWidth := wordWidth + 1.
		i := i + 1]