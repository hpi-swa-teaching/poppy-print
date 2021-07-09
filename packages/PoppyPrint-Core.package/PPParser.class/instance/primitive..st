as yet unclassified
primitive: aPPNumberWithBaseOrString
	"Create indexed primitive."

	aPPNumberWithBaseOrString isInteger
		ifTrue: [^ self primitive: aPPNumberWithBaseOrString error: nil]
		ifFalse: [aPPNumberWithBaseOrString isString
			 ifTrue: [^ self primitive: aPPNumberWithBaseOrString error: nil]
			 ifFalse: [^ self primitive: aPPNumberWithBaseOrString number error: nil].]