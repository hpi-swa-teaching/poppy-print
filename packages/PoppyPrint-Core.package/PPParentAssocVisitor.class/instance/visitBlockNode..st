visiting
visitBlockNode: aNode

	aNode statements do: [:stmt | parents at: stmt put: aNode].
	super visitBlockNode: aNode