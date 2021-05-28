as yet unclassified
printAsLiteralOn: aStream

	self base == 10 ifFalse: [
		self base printAsLiteralOn: aStream.
		aStream nextPutAll: 'r'].
	self number printAsLiteralOn: aStream withBase: self base