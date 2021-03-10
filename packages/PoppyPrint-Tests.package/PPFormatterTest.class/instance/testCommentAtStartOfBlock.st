tests - comments
testCommentAtStartOfBlock

	self canFormat: 'helloWorld

	self halt.
	self do: [:a |
		" start comment "
		self halt.
		" end comment "].
	self halt'