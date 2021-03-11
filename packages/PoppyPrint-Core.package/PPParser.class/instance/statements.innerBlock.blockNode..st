expression types
statements: argNodes innerBlock: inner blockNode: theBlockNode
	"give initial comment to block, since others trail statements"

	| stmts returns start |
	theBlockNode comment: currentComment.
	currentComment := nil.
	stmts := OrderedCollection new.
	returns := false.
	hereType ~~ #rightBracket ifTrue: [
		[
			theBlockNode startOfLastStatement: (start := self startOfNextToken).
			(returns := self matchReturn)
				ifTrue: [
					self expression ifFalse: [^ self expected: 'Expression to return'].
					self addComment.
					stmts addLast: (parseNode isReturningIf ifTrue: [parseNode] ifFalse: [
						ReturnNode new expr: parseNode encoder: encoder sourceRange: (start to: self endOfLastToken)])]
				ifFalse: [
					self expression
						ifTrue: [
							self addComment.
							"if both branches return, following code is unreachable, let's avoid this.
																																	But only if interactive, we don't want to prevent loading of legacy code"
							self interactive ifTrue: [returns := parseNode isReturningIf].
							stmts addLast: parseNode]
						ifFalse: [
							self addComment.
							"THIS IS REMOVED
							stmts size = 0 ifTrue: [
								stmts addLast: (encoder encodeVariable: (inner ifTrue: ['nil'] ifFalse: ['self']))]"]].
			returns ifTrue: [
				self match: #period.
				(hereType == #rightBracket or: [hereType == #doIt]) ifFalse: [^ self expected: 'End of block']].
			returns not and: [self match: #period]] whileTrue].
	theBlockNode arguments: argNodes statements: stmts returns: returns from: encoder.
	parseNode := theBlockNode.
	" THIS IS ADDED: "
	(parseNode statements size = 1 and: [stmts size ~= 1]) ifTrue: [parseNode statements: {}].
	self addComment.
	" END "
	^ true