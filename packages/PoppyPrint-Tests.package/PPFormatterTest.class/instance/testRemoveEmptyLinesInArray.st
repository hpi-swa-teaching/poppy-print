tests - keepNewLines
testRemoveEmptyLinesInArray

	self canFormat: 'testArray

	#(10 10 10 
	
	
		10 
		10)' as: 'testArray

	#(10 10 10 
		10 
		10)'
	