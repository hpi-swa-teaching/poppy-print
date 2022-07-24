helper
getNextWord

	| i |
	i := index + 1.
	wordWidth := 0.
	wordStream reset.

	[i <= string size and: [inString or: [(seperators occurrencesOf: (self charAt: i)) = 0]]] whileTrue: [
		wordStream nextPut: (self charAt: i).
		(self charAt: i) = $' ifTrue: [inString := inString not].
		wordWidth := wordWidth + 1.
		i := i + 1]