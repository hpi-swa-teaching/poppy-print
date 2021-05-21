as yet unclassified
primitive: aPPNumberWithBaseOrString
	"Create indexed primitive."
	
	aPPNumberWithBaseOrString isString
		ifTrue: [^self primitive: aPPNumberWithBaseOrString error: nil]
		ifFalse:[^self primitive: aPPNumberWithBaseOrString number error: nil]
	