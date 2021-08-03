initialize-release
initialize

	super initialize.
	self stream: '' writeStream;
		 indent: 0;
		 preFormatCache: Dictionary new;
		 comments: OrderedCollection new