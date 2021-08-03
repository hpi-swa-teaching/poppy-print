helper
isMultiLineMessage: aNode

	| relevantParts |
	relevantParts := aNode originalArguments.
	" if our last argument spreads over multiple lines, we don't consider it "
	(self willBeMultiLine: relevantParts last)
		ifTrue: [relevantParts := relevantParts allButLast].
	
	aNode originalReceiver ifNotNil: [relevantParts := relevantParts copyWithFirst: aNode originalReceiver].
	
	^ (aNode originalArguments size > 1 or: [
		#(ifTrue: ifFalse:) includes: aNode originalSelector]) and: [
		(relevantParts anySatisfy: [:arg | self willBeMultiLine: arg]) or: [
			aNode originalSelector size + (relevantParts
				inject: 0
				into: [:sum :arg | sum + (self preFormat: arg) size]) > self remainingLineLength]]