expression types
advanceWithCr

	"based on: Parser >> advance"
	| this |
	prevMark := hereMark.
	prevEnd := hereEnd.
	this := here.
	here := token.
	hereType := tokenType.
	hereMark := mark.
	hereEnd := source position - (aheadChar == DoItCharacter
		ifTrue: [
			hereChar == DoItCharacter ifTrue: [0] ifFalse: [1]]
		ifFalse: [2]).
	"modification"
	self scanTokenWithCr.
	"end of modification"
	^ this