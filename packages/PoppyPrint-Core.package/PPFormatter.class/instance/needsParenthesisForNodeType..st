helper
needsParenthesisForNodeType: aNode

	^ (aNode isLeaf or: [
		(aNode isKindOf: ReturnNode) or: [
			aNode isBlockNode or: [
				(self parentFor: aNode) isBlockNode or: [
					(self parentFor: aNode) isBraceNode or: [
						aNode isMessage and: [aNode originalSelector isUnary]]]]]]) not