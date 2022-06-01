helper
canFormat: aString toStandardWindowWidth: anotherString

	self assert: anotherString equals: (PPWindowFormatter new format: aString withWindowWidth: 83)