visiting
visitLiteralNode: aNode

	aNode key isString
		ifTrue: [(self prepareMultilineLiteral: aNode key) storeOn: stream]
		ifFalse: [aNode key printAsLiteralOn: stream]