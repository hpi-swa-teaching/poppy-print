tests - specials
testShortCaseOf

	self canFormat: 'exceptionMessage

	^ self selector
		caseOf: {
			[#does] -> [self tempAt: 1].
			[#not] -> [self asMessage]}
		otherwise: [self error: ''This context is not the result of a message exception.'']'