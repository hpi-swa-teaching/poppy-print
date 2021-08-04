accessing
size

	| stream |
	stream := '' writeStream.
	self printAsLiteralOn: stream.
	^ stream contents size