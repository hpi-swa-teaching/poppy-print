helper
methodCommentIsNonFormatting: aMethod

	| comment |
	comment := aMethod methodComment.
	(comment findString: self nonFormattingMethodComment) > 0
		ifTrue: [^ true]
		ifFalse: [^ false]