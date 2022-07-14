accessing
spaceBeforeComma

	<preference: 'Space before Comma'
	category: 'Poppy Print'
	description: 'Put a Space before a Comma when concatenating a String.'
	type: #Boolean>
	
	^ SpaceBeforeComma ifNil: [false]