put
putNewlineAndCountTabs

	self countTabs.
	
	resultStream nextPut: Character cr.
	resultStream next: tabCount put: Character tab.
	tabCount = 0
		ifTrue: [
			resultStream nextPutAll: wordStream contents.
			index := index + wordWidth + 1.
			lineWidth := wordWidth.]
		ifFalse: [
			index := index + tabCount.
			self getNextWord.
			resultStream nextPutAll: wordStream contents.
			index := index + wordWidth + 1.
			lineWidth := tabCount + wordWidth]