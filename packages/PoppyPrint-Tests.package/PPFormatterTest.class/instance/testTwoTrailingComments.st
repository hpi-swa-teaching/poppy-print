tests - comments
testTwoTrailingComments

	self
		canFormat: 'copyWeakly

	^ 123
	"add yours to this list" 

	"formerOwner should really be nil at the time of the copy, but this will work just fine."'
		as: 'copyWeakly

	^ 123
	"add yours to this list"
	"formerOwner should really be nil at the time of the copy, but this will work just fine."'