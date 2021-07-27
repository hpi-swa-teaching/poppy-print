expression types
braceExpression
	" { elements } => BraceNode."
	"based on: Parser >> braceExpression"
	
	| elements locations loc more |
	elements := OrderedCollection new.
	locations := OrderedCollection new.
	self advanceWithCr.
	more := hereType ~~ #rightBrace.
	[more] whileTrue: [
		loc := hereMark + requestorOffset.
		"modification"
		here == Character cr ifTrue: [
			elements addLast: (encoder encodeLiteral: #ppNewLine).
			locations addLast: loc.
			self advanceWithCr].
		self expressionWithCr
			"end of modification"
			ifTrue: [
				elements addLast: parseNode.
				locations addLast: loc]
			ifFalse: [^ self expected: 'Variable or expression or right brace'].
		(self match: #period)
			ifTrue: [more := hereType ~~ #rightBrace]
			ifFalse: [more := false]].
	parseNode := BraceNode new
		elements: elements
		sourceLocations: locations.
	(self match: #rightBrace)
		ifFalse: [^ self expected: 'Period or right brace'].
	^ true