helper
isMultiLineMessage: aNode

	| relevantParts |
	relevantParts := aNode originalArguments allButLast.
	aNode receiver ifNotNil: [relevantParts := relevantParts copyWithFirst: aNode receiver].
	
	^ aNode arguments size > 1 and: [
		(relevantParts anySatisfy: [:arg | self willBeMultiLine: arg]) or: [
			(aNode originalSelector size + (relevantParts inject: 0 into: [:sum :arg | sum + (self preFormat: arg) size])) > self remainingLineLength]]