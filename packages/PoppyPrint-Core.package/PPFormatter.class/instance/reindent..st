printing
reindent: aStringAndIndentPair

	| text currentIndent |
	text := aStringAndIndentPair first.
	currentIndent := aStringAndIndentPair second.
	currentIndent ~= self indent ifTrue: [ | lines |
		lines := text lines.
		2 to: lines size do: [:index |
			lines at: index put: (currentIndent > self indent
				ifTrue: [(lines at: index) allButFirst: currentIndent - self indent]
				ifFalse: [(String new: self indent - currentIndent withAll: Character tab), (lines at: index)])].
		text := lines joinSeparatedBy: Character cr].
	^ text