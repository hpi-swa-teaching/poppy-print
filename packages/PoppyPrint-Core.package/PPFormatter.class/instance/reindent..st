printing
reindent: aStringAndIndentPair

	| text currentIndent |
	self example: 'same' receiver: [PPFormatter new indent: 2] args: [{({'test
		a
		b
		c'. 2})}].
	self example: 'more' receiver: [PPFormatter new indent: 3] args: [{({'test
		a
		b
		c'. 2})}].
	self example: 'less' receiver: [PPFormatter new indent: 1] args: [{({'test
		a
		b
		c'. 2})}].
	
	text := aStringAndIndentPair first.
	currentIndent := aStringAndIndentPair second.
	currentIndent ~= indent
		ifTrue: [ | lines |
			lines := text lines.
			2
				to: lines size
				do: [:index | 
					lines
						at: index
						put: (currentIndent > indent
							ifTrue: [(lines at: index) allButFirst: currentIndent - indent]
							ifFalse: [(String new: indent - currentIndent withAll: Character tab), (lines at: index)])].
			text := lines joinSeparatedBy: Character cr].
	^ text