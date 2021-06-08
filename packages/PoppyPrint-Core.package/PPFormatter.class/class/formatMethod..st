format
formatMethod: aMethod

	| formattedSource originalSource |
	originalSource := aMethod getSourceFromFile string.
	formattedSource := self formatString: originalSource class: aMethod methodClass noPattern: false.

	originalSource ~= formattedSource ifTrue: [aMethod methodClass compile: formattedSource]