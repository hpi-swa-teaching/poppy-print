as yet unclassified
scanTokenWithCr

	(hereChar == Character cr) ifFalse:[
	[(tokenType := self typeTableAt: hereChar) == #xDelimiter]
		whileTrue: [self step]].  "Skip delimiters fast, there almost always is one."
	mark := aheadChar == DoItCharacter
		ifTrue: [hereChar == DoItCharacter
			ifTrue: [source position + 1]
			ifFalse: [source position]]
		ifFalse: [source position - 1].
	(tokenType at: 1) == $x "x as first letter"
		ifTrue: [self perform: tokenType "means perform to compute token & type"]
		ifFalse: [token := self step "else just unique the first char"].
	^token