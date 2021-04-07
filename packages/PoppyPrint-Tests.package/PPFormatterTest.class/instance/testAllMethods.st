tests - examples
testAllMethods

	| methods results |
	methods := self systemNavigation allClasses gather: [:class | class methodDictionary values, class theMetaClass methodDictionary values].
	results := Dictionary new: methods size.
	methods
		do: [:method | results at: method put:
			([self canFormatMethod: method. nil]
				on: TestResult exError, TestResult failure
				do: #yourself)]
		displayingProgress: [:method | 'Testing poppy for {1}' format: {method}].
	
	[self assert: [results allSatisfy: #isNil]]
		on: TestFailure
		do: ["In a perfect world, this wouldn't be necessary..."
			Transcript showln: ('{1}: The following methods were not poppy-printed correctly:\{2}' withCRs format: {
				self.
				(results associationsSelect: [:assoc | assoc value notNil]) keys asCommaString}).
			"
			self systemNavigation browseMessageList: ((results associationsSelect: [:assoc | assoc value notNil]) associations collect: [:assoc | assoc key methodReference]).
			"].
	
	self assert: (results values count: #notNil) / results size < 0.01.