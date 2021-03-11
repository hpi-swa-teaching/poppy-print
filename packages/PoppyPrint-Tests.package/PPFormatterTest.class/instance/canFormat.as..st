helper
canFormat: aString as: anotherString

	self assert: anotherString equals: (PPFormatter formatString: aString class: UndefinedObject noPattern: false)