visiting
visitBraceNode: aNode

	aNode elements do: [:el | parents at: el put: aNode].
	super visitBraceNode: aNode