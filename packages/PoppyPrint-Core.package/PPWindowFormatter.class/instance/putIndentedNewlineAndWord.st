put
putIndentedNewlineAndWord

	resultStream nextPut: Character cr.
	resultStream next: tabCount + 1 put: Character tab.
	resultStream nextPutAll: wordStream contents.
	lineWidth := tabCount + 1 + wordWidth.
	index := index + wordWidth + 1.