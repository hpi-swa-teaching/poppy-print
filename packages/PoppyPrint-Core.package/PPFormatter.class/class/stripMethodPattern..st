format
stripMethodPattern: aString

	^ (aString copyFrom: (PPParser new startOfMethodBody: aString) + 1 to: aString size) withBlanksTrimmed