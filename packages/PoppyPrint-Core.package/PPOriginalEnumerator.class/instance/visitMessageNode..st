visiting
visitMessageNode: aMessageNode
	"based on: ParseNodeEnumerator >> visitMessageNode:"

	(self theSelectBlock isNil or: [self theSelectBlock value: aMessageNode])
		ifFalse: [^ nil].
	self theBlock value: aMessageNode.
	"modification"
	
	aMessageNode originalReceiver accept: self.
	aMessageNode originalArguments do: [:argument |
		argument accept: self
		"end of modification"]