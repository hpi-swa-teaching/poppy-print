helper
canFormat: aString

	self assert: aString equals: (PPFormatter formatString: aString class: UndefinedObject noPattern: false)