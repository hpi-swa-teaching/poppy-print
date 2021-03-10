tests
testPragmas

	| string |
	string := 'helloWorld
	<pragma: #(#value1 #value2)>
	<pragma2>
	<pragma: 3 hello: ''abc''>

	self test'.
	self assert: string equals: (PPFormatter
		formatString: string
		class: UndefinedObject
		noPattern: false)