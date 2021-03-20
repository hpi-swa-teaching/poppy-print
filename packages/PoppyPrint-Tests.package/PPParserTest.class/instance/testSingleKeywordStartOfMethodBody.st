as yet unclassified
testSingleKeywordStartOfMethodBody

	self assert: 7 equals: (PPParser new startOfMethodBody: 'do: abc 2 + 2')