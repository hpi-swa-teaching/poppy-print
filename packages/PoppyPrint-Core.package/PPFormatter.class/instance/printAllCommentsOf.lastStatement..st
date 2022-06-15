printing
printAllCommentsOf: aNode lastStatement: aBoolean

	| myStatementsComments |
	myStatementsComments := Array streamContents: [:s |
		aNode accept: (PPOriginalEnumerator
			ofBlock: [:node | node comment ifNotNil: [s nextPutAll: node comment]]
			select: [:node | node isBlockNode not])].
	
	(myStatementsComments notEmpty and: [aBoolean]) ifTrue: [self newLine].
	
	myStatementsComments do: [:comment |
		stream nextPut: $".
		stream nextPutAll: (self prepareMultilineLiteral: comment).
		stream nextPut: $".
		(aBoolean not or: [comment ~= myStatementsComments last]) ifTrue: [self newLine]]