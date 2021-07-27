primitives
primitive: aPPNumberWithBaseOrString
	"Create indexed primitive."
	"based on: Parser >> primitive:"

	aPPNumberWithBaseOrString isInteger
		ifTrue: [^ self primitive: aPPNumberWithBaseOrString error: nil]
		ifFalse: [aPPNumberWithBaseOrString isString
			 ifTrue: [^ self primitive: aPPNumberWithBaseOrString error: nil]
			 ifFalse: [^ self primitive: aPPNumberWithBaseOrString number error: nil].]