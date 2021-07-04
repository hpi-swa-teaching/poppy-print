as yet unclassified
printKeyAsArrayOn: aStream withIndent: indent

	aStream
		nextPut: $#;
		nextPut: $(.
	self writeKeyContentOn: aStream with: indent.
	aStream nextPut: $)