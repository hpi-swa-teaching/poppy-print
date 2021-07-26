format
formatString: aString class: aClass noPattern: aBoolean notifying: anObject

	| formatter methodNode formattedSource originalLabelPositions formattedLabelPositions |
	self halt.
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
	
	formatter := self new initForNode: methodNode.
	methodNode accept: formatter.
	"handle nonFormatting Labels"
	formattedSource := formatter contents.
	originalLabelPositions := self findAllNonFormattingLabels: aString.
	formattedLabelPositions := self findAllNonFormattingLabels: formattedSource.
	
	formattedLabelPositions ifNotEmpty: [
		formattedSource := self
			combineStringsUsingLabels: formattedSource
			and: aString
			formattedLabels: formattedLabelPositions
			originalLabels: originalLabelPositions].
	formattedLabelPositions ifEmpty: [formattedSource := self clearOutStopLabels: formattedSource].
	^ aBoolean
		ifTrue: [self stripMethodPattern: formatter contents]
		ifFalse: [formattedSource]