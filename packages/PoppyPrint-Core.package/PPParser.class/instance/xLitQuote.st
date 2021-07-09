as yet unclassified
xLitQuote
	"Symbols and vectors: #(1 (4 5) 2 3) #ifTrue:ifFalse: #'abc'."

	| start |
	start := mark.
	self step.
	"litQuote"
	self scanToken.
	tokenType == #leftParenthesis
		ifTrue: [
			self
				scanToken;
				scanLitVec.
			mark := start + 1.
			tokenType == #doIt
				ifTrue: [self offEnd: 'Unmatched parenthesis'].
			tokenType := #litVec]
		ifFalse: [
			tokenType == #leftBracket
				ifTrue: [
					self
						scanToken;
						scanLitByteVec.
					mark := start + 1.
					tokenType == #doIt ifTrue: [self offEnd: 'Unmatched bracket'].
					tokenType := #litByteVec]
				ifFalse: [
					(tokenType == #word or: [
						tokenType == #keyword or: [tokenType == #colon]])
						ifTrue: [self scanLitWord]
						ifFalse: [
							(tokenType == #string or: [tokenType == #verticalBar])
								ifTrue: [token := token asSymbol]
								ifFalse: [
									tokenType == #binary ifFalse: [
										(token isCharacter and: [
											tokenType ~~ #character and: [self class prefAllowUnicharSymbol]])
											ifTrue: [token := token asSymbol]
											ifFalse: [self notify: 'Invalid literal character' at: start + 1]]]].
					tokenType := #literal]].
	mark := start
	"#(Pen)
	#Pen
	#'Pen'
	"