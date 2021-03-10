helper
willBeMultiLine: aNode

	| text |
	text := self preFormat: aNode.
	self flag: #todo. " does not correctly factor actual indent "
	^ (text includes: Character cr) or: [text size > (self maxLineLength - (indent * 4))]