printing
needsParenthesisFor: aNode

	self example: 'simple' receiver: [self class new] args: [
		{
			(Parser new
				parse: '(self assert: 2) ifNotNil: 3'
				class: nil class
				noPattern: true
				notifying: nil
				ifFail: nil) body statements first expr receiver}].
	
	(self needsParenthesisForNodeType: aNode)
		ifTrue: [
			(self needsParenthesisInCascade: aNode)
				ifFalse: [^ self needsParenthesisForPrecedence: aNode].
			^ true].
	^ false