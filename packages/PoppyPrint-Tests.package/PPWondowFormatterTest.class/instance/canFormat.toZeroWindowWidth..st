helper
canFormat: aString toZeroWindowWidth: anotherString

	self assert: anotherString equals: (PPWindowFormatter new format: aString toWindowWidth: 0)