helper
canFormatMethod: aCompiledMethod

	| originalCode originalTree prettyCode prettyTree |
	originalCode := aCompiledMethod getSourceFromFile asString.
	prettyCode := PPFormatter formatString: originalCode class: aCompiledMethod methodClass noPattern: false.
	
	originalTree := Compiler new compile: originalCode in: aCompiledMethod methodClass notifying: nil ifFail: nil.
	prettyTree := Compiler new compile: prettyCode in: aCompiledMethod methodClass notifying: nil ifFail: nil.
	self
		assert: originalTree printString
		equals: prettyTree printString.