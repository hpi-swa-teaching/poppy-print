helper
isMultiLineMessage: aNode

	| relevantParts partsWithReceiver |
	relevantParts := aNode originalArguments.
	" if our last argument spreads over multiple lines, we don't consider it "
	(self willBeMultiLine: relevantParts last) ifTrue: [relevantParts := relevantParts allButLast].
	partsWithReceiver := aNode originalReceiver ifNotNil: [relevantParts copyWithFirst: aNode originalReceiver] ifNil: [relevantParts].
	
	^ (aNode originalArguments size > 1 and: [partsWithReceiver anySatisfy: [:arg | self willBeMultiLine: arg]]) or: [aNode originalSelector size + (relevantParts inject: 0 into: [:sum :arg | sum + (self preFormat: arg) size]) > self remainingLineLength]