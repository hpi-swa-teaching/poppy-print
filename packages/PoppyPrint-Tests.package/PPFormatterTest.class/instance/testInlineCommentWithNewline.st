tests - comments
testInlineCommentWithNewline

	self
		canFormat: 'testMethod true "test"

	or: [false]'
		as: 'testMethod
	"test"

	true or: [false]'