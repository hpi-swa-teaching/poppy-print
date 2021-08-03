printing
printBlockComment: aNode

	aNode comment ifNotNil: [
		aNode comment do: [:comment |
			self stream nextPut: $".
			self stream nextPutAll: (self prepareMultilineLiteral: comment).
			self stream nextPut: $".
			self newLine]]