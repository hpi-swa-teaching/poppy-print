as yet unclassified
size

	| stream |
	stream := '' writeStream.
	self printAsLiteralOn: stream.
	^ stream contents size