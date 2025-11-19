printing
printBlockStart: aNode startWithNewLine: aBoolean

	stream nextPut: $[.
	aNode arguments ifNotEmpty: [:args |
		args do: [:arg |
			stream nextPut: $:.
			stream nextPutAll: arg key.
			stream space].
		stream nextPut: $|.
		aBoolean ifFalse: [stream space]]