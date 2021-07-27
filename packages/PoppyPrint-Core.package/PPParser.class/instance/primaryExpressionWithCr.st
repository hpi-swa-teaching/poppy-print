expression types
primaryExpressionWithCr

	"based on: Parser >> primaryExpression"
	hereType == #word ifTrue: [
		parseNode := self variable.
		(parseNode isUndefTemp and: [self interactive])
			ifTrue: [self queryUndefined].
		parseNode nowHasRef.
		^ true].
	"modification"
	hereType == #leftBracket ifTrue: [
		self advanceWithCr.
		self blockExpression.
		^ true].
	hereType == #leftBrace ifTrue: [
		self braceExpression.
		^ true].
	hereType == #leftParenthesis ifTrue: [
		self advanceWithCr.
		self expressionWithCr
			ifFalse: [^ self expected: 'expression'].
		(self match: #rightParenthesis)
			ifFalse: [^ self expected: 'right parenthesis'].
		^ true].
	(hereType == #string or: [
		hereType == #literal or: [hereType == #character]])
		ifTrue: [
			parseNode := encoder encodeLiteral: self advanceWithCr.
			^ true].
	
	hereType == #litVec ifTrue: [
		parseNode := encoder encodeLitQuote: self advanceWithCr byteArray: false.
		^ true].
	hereType == #litByteVec ifTrue: [
		parseNode := encoder encodeLitQuote: self advanceWithCr byteArray: true.
		^ true].
	hereType == #number ifTrue: [
		parseNode := encoder encodeNumber: self advanceWithCr.
		^ true].
	here == Character cr ifTrue: [
		self advanceWithCr.
		^ true].
	(here == #- and: [
		tokenType == #number and: [1 + hereEnd = mark]])
		ifTrue: [
			self advanceWithCr.
			parseNode := encoder encodeLiteral: self advanceWithCr negated.
			^ true].
	"end of modification"
	^ false