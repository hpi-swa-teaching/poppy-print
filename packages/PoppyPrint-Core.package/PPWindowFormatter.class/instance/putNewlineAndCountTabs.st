put
putNewlineAndCountTabs

	self countTabs.
	
	resultStream nextPut: Character cr;
		next: tabCount put: Character tab.
	tabCount = 0
		ifTrue: [
			resultStream nextPutAll: wordStream contents.
			index := index + wordWidth + 1]
		ifFalse: [
			index := index + tabCount.
			self getNextWord.
			resultStream nextPutAll: wordStream contents.
			index := index + wordWidth + 1].
	lineWidth := tabCount + wordWidth