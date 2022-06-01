put
putSeperatorAndWord

	resultStream nextPut: self charAtIndex.
	resultStream nextPutAll: wordStream contents.
	lineWidth := lineWidth + wordWidth + 1.
	index := index + wordWidth + 1