tests - format temp variables in Loops in newline
testFormatTemporaryVariablesInLoopsInNewline1

	self canFormat: 'test

	{1. 2. 3} do: [:a |
		| tmp |	
		tmp := a.
		1 + 1]' with: self getFormatTemporaryVariablesInLoopsInNewline 