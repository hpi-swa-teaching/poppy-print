helper
isTypeOfNewLineMarker: aNode

	^ ((self isOptionalEmptyLineMarker: aNode) or: [self isOptionalNewLineMarker: aNode] or: [self isEmptyLineMarker: aNode])