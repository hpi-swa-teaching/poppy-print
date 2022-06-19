helper
canFormatMethod: aCompiledMethod

	| originalCode prettyCode originalTree prettyTree |
	originalCode := aCompiledMethod getSourceFromFile asString.
	prettyCode := PPFormatter
		formatString: originalCode
		class: aCompiledMethod methodClass
		noPattern: false.
	
	originalTree := Compiler new
		parser: (PPParser new includeGenerated: true);
		compile: originalCode in: aCompiledMethod methodClass notifying: nil ifFail: nil.
	prettyTree := Compiler new
		parser: (PPParser new includeGenerated: true);
		compile: prettyCode in: aCompiledMethod methodClass notifying: nil ifFail: nil.
	self assert: originalTree printString equals: prettyTree printString