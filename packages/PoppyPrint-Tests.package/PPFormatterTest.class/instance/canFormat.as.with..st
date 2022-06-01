helper
canFormat: aString as: anotherString with: aPPFormatterConfig

	self assert: anotherString equals: (PPFormatter formatString: aString class: UndefinedObject noPattern: false with: aPPFormatterConfig)