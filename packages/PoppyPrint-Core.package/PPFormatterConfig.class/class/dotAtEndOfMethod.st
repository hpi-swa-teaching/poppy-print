accessing
dotAtEndOfMethod

	<preference: 'Dot at End of Method'
	category: 'Poppy Print'
	description: 'Put a Dot at the End of a Method exept if the last Statement is a Return.'
	type: #Boolean>
	
	^ DotAtEndOfMethod ifNil: [false]