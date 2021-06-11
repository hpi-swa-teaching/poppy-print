helper
clearOutStartLabels: aString

	| regexStart clearedString |
	regexStart := self startLabel, '(.)?(
	)?'.
	clearedString := aString copyWithRegex: regexStart matchesReplacedWith: ''.
	^clearedString.