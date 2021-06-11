as yet unclassified
printKeyAsByteArrayOn: aStream withIndent: indent

	aStream nextPut: $#; nextPut: $[.
	self writeKeyContentOn: aStream with: indent.
	aStream nextPut: $]