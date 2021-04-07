tests - examples
testAllMethods

	(self systemNavigation allClasses gather: [:class | class methodDictionary values, class theMetaClass methodDictionary values])
		do: [:method | self canFormatMethod: method]
		displayingProgress: [:method | 'Testing poppy for {1}' format: {method}].