expression types
method: doit context: ctxt
	" pattern [ | temporaries ] block => MethodNode."
	"based on: Parser >> method:context:"

	| sap blk prim temps messageComment methodNode |
	sap := self pattern: doit inContext: ctxt.
	"sap={selector, arguments, precedence}"
	self properties selector: (sap at: 1).
	encoder selector: (sap at: 1).
	(sap at: 2) do: [:argNode | argNode beMethodArg].
	doit ifFalse: [self pragmaSequence].
	"modification: first pop comments, then parse temporaries "
	messageComment := currentComment.
	currentComment := nil.
	temps := self temporaries.
	"end of modification"
	
	doit ifFalse: [self pragmaSequence].
	prim := self pragmaPrimitives.
	self statements: #() innerBlock: false blockNode: BlockNode new.
	blk := parseNode.
	"modification"
	
	self includeGenerated ifTrue: [
		doit ifTrue: [blk returnLast] ifFalse: [blk returnSelfIfNoOther: encoder]].
	"end of modification"
	hereType == #doIt ifFalse: [^ self expected: 'Nothing more'].
	methodNode := self newMethodNode comment: messageComment.
	methodNode
		selector: (sap at: 1)
		arguments: (sap at: 2)
		precedence: (sap at: 3)
		temporaries: temps
		block: blk
		encoder: encoder
		primitive: prim
		properties: properties.
	self interactive ifTrue: [
		self declareUndeclaredTemps: methodNode.
		self removeUnusedTemps: methodNode].
	^ methodNode