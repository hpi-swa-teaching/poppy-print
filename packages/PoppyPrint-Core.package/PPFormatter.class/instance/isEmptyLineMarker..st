helper
isEmptyLineMarker: aNode

	^ aNode isLiteralNode and: [aNode key = #ppEmptyLine]