accessing
spaceBeforePointInArray

	<preference: 'Space before Point in Array'
	category: 'Poppy Print'
	description: 'Put a Space before a Point in Arrays.'
	type: #Boolean>
	
	^ SpaceBeforePointInArray ifNil: [false]