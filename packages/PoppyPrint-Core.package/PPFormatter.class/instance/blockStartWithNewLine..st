helper
blockStartWithNewLine: aNode

	^ aNode statements size > 0 and: [
		aNode statements size > 1 or: [
			(self willBeMultiLine: aNode statements first) or: [
				aNode statements first comment notNil or: [self hasBlockAsChild: aNode]]]]