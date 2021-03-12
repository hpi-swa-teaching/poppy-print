format
formatString: aString class: aClass noPattern: aBoolean notifying: anObject

	| formatter node methodNode |
	self example: 'string test' receiver: [PPFormatter] args: [{'self halt; yourself'. UndefinedObject. true. nil}].
	
	methodNode := PPParser new
		encoderClass: PPFormatEncoder;
		parse: (aString string codeWithEmptyLineMarkersNoPattern: aBoolean)
		class: aClass
		noPattern: aBoolean
		notifying: anObject
		ifFail: nil.
	
	node := aBoolean ifTrue: [methodNode body statements first] ifFalse: [methodNode].
	formatter := self new initForNode: node.
	node accept: formatter.
	^ formatter contents