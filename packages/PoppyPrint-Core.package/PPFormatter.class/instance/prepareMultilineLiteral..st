helper
prepareMultilineLiteral: aString
	" ensure that our reindent: doesn't change the indent of this string "

	^ aString copy replaceAll: Character cr with: (Character value: 0)