helper
isNothingMarker: aNode

	^ aNode isLiteralNode and: [aNode key = #ppNothing]