visiting
visitMethodNode: aNode

	self parents at: aNode body put: aNode.
	super visitMethodNode: aNode