tests - examples
testObjectMethods
	| expectedFailures |
	expectedFailures := #(caseOf:otherwise: dpsTrace:levels:withContext:) flag: #todo. "https://github.com/tom95/poppy-print/issues/8"
	
	({Object. Object class} gather: #methodDict)
		reject: [:method | expectedFailures includes: method selector]
		thenDo: [:method | self canFormatMethod: method].