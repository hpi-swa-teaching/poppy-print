helper
precedenceOf: aNode

	^ aNode accept: PPPrecedenceVisitor new