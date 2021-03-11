tests
testShortArray

	self canFormat: 'exceptionMessage

	^ self selector
		with: {[#doesNotUnderstand:] -> [self tempAt: 1]. [#notYetImplemented] -> [self asMessage]}
		do: [:el | self error: ''This context is not the result of a message exception.'']'