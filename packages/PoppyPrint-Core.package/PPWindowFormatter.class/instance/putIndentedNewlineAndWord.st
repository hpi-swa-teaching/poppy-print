put
putIndentedNewlineAndWord

	resultStream nextPut: Character cr;
		next: tabCount + 1 put: Character tab;
		nextPutAll: wordStream contents.
	lineWidth := tabCount + 1 + wordWidth.
	index := index + wordWidth + 1