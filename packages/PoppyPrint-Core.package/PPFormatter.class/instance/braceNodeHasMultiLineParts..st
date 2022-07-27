helper
braceNodeHasMultiLineParts: aNode

	^ (aNode elements anySatisfy: [:node |
		(self willBeMultiLine: node) or: [self isTypeOfNewLineMarker: node]]) or: [self isCaseOf: (self parentFor: aNode)]
