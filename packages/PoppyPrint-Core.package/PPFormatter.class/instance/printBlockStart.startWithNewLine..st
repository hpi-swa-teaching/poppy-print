printing
printBlockStart: aNode startWithNewLine: aBoolean

	self stream nextPut: $[.
	aNode arguments ifNotEmpty: [:args |
		args do: [:arg |
			self stream nextPut: $:.
			self stream nextPutAll: arg name.
			self stream space].
		self stream nextPut: $|.
		aBoolean ifFalse: [self stream space]]