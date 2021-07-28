format
formatMethod: aMethod

	| formattedSource originalSource index |
	originalSource := aMethod getSourceFromFile string.
	index := originalSource findString: self doNotFormatLabel.
	index > 0
		ifFalse: [
			formattedSource := self
				formatString: originalSource
				class: aMethod methodClass
				noPattern: false]
		ifTrue: [formattedSource := originalSource].
	
	originalSource ~= formattedSource
		ifTrue: [aMethod methodClass compile: formattedSource]