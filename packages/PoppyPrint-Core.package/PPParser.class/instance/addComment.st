private
addComment

	parseNode ~~ nil ifTrue: [
		currentComment ifNotNil: [
			parseNode comment: (parseNode comment ifNotNil: [parseNode comment, currentComment] ifNil: [currentComment])].
		currentComment := nil]