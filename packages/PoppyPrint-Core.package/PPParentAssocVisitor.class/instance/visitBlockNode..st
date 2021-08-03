visiting
visitBlockNode: aNode

	aNode statements do: [:stmt | self parents at: stmt put: aNode].
	super visitBlockNode: aNode