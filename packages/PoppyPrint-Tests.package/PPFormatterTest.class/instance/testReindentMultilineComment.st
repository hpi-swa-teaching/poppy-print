tests - comments
testReindentMultilineComment

	self canFormat: 'helloWorld

	self halt.
	b ifTrue: [
		a ifTrue: [
			self halt.
			" start comment
					continue comment
					here"]].
	self halt'