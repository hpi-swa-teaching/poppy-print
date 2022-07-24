helper
isOptionalEmptyLineMarker: aNode

	^ aNode isLiteralNode and: [aNode key = #ppOptionalEmptyLine]