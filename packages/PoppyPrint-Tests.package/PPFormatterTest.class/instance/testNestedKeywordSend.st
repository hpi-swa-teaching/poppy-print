tests
testNestedKeywordSend

	| node root formatter |
	root := Parser new
		parse: 'reportError (signalerContext findContextSuchThat: []) ifNotNil: [:context | ]'
		class: nil class
		noPattern: false
		notifying: nil
		ifFail: nil.
	node := root body statements first originalReceiver.
	formatter := PPFormatter new initForNode: root.
	self assert: (formatter needsParenthesisFor: node)