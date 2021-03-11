expression types
statements: argNodes innerBlock: inner blockNode: theBlockNode
	"give initial comment to block, since others trail statements"

	| stmts start returns |
	theBlockNode comment: currentComment.
	currentComment := nil.
	stmts := OrderedCollection new.
	returns := false.
	hereType ~~ #rightBracket ifTrue: [
		[
			theBlockNode startOfLastStatement: (start := self startOfNextToken).
			self matchReturn
				ifTrue: [
					returns := true.
					self expression ifFalse: [^ self expected: 'Expression to return'].
					self addComment.
					stmts addLast: (parseNode isReturningIf
						ifTrue: [parseNode]
						ifFalse: [ReturnNode new expr: parseNode encoder: encoder sourceRange: (start to: self endOfLastToken)])]
				ifFalse: [
					self expression
						ifTrue: [
							self addComment.
							"if both branches return, following code is unreachable, let's avoid this.
							But only if interactive, we don't want to prevent loading of legacy code"
							self interactive ifTrue: [returns := returns or: [parseNode isReturningIf]].
							stmts addLast: parseNode]
						ifFalse: [
							self addComment.
							"CHANGE"
							(self includeGenerated and: [stmts size = 0]) ifTrue: [
								stmts addLast: (inner ifTrue: [encoder encodeVariable: 'nil'] ifFalse: [encoder lookupVariable: 'self' ifAbsent: [self assert: false]])]]].
			"returns ifTrue: 
				[self match: #period.
				 (hereType == #rightBracket or: [hereType == #doIt]) ifFalse: [^ self expected: 'End of block']]."
			"returns not and: ["self match: #period"]"] whileTrue].
	theBlockNode arguments: argNodes statements: stmts returns: returns from: encoder.
	parseNode := theBlockNode.
	" THIS IS ADDED: "
	(self includeGenerated not and: [parseNode statements size = 1 and: [stmts size ~= 1]]) ifTrue: [parseNode statements: {}].
	self addComment.
	" END "
	^ true