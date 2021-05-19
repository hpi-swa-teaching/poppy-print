as yet unclassified
visitMessageNode: aMessageNode

	(theSelectBlock isNil or: [theSelectBlock value: aMessageNode]) ifFalse: [^ nil].
	theBlock value: aMessageNode.
	
	aMessageNode originalReceiver accept: self.
	aMessageNode originalArguments do: [:argument | argument accept: self]