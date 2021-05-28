helper
combineStringsUsingDicts: firstString and: secondString firstLabels: aDictionary secondLabels: anotherDictionary

	| outputString |
	
	outputString := firstString copyFrom: 1 to: ((aDictionary keysInOrder at: 1) - 1).
	1 to: aDictionary size - 1 do:[:index | 
		outputString := outputString, (secondString copyFrom: (anotherDictionary keysInOrder at: index)  
			to: (anotherDictionary keysInOrder at: index + 1) - 1).
		outputString := outputString, (firstString copyFrom: (aDictionary keysInOrder at: index + 1)
			to: ([(aDictionary keysInOrder at: index + 2) - 1] ifError: [firstString size])).
		index := index + 1].
	^outputString