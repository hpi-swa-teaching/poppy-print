tests - WindowWidth
testStandaredWindowWidth2

 self canFormat: 
'test

	aaa aa aaa aaa' 
	as: 
'test

	aaa aa
		aaa aaa' 
	with: (self getConfigWindowWidth: 10)