helper
addCommentsOf: aNode

	^ aNode comment ifNotNil: [
		comments addAll: aNode comment.
		aNode comment: nil]