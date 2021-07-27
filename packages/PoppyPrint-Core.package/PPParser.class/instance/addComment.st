private
addComment

	"based on: Parser >> addComment"
	parseNode ~~ nil ifTrue: [
		"modification"
		currentComment ifNotNil: [
			parseNode comment: (parseNode comment
				ifNotNil: [parseNode comment, currentComment]
				ifNil: [currentComment])].
				"end of modification"
		currentComment := nil]