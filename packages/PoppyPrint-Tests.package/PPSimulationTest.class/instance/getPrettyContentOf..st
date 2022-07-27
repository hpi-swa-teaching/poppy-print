helper
getPrettyContentOf: aBrowser

	aBrowser contentsSymbol: #prettyPrint.
	aBrowser contents: nil.
	^ aBrowser contents asString