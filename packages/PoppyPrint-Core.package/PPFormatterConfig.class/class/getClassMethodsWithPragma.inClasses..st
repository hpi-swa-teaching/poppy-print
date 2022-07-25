helpers
getClassMethodsWithPragma: aSymbol inClasses: aClassList

	^ (aClassList gather: [:methodClass | Pragma allNamed: aSymbol in: methodClass class])
		collect: [:pragma | pragma method]