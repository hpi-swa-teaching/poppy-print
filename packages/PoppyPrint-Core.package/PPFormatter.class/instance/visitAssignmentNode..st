visiting
visitAssignmentNode: aNode

	stream nextPutAll: aNode variable name.
	stream nextPutAll: ' := '.
	self visitNode: aNode value