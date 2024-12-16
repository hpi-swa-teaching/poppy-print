helper
currentLineLength

	^ stream contents size - (stream contents lastIndexOf: Character cr)