helper
remainingLineLength

	^ self maxLineLength - (stream contents size - (stream contents lastIndexOf: Character cr))