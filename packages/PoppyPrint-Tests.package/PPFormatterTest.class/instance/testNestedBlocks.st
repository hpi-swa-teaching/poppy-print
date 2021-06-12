tests - blocks
testNestedBlocks

	self canFormat: 'visitBlockNode: aNode

	| isMethodBlock startWithNewLine |
	isMethodBlock := (self parentFor: aNode) isKindOf: MethodNode.
	startWithNewLine := isMethodBlock not and: [
		aNode statements size > 0 and: [
			aNode statements size > 1 or: [
				(self willBeMultiLine: aNode statements first) or: [aNode statements first comment notNil]]]]'