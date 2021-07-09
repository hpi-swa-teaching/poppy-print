as yet unclassified
printKeyOn: aStream withIndent: indent

	self isByteArray
		ifFalse: [self printKeyAsArrayOn: aStream withIndent: indent]
		ifTrue: [self printKeyAsByteArrayOn: aStream withIndent: indent]