helper
isOptionalNewLineMarker: aNode

	^ aNode isLiteralNode and: [aNode key = #ppOptionalNewLine]