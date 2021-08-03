printing
printMethodComment: aNode

	aNode comment ifNotNil: [
		aNode comment do: [:comment |
			self stream crtab: 1.
			self stream nextPut: $".
			self stream nextPutAll: (self prepareMultilineLiteral: comment).
			self stream nextPut: $"]]