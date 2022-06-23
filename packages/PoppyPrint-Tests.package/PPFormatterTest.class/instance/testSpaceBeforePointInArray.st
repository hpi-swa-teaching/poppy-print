tests - spaces in Array
testSpaceBeforePointInArray

 self canFormat: 
'test

	{0. 0. 0. 0. 0. 1}' 
	as: 
'test

	{0 . 0 . 0 . 0 . 0 . 1}' 
	with: self getConfigSpacesBeforePointInArray