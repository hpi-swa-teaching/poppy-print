helper
addCommentsOf: aNode

	^ aNode comment ifNotNil: [
		comments addAll: (aNode comment collect: [:c | self prepareMultilineLiteral: c])]