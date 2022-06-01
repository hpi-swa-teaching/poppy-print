helper
canFormat: aString toStandardWindowWidth: anotherString

	self assert: anotherString equals: (PPWindowFormatter new formatToStandardWindowWidth: aString)