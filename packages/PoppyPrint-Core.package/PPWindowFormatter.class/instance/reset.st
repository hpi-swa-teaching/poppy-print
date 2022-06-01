initialize
reset

	seperators := { Character cr. Character tab. Character space}.
	resultStream := '' writeStream.
	wordStream := '' writeStream.
	lineWidth := 0.
	wordWidth := 0.
	tabCount := 0.
	index := 1.
	
	self skipToEndOfFirstWord