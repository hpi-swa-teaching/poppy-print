tests - comments
testSubexpressionComment

	self
		assert: 'helloWorld

	3 + 4.
	" comment "'
		equals: (PPFormatter formatString: 'helloWorld

	3 + " comment " 4' class: UndefinedObject noPattern: false)