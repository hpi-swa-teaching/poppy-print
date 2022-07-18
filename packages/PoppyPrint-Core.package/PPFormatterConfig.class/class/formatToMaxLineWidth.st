accessing
formatToMaxLineWidth

	<preference: 'Format to Max line Width'
	category: 'Poppy Print'
	description: 'Make PoppyPrint put newlines so the Code has a maximum line width of ''maxLineWidth''.'
	type: #Boolean>
	
	^ FormatToMaxLineWidth ifNil: [false]