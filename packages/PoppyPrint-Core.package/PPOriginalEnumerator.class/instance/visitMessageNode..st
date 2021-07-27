as yet unclassified
visitMessageNode: aMessageNode

	"based on: ParseNodeEnumerator >> visitMessageNode:"
	(theSelectBlock isNil or: [theSelectBlock value: aMessageNode])
		ifFalse: [^ nil].
	theBlock value: aMessageNode.
	
	"modification"
	aMessageNode originalReceiver accept: self.
	aMessageNode originalArguments do: [:argument | argument accept: self]
	"end of modification"