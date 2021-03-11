tests
testEmptyLineInCaseOf

	self canFormat: 'exceptionMessage

	^ self selector
		caseOf: {
			[#doesNotUnderstand:] -> [self tempAt: 1].
			[#notYetImplemented] -> [self asMessage].
			
			[#shouldBeImplemented] -> [self asMessage].
			[#subclassResponsibility] -> [self asMessage]}
		otherwise: [self error: ''This context is not the result of a message exception.'']'