as yet unclassified
remainingLineLength: aStream

	^ self maxLineLength - (aStream contents size - (aStream contents lastIndexOf: Character cr))