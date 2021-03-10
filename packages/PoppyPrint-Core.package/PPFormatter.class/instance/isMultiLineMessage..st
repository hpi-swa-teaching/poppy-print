helper
isMultiLineMessage: aNode

	| relevantParts |
	relevantParts := {aNode receiver}, aNode originalArguments allButLast.
	
	^ aNode arguments size > 1 and: [
		(relevantParts anySatisfy: [:arg | self willBeMultiLine: arg]) or:
		[(aNode originalSelector size + (relevantParts inject: 0 into: [:sum :arg | sum + (self preFormat: arg) size])) > self remainingLineLength]]