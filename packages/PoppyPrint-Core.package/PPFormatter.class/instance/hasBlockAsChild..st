helper
hasBlockAsChild: aBlockNode

	aBlockNode statements first isMessageNode
		ifTrue: [
			(aBlockNode statements first originalArguments findFirst: [:each | each isBlockNode]) > 0
				ifTrue: [^ true]].
	^ false