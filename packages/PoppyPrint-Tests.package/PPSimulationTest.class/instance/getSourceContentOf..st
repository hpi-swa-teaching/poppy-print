helper
getSourceContentOf: aBrowser

	aBrowser contentsSymbol: #source.
	aBrowser contents: nil.
	^ aBrowser contents asString