expression types
scanTokenWithCr

	"based on: Scanner >> scanToken"
	"modification"
	[
		(tokenType := self typeTableAt: hereChar) == #xDelimiter and: [
			hereChar ~= Character cr or: [token == Character cr]]] whileTrue: [self step].
	"Skip delimiters fast, there almost always is one."
	"end of modification"
	mark := aheadChar == DoItCharacter
		ifTrue: [
			hereChar == DoItCharacter
				ifTrue: [source position + 1]
				ifFalse: [source position]]
		ifFalse: [source position - 1].
		"modification"
	((tokenType at: 1) == $x and: [tokenType ~= #xDelimiter])
		"end of modification"
		ifTrue: [
			"x as first letter"
			self perform: tokenType
			"means perform to compute token & type"]
		ifFalse: [
			token := self step
			"else just unique the first char"].
	^ token