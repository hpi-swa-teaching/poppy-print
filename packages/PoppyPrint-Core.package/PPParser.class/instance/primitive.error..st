as yet unclassified
primitive: aPPNumberWithBaseOrString error: errorCodeVariableOrNil
	"Create indexed primitive with optional error code."

	^ aPPNumberWithBaseOrString isPPNumberWithBase
		ifTrue: [
			errorCodeVariableOrNil ifNotNil: [encoder floatTemp: (encoder bindTemp: errorCodeVariableOrNil) nowHasDef].
			aPPNumberWithBaseOrString number]
		ifFalse: [
			aPPNumberWithBaseOrString isInteger
				ifTrue: [
					errorCodeVariableOrNil ifNotNil: [encoder floatTemp: (encoder bindTemp: errorCodeVariableOrNil) nowHasDef].
					aPPNumberWithBaseOrString]
				ifFalse: [
					aPPNumberWithBaseOrString isString
						ifTrue: [
							self
								primitive: aPPNumberWithBaseOrString
								module: nil
								error: errorCodeVariableOrNil]
						ifFalse: [self expected: 'Indexed primitive']]]