printing
printBlockComment: aNode

	aNode comment ifNotNil: [
		aNode comment do: [:comment |
			stream nextPut: $".
			stream nextPutAll: (self prepareMultilineLiteral: comment).
			stream nextPut: $".
			self newLine]]