accessing
spaceBeforePointInArray

	<preference: 'Spcae before Point in Array'
	category: 'Poppy Print'
	description: 'Put a Space before a Point in Arrays.'
	type: #Boolean>
	
	^ SpaceBeforePointInArray ifNil: [false]