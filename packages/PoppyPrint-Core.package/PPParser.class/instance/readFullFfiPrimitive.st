helper
readFullFfiPrimitive

	[self hereChar ~= $>] whileTrue: [
		self buffer nextPut: self step].
	self token: PPByteArray new.
	self token byteArray: (self buffer contents) asByteArray.
	self tokenType: #literal.
	self advance.