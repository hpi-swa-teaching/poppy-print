visiting
visitLiteralNode: aNode

	aNode key isString
		ifTrue: [(self prepareMultilineLiteral: aNode key) storeOn: self stream]
		ifFalse: [aNode key printAsLiteralOn: self stream]