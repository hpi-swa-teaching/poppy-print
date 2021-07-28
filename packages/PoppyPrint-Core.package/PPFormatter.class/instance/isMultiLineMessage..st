helper
isMultiLineMessage: aNode

	| relevantParts |
	relevantParts := self getRelevantPartsOfMessage: aNode.
	
	^ (aNode originalArguments size > 1 or: [
		aNode originalSelector == #ifFalse: or: [aNode originalSelector == #ifTrue:]]) and: [
		(relevantParts anySatisfy: [:arg | self willBeMultiLine: arg]) or: [
			aNode originalSelector size + (relevantParts
				inject: 0
				into: [:sum :arg | sum + (self preFormat: arg) size]) > self remainingLineLength]]