as yet unclassified
writeKeyContentOn: aStream with: indent

	| remainingLength |
	self key do: [:each |
		each == Character cr
			ifTrue: [self newLineOn: aStream with: indent]
			ifFalse: [
				remainingLength := (self remainingLineLength: aStream) - each size.
				remainingLength < 0
					ifTrue: [self newLineOn: aStream with: indent].
				each printAsLiteralOn: aStream.
				each ~= self key last ifTrue: [aStream nextPut: $ ]]]