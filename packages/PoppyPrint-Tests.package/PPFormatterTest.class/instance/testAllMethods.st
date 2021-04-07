tests - examples
testAllMethods

	self systemNavigation allMethods
		do: [:method | self canFormatMethod: method]
		displayingProgress: [:method | 'Testing poppy for {1}' format: {method}].