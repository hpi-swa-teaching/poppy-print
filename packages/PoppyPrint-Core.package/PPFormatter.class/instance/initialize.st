initialize-release
initialize

	super initialize.
	self stream: '' writeStream.
	self indent: 0.
	self preFormatCache: Dictionary new