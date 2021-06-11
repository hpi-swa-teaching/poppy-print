helper
clearOutStopLabels: aString

	| regexStop clearedString |
	regexStop := self stopLabel, '(.)?(
	)?'.
	clearedString := aString copyWithRegex: regexStop matchesReplacedWith: ''.
	^clearedString.