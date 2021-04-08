tests
testBinaryStartOfMethodBody

	self assert: 5 equals: (PPParser new startOfMethodBody: '+ abc 2 + 2')