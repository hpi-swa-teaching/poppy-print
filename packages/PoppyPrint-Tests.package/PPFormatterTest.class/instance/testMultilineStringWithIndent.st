tests
testMultilineStringWithIndent

	| string |
	string := 'test

	true ifTrue: [self equals: ''a
b
c
d'']'.
	
	self assert: string equals: (PPFormatter formatString: string class: UndefinedObject noPattern: false)