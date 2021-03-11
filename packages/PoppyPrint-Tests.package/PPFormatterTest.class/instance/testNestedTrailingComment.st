tests - comments
testNestedTrailingComment

	self canFormat: 'handleEvent: unfilteredEvent

	| filteredEvent |
	owner ifNil: [^ unfilteredEvent
	"not necessary but good style -- see Morph >> #handleEvent:"].
	
	^ unfilteredEvent'