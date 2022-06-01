format
formatMethod: aMethod

	| formattedSource originalSource |
	originalSource := aMethod getSourceFromFile string.
	formattedSource := self formatString: originalSource class: aMethod methodClass noPattern: false.
	
	formattedSource := PPWindowFormatter new formatToStandardWindowWidth: formattedSource.
	
	originalSource ~= formattedSource ifTrue: [aMethod methodClass compile: formattedSource]