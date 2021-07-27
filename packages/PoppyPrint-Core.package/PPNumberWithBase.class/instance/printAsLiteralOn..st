printing
printAsLiteralOn: aStream

	self number < 0 ifTrue: [
		aStream nextPutAll: '-'.
		self number: self number negated].
	self base == 10 ifFalse: [
		self base printAsLiteralOn: aStream.
		aStream nextPutAll: 'r'].
	1 to: self leadingZeroAmount do: [:i | aStream nextPutAll: '0'].
	self number printAsLiteralOn: aStream withBase: self base