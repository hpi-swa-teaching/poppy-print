helper
getRelevantPartsOfMessage: aNode

	| relevantParts |
	relevantParts := aNode originalArguments.
	" if our last argument spreads over multiple lines, we don't consider it "
	(self willBeMultiLine: relevantParts last)
		ifTrue: [relevantParts := relevantParts allButLast].
	
	aNode originalReceiver ifNotNil: [relevantParts := relevantParts copyWithFirst: aNode originalReceiver].
	
	^ relevantParts