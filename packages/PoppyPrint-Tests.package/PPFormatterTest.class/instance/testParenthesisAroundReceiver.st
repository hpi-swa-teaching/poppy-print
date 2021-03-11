tests
testParenthesisAroundReceiver

	self canFormat: 'testMethod

	(self copy
		borderColor: (colors at: (j := i * 2 - flip));
		yourself)
		setVertices: (verts flipRotated: j);
		openInWorld'