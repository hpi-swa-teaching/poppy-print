tests
testKeywordStartOfMethodBody

	self
		assert: 20
		equals: (PPParser new startOfMethodBody: 'do: abc with: aBlock 2 + 2')