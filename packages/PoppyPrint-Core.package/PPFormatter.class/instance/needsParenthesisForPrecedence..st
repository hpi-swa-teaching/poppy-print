helper
needsParenthesisForPrecedence: aNode

	| precedence outerPrecedence |
	precedence := self precedenceOf: aNode.
	outerPrecedence := self precedenceOf: (self parentFor: aNode).
	
	" binary send chain with a binary message as argument "
	(precedence = outerPrecedence and: [
		precedence = 2 and: [aNode ~= (self parentFor: aNode) originalReceiver]])
		ifFalse: [
			(precedence <= outerPrecedence and: [
				precedence ~= 3 or: [outerPrecedence ~= 3]])
				ifTrue: [^ false]].
	^ true