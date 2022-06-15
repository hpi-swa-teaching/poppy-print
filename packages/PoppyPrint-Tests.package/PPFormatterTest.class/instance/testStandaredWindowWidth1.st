tests - WindowWidth
testStandaredWindowWidth1

 self canFormat: 
'test

	aaa aa aa aaa' 
	as: 
'test

	aaa aa aa
		aaa' 
	with: (self getConfigWindowWidth: 10)