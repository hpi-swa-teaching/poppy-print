helper
prepareNewLines: anArray
	" ensure that our reindent: doesn't change the indent of this array "

	^ anArray copy replaceAll: Character cr with: (Character value: 0)