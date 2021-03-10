printing
printMethodComment: aNode

	aNode comment ifNotNil: [
		aNode comment do: [:comment |
			stream crtab: 1.
			stream nextPut: $".
			stream nextPutAll: comment.
			stream nextPut: $"]]