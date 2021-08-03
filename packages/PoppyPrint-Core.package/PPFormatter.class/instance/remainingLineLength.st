helper
remainingLineLength

	^ self maxLineLength - (self stream contents size - (self stream contents lastIndexOf: Character cr))