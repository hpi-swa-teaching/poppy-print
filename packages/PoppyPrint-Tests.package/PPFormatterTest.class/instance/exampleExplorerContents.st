examples
exampleExplorerContents

	| tempNames |
	tempNames := self tempNames.
	^ (self class allInstVarNames asOrderedCollection withIndexCollect: [:each :index |
		ObjectExplorerWrapper
			with: (self instVarAt: index)
			name: each
			model: self]), ((1 to: self basicSize) collect: [:index |
		ObjectExplorerWrapper
			with: (self at: index)
			name: (tempNames
				at: index
				ifPresent: [:name | '[{1}]' format: {name}]
				ifAbsent: [index asString])
			model: self])