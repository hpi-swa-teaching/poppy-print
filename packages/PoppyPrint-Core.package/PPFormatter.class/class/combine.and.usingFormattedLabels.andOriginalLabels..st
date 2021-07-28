helper
combine: formattedString and: originalString usingFormattedLabels: formattedLabels andOriginalLabels: originalLabels

	| outputString helperString |
	outputString := formattedString
		copyFrom: 1
		to: (formattedLabels keysInOrder at: 1) - 1.
	1 to: formattedLabels size - 1 by: 2 do: [:index |
		helperString := originalString
			copyFrom: (originalLabels keysInOrder at: index)
			to: (originalLabels keysInOrder at: index + 1) - 1.
		helperString := self clearOutStartLabels: helperString.
		outputString := outputString, helperString.
		
		helperString := formattedString
			copyFrom: (formattedLabels keysInOrder at: index + 1)
			to: ([(formattedLabels keysInOrder at: index + 2) - 1] ifError: [formattedString size]).
		helperString := self clearOutStopLabels: helperString.
		outputString := outputString, helperString].
	
	^ outputString