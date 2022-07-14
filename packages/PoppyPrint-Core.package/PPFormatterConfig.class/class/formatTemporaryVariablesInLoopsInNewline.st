accessing
formatTemporaryVariablesInLoopsInNewline

	<preference: 'Format temporary variables in a block in a new line'
	category: 'Poppy Print'
	description: 'Formats temporary variables in a block in a new line'
	type: #Boolean>
	
	^ FormatTemporaryVariablesInLoopsInNewline ifNil: [false]