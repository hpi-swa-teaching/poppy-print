put
putSeperatorAndWord

	resultStream nextPut: self charAtIndex;
		nextPutAll: wordStream contents.
	lineWidth := lineWidth + wordWidth + 1.
	index := index + wordWidth + 1