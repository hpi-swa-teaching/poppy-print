visiting
visitMessageNode: aNode

	self parents at: aNode originalReceiver put: aNode.
	aNode originalArguments do: [:arg | self parents at: arg put: aNode].
	
	aNode originalReceiver accept: self.
	aNode originalArguments do: [:argument | argument accept: self]