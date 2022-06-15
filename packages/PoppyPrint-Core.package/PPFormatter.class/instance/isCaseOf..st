helper
isCaseOf: aNode

	^ aNode isMessageNode and: [#(#caseOf: #caseOf:otherwise:) includes: aNode originalSelector]