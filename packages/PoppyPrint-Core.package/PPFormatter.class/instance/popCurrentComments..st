printing
popCurrentComments: aBoolean

	comments do: [:comment |
		stream nextPut: $".
		stream nextPutAll: comment.
		stream nextPut: $".
		(aBoolean or: [comment ~= comments last]) ifTrue: [self newLine]].
	comments removeAll