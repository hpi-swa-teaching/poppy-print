accessing
shouldSkipStatement: aBoolean

	| element |
	^ self isEmptyLineMarker: element
		ifTrue: [self newLine]
		ifFalse: [
					(self isOptionalEmptyLineMarker: element) or: [self isOptionalNewLineMarker: element]].