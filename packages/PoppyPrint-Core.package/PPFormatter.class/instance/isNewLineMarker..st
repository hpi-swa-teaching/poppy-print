helper
isNewLineMarker: aNode

	^ (aNode isLiteralNode and: [aNode key = #ppNewLine])