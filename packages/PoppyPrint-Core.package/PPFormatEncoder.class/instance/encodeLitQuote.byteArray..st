encoding
encodeLitQuote: object byteArray: aBoolean

	|node|
	node := self name: object key: object class: PPLitQuoteNode type: LdLitType set: litSet.
	node isByteArray: aBoolean.
	^node