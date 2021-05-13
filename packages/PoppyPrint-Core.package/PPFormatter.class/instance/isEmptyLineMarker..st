helper
isEmptyLineMarker: aNode

	^ (aNode isLiteralNode and: [aNode key = #ppEmptyLine]) or: (aNode isMessageNode and: [aNode originalSelector = #ppEmptyLine])