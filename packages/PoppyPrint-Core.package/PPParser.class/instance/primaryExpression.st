expression types
primaryExpression

	"based on: Parser >> primaryExpression"
	hereType == #word ifTrue: [
		parseNode := self variable.
		(parseNode isUndefTemp and: [self interactive])
			ifTrue: [self queryUndefined].
		parseNode nowHasRef.
		^ true].
	hereType == #leftBracket ifTrue: [
		self advance.
		self blockExpression.
		^ true].
	hereType == #leftBrace ifTrue: [
		self braceExpression.
		^ true].
	hereType == #leftParenthesis ifTrue: [
		self advance.
		self expression ifFalse: [^ self expected: 'expression'].
		(self match: #rightParenthesis)
			ifFalse: [^ self expected: 'right parenthesis'].
		^ true].
	(hereType == #string or: [
		hereType == #literal or: [hereType == #character]])
		ifTrue: [
			parseNode := encoder encodeLiteral: self advance.
			^ true].
	"modification"
	hereType == #litVec ifTrue: [
		parseNode := encoder encodeLitQuote: self advance byteArray: false.
		^ true].
	hereType == #litByteVec ifTrue: [
		parseNode := encoder encodeLitQuote: self advance byteArray: true.
		^ true].
	hereType == #number ifTrue: [
		parseNode := encoder encodeNumber: self advance.
		^ true].
	"end of modification"
	(here == #- and: [
		tokenType == #number and: [1 + hereEnd = mark]])
		ifTrue: [
			self advance.
			parseNode := encoder encodeLiteral: self advance negated.
			^ true].
	^ false