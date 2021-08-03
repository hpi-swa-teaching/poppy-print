visiting
visitAssignmentNode: aNode

	self parents at: aNode value put: aNode.
	self parents at: aNode variable put: aNode.
	super visitAssignmentNode: aNode