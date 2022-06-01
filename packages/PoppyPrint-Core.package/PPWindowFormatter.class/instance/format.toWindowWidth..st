formatting
format: aString toWindowWidth: aNumber

	aString isEmpty ifTrue: [^ aString].
	
	string := aString.
	maxWidth := aNumber.
	self reset.
	
	[index <= string size] whileTrue: [
		| seperator |
		seperator := self charAtIndex.
		self getNextWord.
		
		seperator = Character cr
			ifTrue: [self putNewlineAndCountTabs]
			ifFalse: [
				wordWidth + lineWidth + 1 > maxWidth
					ifTrue: [self putIndentedNewlineAndWord]
					ifFalse: [self putSeperatorAndWord]]].
	
	^ resultStream contents