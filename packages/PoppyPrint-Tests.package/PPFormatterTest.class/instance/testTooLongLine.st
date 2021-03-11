tests - comments
testTooLongLine

	self canFormat: 'compositeAnimations

	^ 123123 value
		ifNil: [#()]
		ifNotNil: [:registry | registry compositeAnimations select: [:anim | anim includesPropertyAnimationFor: self]]'