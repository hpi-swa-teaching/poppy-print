helper
setMethodContentsTo: aString of: aBrowser using: aSymbol

	aBrowser  contentsSymbol: aSymbol.
	(aBrowser dependents at: 18) textMorph contents: aString.
	(aBrowser dependents at: 18) hasUnacceptedEdits: true.
	(aBrowser dependents at: 18) accept