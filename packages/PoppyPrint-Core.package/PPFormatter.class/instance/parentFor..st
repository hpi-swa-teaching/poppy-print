helper
parentFor: aNode

	^ self parents at: aNode ifAbsent: [nil]