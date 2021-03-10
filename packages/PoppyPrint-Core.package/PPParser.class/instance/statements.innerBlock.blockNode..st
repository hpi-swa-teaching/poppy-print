expression types
statements: argNodes innerBlock: inner blockNode: theBlockNode

	| ret |
	ret := super statements: argNodes innerBlock: inner blockNode: theBlockNode.
	self addComment.
	^ ret