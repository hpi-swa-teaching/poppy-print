format
formatMethod: aMethod

	| formattedSource originalSource originalLabelPositions formattedLabelPositions |
	originalSource := aMethod getSourceFromFile string.
	formattedSource := self formatString: originalSource class: aMethod methodClass noPattern: false.
	
	originalLabelPositions := self findAllNonFormattingLabels: originalSource.
	formattedLabelPositions := self findAllNonFormattingLabels: formattedSource.
	
	formattedLabelPositions ifNotEmpty: [
		formattedSource := self
			combineStringsUsingDicts: formattedSource
			and: originalSource
			firstLabels: formattedLabelPositions
			secondLabels: originalLabelPositions].
	
	originalSource ~= formattedSource ifTrue: [aMethod methodClass compile: formattedSource]