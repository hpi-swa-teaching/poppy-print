visiting
evaluateBraceStatements: aNode multiLine: multiLine

	aNode elements do: [:element | | isLast |
		isLast := element = aNode elements last.
		(self isNothingMarker: element) ifFalse: [
			(self isNewLineMarker: element)
				ifTrue: [self newLine]
				ifFalse: [
					(self isEmptyLineMarker: element) ifFalse: [
						self visitNode: element.
						isLast ifFalse: [self stream nextPut: $.]].
					
					isLast ifFalse: [
						multiLine ifTrue: [self newLine] ifFalse: [self stream space]]]]]