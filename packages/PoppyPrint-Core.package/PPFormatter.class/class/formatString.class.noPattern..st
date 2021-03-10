format
formatString: aString class: aClass noPattern: aBoolean

	| formatter node methodNode |
	self example: 'string test' receiver: [PPFormatter] args: [{'self halt; yourself'. UndefinedObject. true}].
	
	methodNode := PPParser new parse: aString codeWithEmptyLineMarkers class: aClass noPattern: aBoolean notifying: nil ifFail: nil.
	node := aBoolean ifTrue: [methodNode body statements first expr] ifFalse: [methodNode].
	formatter := self new initForNode: node.
	node accept: formatter.
	^ formatter contents