helper
canFormat: aString toDefaultWindowWidth: anotherString

	self assert: anotherString equals: (PPWindowFormatter new format: aString withWindowWidth: 83)