printing
writeKeyContentOn: aStream with: indent

	| remainingLength writtenCharacters |
	writtenCharacters := aStream contents size - (aStream contents lastIndexOf: Character cr).
	self key do: [:each |
		each == Character cr
			ifTrue: [
				self newLineOn: aStream with: indent.
				writtenCharacters := indent - 1 * self indentSize]
			ifFalse: [
				remainingLength := self maxLineLength - writtenCharacters - each size.
				remainingLength < 0 ifTrue: [
					self newLineOn: aStream with: indent.
					writtenCharacters := indent - 1 * self indentSize].
				each printAsLiteralOn: aStream.
				writtenCharacters := writtenCharacters + each size + 1.
				each ~= self key last ifTrue: [aStream nextPut: $ ]]]