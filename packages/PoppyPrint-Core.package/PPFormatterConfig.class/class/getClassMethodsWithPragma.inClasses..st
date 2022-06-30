helpers
getClassMethodsWithPragma: aSymbol inClasses: aClassList

	| stream methodsWithPragma |
	stream := WriteStream with: #().
	(aClassList collect: [:methodClass | Pragma allNamed: aSymbol in: (methodClass class)]) do: [:listOfMethods | stream nextPutAll: listOfMethods].
	methodsWithPragma := stream contents.
	methodsWithPragma := methodsWithPragma collect: [:aPragma | aPragma method].
	^ methodsWithPragma