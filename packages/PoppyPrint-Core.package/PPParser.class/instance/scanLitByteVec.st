as yet unclassified
scanLitByteVec
	| stream |
	stream := WriteStream on: (Array new: 16).
	[ tokenType == #rightBracket or: [ tokenType == #doIt ] ] whileFalse: [
		tokenType == #word
			ifTrue: [ self scanLitWord ].
		(token == Character cr or: [token isPPNumberWithBase and: [ token between: 0 and: 255 ]])
			ifFalse: [ ^ self offEnd: '8-bit integer or right bracket expected' ].
		stream nextPut: token.
		self scanTokenWithCr ].
	token := stream contents