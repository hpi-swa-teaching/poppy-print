tests
testTemporariesStartOfMethodBody

	self
		assert: 13
		equals: (PPParser new startOfMethodBody: 'do: a with: b | a| 2 + 2')