tests
testOnlyLastArgumentIsLong

	self canFormat: 'testMethod

	2 to: lines size do: [:index |
		lines put: (currentIndent > indent
			ifTrue: [(lines at: index) allButFirst: currentIndent - indent]
			ifFalse: [])]'