helper
printBraceStatements: aNode multiLine: multiLine

	aNode elements do: [:element | | isLast |
		isLast := element = aNode elements last.
		((self isOptionalNewLineMarker: element) and: [multiLine]) ifFalse: [
			((self isEmptyLineMarker: element) or: [self isOptionalEmptyLineMarker: element])
				ifTrue: [self newLine]
				ifFalse: [
					(self isOptionalNewLineMarker: element) ifFalse: [
						self visitNode: element.
						isLast ifFalse: [
							config spaceBeforePointInArray ifTrue: [stream space].
							self stream nextPut: $.]].
					
					isLast ifFalse: [multiLine ifTrue: [self newLine] ifFalse: [self stream space]]]]]