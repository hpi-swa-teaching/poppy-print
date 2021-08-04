helper
needsParenthesisInCascade: aNode

	^ ((self parentFor: aNode) isKindOf: CascadeNode) and: [
		(aNode isKindOf: CascadeNode) or: [
			aNode isMessage and: [
				aNode originalSelector isUnary not and: [(self parentFor: aNode) originalReceiver = aNode]]]]