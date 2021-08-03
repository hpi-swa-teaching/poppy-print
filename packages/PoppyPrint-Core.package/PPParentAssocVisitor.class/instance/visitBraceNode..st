visiting
visitBraceNode: aNode

	aNode elements do: [:el | self parents at: el put: aNode].
	super visitBraceNode: aNode