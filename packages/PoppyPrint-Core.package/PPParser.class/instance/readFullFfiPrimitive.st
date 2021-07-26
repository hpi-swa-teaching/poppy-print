helper
readFullFfiPrimitive
	"String."

	[aheadChar ~= $>] whileTrue: [
		(hereChar == $')
		ifTrue: [buffer nextPut: $'.self step]	
	 	ifFalse: [buffer nextPut: self step]].
	token := buffer contents.
	tokenType := #string.
	self step.
	self advance.
	"self step."
	
	"
	self step.
	buffer reset.
	[hereChar == $' 
		and: [aheadChar == $' 
				ifTrue: [self step. false]
				ifFalse: [true]]]
		whileFalse: 
			[hereChar == DoItCharacter
				ifTrue: [^self offEnd: 'Unmatched string quote'].
			buffer nextPut: self step].
	self step.
	token := buffer contents.
	tokenType := #string"