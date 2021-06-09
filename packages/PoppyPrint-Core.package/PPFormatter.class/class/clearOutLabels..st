helper
clearOutLabels: aString

	| regexStart regexStop clearedString |
	regexStart := self startLabel, '.?
	?'.
	regexStop := self stopLabel, '.?
	?'.
	clearedString := aString copyWithRegex: regexStart matchesReplacedWith: ''.
	clearedString := clearedString copyWithRegex: regexStop matchesReplacedWith: ''.
	^clearedString.