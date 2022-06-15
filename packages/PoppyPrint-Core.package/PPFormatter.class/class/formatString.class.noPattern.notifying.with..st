format
formatString: aString class: aClass noPattern: aBoolean notifying: anObject with: aPPFormatterConfig

	| formatter methodNode |
	self
		example: 'string test'
		receiver: [PPFormatter]
		args: [{'self halt; yourself'. UndefinedObject. true. nil}].
	
	methodNode := PPParser new
		encoderClass: PPFormatEncoder;
		parse: (aString string codeWithEmptyLineMarkersNoPattern: aBoolean)
			class: aClass
			noPattern: aBoolean
			notifying: anObject
			ifFail: nil.
	
	formatter := self new
		initForNode: methodNode;
		config: aPPFormatterConfig.
	methodNode accept: formatter.
	^ aBoolean ifTrue: [self stripMethodPattern: formatter contents] ifFalse: [formatter contents]