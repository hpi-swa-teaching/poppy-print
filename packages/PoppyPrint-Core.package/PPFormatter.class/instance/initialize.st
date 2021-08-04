initialize-release
initialize

	super initialize.
	stream := '' writeStream.
	indent := 0.
	preFormatCache := Dictionary new