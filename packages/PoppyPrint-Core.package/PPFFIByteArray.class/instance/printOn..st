as yet unclassified
printOn: aStream
	self byteArray do: [:each |aStream nextPut: each asCharacter]
