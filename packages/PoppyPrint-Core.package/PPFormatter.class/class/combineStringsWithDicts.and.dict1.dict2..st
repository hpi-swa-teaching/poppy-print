helper
combineStringsWithDicts: aFormattedString and: anUnformattedString dict1: aDictionary dict2: anotherDictionary

	| outputString |
	
	self halt.
	outputString := aFormattedString copyFrom: 1 to: ((aDictionary keysInOrder at: 1) - 1).
	1 to: aDictionary size - 1 do:[:index | 
		outputString := outputString, (anUnformattedString copyFrom: (anotherDictionary keysInOrder at: index)  
			to: (anotherDictionary keysInOrder at: index + 1) - 1).
		outputString := outputString, (aFormattedString copyFrom: (aDictionary keysInOrder at: index + 1)
			to: ([(aDictionary keysInOrder at: index + 2) - 1] ifError: [aFormattedString size])).
		index := index + 1].
	^outputString