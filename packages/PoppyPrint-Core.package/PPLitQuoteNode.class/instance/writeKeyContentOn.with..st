as yet unclassified
writeKeyContentOn: aStream with: indent

	self key do: [:each |
		(each == Character cr)
		ifTrue: [self newLineOn: aStream with: indent]
		ifFalse: [each printAsLiteralOn: aStream.
			each ~= self key last ifTrue: [aStream nextPut: $ ]]].