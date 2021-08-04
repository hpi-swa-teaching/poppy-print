helper
braceNodeHasMultiLineParts: aNode

	^ (aNode elements anySatisfy: [:node |
		(self willBeMultiLine: node) or: [self isEmptyLineMarker: node]]) or: [self isCaseOf: (self parentFor: aNode)]