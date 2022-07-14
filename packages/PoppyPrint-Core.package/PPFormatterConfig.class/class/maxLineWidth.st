accessing
maxLineWidth

	<preference: 'Max Line Width'
	category: 'Poppy Print'
	description: 'Set ''maxLineWidth'' for formatting to Max Line Width.'
	type: #Number>
	
	^ MaxLineWidth ifNil: [83]