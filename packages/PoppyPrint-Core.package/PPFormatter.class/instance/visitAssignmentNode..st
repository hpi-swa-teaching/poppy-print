visiting
visitAssignmentNode: aNode

	self stream nextPutAll: aNode variable name.
	self stream nextPutAll: ' := '.
	self visitNode: aNode value